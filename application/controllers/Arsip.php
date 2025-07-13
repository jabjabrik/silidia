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

		$user = $this->base_model->get_one_data_by('user', 'id_user', $id_user);

		if (!$user || $id_user == '1' || $id_user == '2') show_404();

		$id_user_session = $this->session->userdata('id_user');
		$role = $this->session->userdata('role');

		if ($id_user_session != $id_user && $role != 'admin' && $role != 'validator') {
			redirect("arsip?id=$id_user_session", 'refresh');
		}

		$data['data_result'] = $this->arsip_model->get_arsip($id_user);
		$data['year_arsip']  = $this->arsip_model->get_year_arsip($id_user);

		$data['session_role']  		 = $this->session->userdata('role');
		$data['role']    = $user->role;
		$data['sub_role']    = $user->sub_role;

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
			'kode_arsip'  => trim($this->input->post('kode_arsip', true)),
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
			'kode_arsip'  => trim($this->input->post('kode_arsip', true)),
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

		if ($arsip->status_validasi == "tervalidasi") {
			set_toasts('Tidak dapat menghapus Arsip yang telah tervalidasi.', 'danger');
			redirect("arsip?id=$id_user", 'refresh');
		}

		unlink("./dokumen/" . $arsip->file_path);

		$this->base_model->delete('arsip', $id_arsip);
		set_toasts('Data arsip berhasil dihapus', 'success');
		redirect("arsip?id=$id_user", 'refresh');
	}

	public function validate($status_validasi = null, $id_arsip = null, $id_user = null)
	{
		if (is_null($status_validasi) || is_null($id_arsip) || is_null($id_user)) {
			show_404();
		}

		if ($status_validasi != 'tervalidasi' && $status_validasi != 'ditolak' && $status_validasi != 'proses') {
			show_404();
		}

		$is_exist = (bool)$this->base_model->get_one_data_by('arsip', 'id_arsip', $id_arsip);

		if (!$is_exist) {
			set_toasts('Data arsip tidak ditemukan.', 'danger');
			redirect("arsip?id=$id_user", 'refresh');
		}

		$this->base_model->update('arsip', ['status_validasi' => $status_validasi], $id_arsip);

		set_toasts("Status arsip berhasil diproses", "success");
		redirect("arsip?id=$id_user", 'refresh');
	}

	public function tolak()
	{
		$id_arsip = $this->input->post('id_arsip');
		$id_user = $this->input->post('id_user');

		$data = [
			'status_validasi' => 'ditolak',
			'pesan_penolakan' => $this->input->post('pesan_penolakan'),
		];

		$this->base_model->update('arsip', $data, $id_arsip);

		set_toasts("Data arsip berhasil ditolak", "success");
		redirect("arsip?id=$id_user", 'refresh');
	}

	// Ambil kategori berdasarkan tahun arsip
	public function get_kategori_by_tahun($id_user = null, $tahun = null)
	{
		if (is_null($id_user) || is_null($tahun)) {
			show_404();
		}
		$this->load->model('kategori_model');
		$result = $this->kategori_model->get_kategori_by_tahun($id_user, $tahun);
		header('Content-Type: application/json');
		echo json_encode($result);
	}

	// Ubah: public function report($id_user = null, $tahun = null)
	public function report($id_user = null, $tahun = null, $id_kategori = null)
	{
		if (is_null($id_user) || is_null($tahun) || is_null($id_kategori)) {
			show_404();
		}
		if ($id_kategori === 'all') {
			$data['data_result'] = $this->arsip_model->get_arsip_report($id_user, $tahun);
		} else {
			$data['data_result'] = $this->arsip_model->get_arsip_report_by_kategori($id_user, $tahun, $id_kategori);
		}
		if (empty($data['data_result'])) show_404();
		$data['role'] = $data['data_result'][0]->role;
		$data['sub_role'] = $data['data_result'][0]->sub_role;
		$data['tahun'] = $tahun;
		$data['kategori'] = ($id_kategori === 'all') ? 'Semua Kategori' : $data['data_result'][0]->nama_kategori;
		$html = $this->load->view('arsip/report', $data, TRUE);
		$this->dompdf_lib->loadHtml($html);
		$this->dompdf_lib->setPaper('A4', 'landscape');
		$this->dompdf_lib->render();
		$this->dompdf_lib->stream("laporan-" . $data['role'] . "-" . $data['sub_role'] . "-{$data['kategori']}-{$tahun}.pdf", array("Attachment" => 0));
	}
}
