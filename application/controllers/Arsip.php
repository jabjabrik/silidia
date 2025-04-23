<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Arsip extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		is_logged_in();
		$this->load->model('arsip_model');
		$this->load->model('base_model');
		$this->load->model('kategori_model');
		$this->load->library('Dompdf_lib');
	}

	public function index()
	{
		$id_user = htmlspecialchars($this->input->get('id', TRUE));
		if (!(bool)$id_user) {
			show_404();
		}

		$is_exist = !is_null($this->base_model->get_one_data_by('user', 'id_user', $id_user));

		if (!$is_exist || $id_user == '1' || $id_user == '2') show_404();

		$id_user_session = $this->session->userdata('id_user');
		$role = $this->session->userdata('role');

		if ($id_user_session != $id_user && $role != 'admin' && $role != 'validator') {
			redirect("arsip?id=$id_user_session", 'refresh');
		}

		$data['data_result'] = $this->arsip_model->get_arsip($id_user);
		$data['year_arsip']  = $this->arsip_model->get_year_arsip($id_user);

		$data['session_role']  		 = $this->session->userdata('role');
		$data['role']    = $data['data_result'][0]->role;
		$data['sub_role']    = $data['data_result'][0]->sub_role;

		$data['title'] 		 = 'Arsip ' . ucfirst($data['sub_role']);
		$data['kategori']    = $this->kategori_model->get_sub_kategori();
		$data['id_user']   = $id_user;

		$this->load->view('arsip/index', $data);
	}

	public function insert()
	{
		if ($this->input->server('REQUEST_METHOD') !== 'POST') {
			show_404();
		}

		$id_user = trim($this->input->post('id_user', true));

		$data = [
			'id_user'      => $id_user,
			'id_sub_kategori'  => trim($this->input->post('id_sub_kategori', true)),
			'nama_dokumen' => trim($this->input->post('nama_dokumen', true)),
			'deskripsi'    => trim($this->input->post('deskripsi', true)),
		];

		$this->load->library('upload');
		$data['file_path'] = upload_file('dokumen');

		$this->base_model->insert('arsip', $data);
		set_toasts('Data arsip berhasil disimpan', 'success');
		redirect("arsip?id=$id_user", 'refresh');
	}

	public function edit()
	{
		if ($this->input->server('REQUEST_METHOD') !== 'POST') {
			show_404();
		}

		$id_user = $this->input->post('id_user');
		$id_arsip = $this->input->post('id_arsip');

		$data = [
			'id_sub_kategori'  => trim($this->input->post('id_sub_kategori', true)),
			'nama_dokumen' => trim($this->input->post('nama_dokumen', true)),
			'deskripsi'    => trim($this->input->post('deskripsi', true)),
		];

		$file_path = $this->base_model->get_one_data_by('arsip', 'id_arsip', $id_arsip)->file_path;

		$this->load->library('upload');
		if ($_FILES['dokumen']['name']) {
			unlink("./dokumen/$file_path");
			$data['file_path'] = upload_file('dokumen');
		}

		$this->base_model->update('arsip', $data, $id_arsip);
		set_toasts('Data arsip berhasil diupdate', 'success');
		redirect("arsip?id=$id_user", 'refresh');
	}

	public function delete($id_user = null, $id_arsip = null)
	{
		if (is_null($id_user) || is_null($id_arsip)) {
			show_404();
		}

		$arsip = $this->base_model->get_one_data_by('arsip', 'id_arsip', $id_arsip);

		$is_exist = (bool)$this->base_model->get_one_data_by('arsip', 'id_arsip', $id_arsip);

		if (!$is_exist) {
			set_toasts('Data arsip tidak ditemukan.', 'danger');
			redirect("arsip?id=$id_user", 'refresh');
		}

		if ((bool)$arsip->status_validasi) {
			set_toasts('Tidak dapat menghapus Arsip yang telah tervalidasi.', 'danger');
			redirect("arsip?id=$id_user", 'refresh');
		}

		unlink("./dokumen/" . $arsip->file_path);

		$this->base_model->delete('arsip', $id_arsip);
		set_toasts('Data arsip berhasil dihapus', 'success');
		redirect("arsip?id=$id_user", 'refresh');
	}

	public function validate($type = null, $id_arsip = null, $id_user = null)
	{
		if (is_null($type) || is_null($id_arsip) || is_null($id_user)) {
			show_404();
		}

		if ($type != 'approve' && $type != 'cancel') {
			show_404();
		}

		$is_exist = (bool)$this->base_model->get_one_data_by('arsip', 'id_arsip', $id_arsip);

		if (!$is_exist) {
			set_toasts('Data arsip tidak ditemukan.', 'danger');
			redirect("arsip?id=$id_user", 'refresh');
		}

		$status_validasi = $type == 'approve' ? 1 : 0;

		$this->base_model->update('arsip', ['status_validasi' => $status_validasi], $id_arsip);

		$msg = $status_validasi == 1 ? "Data Arsip Berhasil di Validasi" : "Pembatalan Validasi Berhasil";
		set_toasts($msg, 'success');
		redirect("arsip?id=$id_user", 'refresh');
	}

	public function report($id_user = null, $tahun = null)
	{
		if (is_null($id_user) || is_null($tahun)) {
			show_404();
		}

		$data['data_result'] = $this->arsip_model->get_arsip_report($id_user, $tahun);
		$data['role'] = $data['data_result'][0]->role;
		$data['sub_role'] = $data['data_result'][0]->sub_role;
		$data['tahun'] = $tahun;

		$html = $this->load->view('arsip/report', $data, TRUE);

		// Atur DOMPDF
		$this->dompdf_lib->loadHtml($html);
		$this->dompdf_lib->setPaper('A4', 'portrait');
		$this->dompdf_lib->render();

		// Output file PDF
		$this->dompdf_lib->stream("laporan-" . $data['role'] . "-" . $data['sub_role'] . "-$tahun.pdf", array("Attachment" => 0));
	}
}
