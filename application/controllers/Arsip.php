<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Arsip extends CI_Controller
{
	private $service_name;

	public function __construct()
	{
		parent::__construct();
		is_logged_in();
		$this->service_name = 'kategori';
		$this->load->model('arsip_model');
		$this->load->model('base_model');
		$this->load->library('Dompdf_lib');
	}

	public function index()
	{
		redirect("$this->service_name/kelurahan", 'refresh');
	}

	public function kelurahan($kelurahan = null)
	{
		if (!(bool)$kelurahan) {
			redirect('arsip/kelurahan/wonoasih', 'refresh');
		}

		$role = $this->session->userdata('role');

		if ($kelurahan != $role && $role != 'admin') {
			redirect("arsip/kelurahan/$role", 'refresh');
		}

		$data['data_result'] = $this->arsip_model->get_arsip_by_kelurahan($kelurahan);
		$data['year_arsip']  = $this->arsip_model->get_year_arsip($kelurahan);
		$data['title'] 		 = 'Arsip ' . ucfirst($kelurahan);
		$data['role']  		 = $this->session->userdata('role');
		$data['kategori']    = $this->base_model->get_all('kategori');
		$data['kelurahan']   = $kelurahan;

		$this->load->view('arsip/index', $data);
	}

	public function insert()
	{
		if ($this->input->server('REQUEST_METHOD') !== 'POST') {
			redirect('arsip/kelurahan');
		}

		$kelurahan    = trim($this->input->post('kelurahan', true));

		$data = [
			'id_user'      => trim($this->session->userdata('id_user', true)),
			'id_kategori'  => trim($this->input->post('id_kategori', true)),
			'nama_dokumen' => trim($this->input->post('nama_dokumen', true)),
			'deskripsi'    => trim($this->input->post('deskripsi', true)),
		];

		$this->load->library('upload');
		$data['file_path'] = upload_file('dokumen');

		$this->base_model->insert('arsip', $data);
		set_toasts('Data arsip berhasil disimpan', 'success');
		redirect("arsip/kelurahan/$kelurahan", 'refresh');
	}

	public function edit()
	{
		if ($this->input->server('REQUEST_METHOD') !== 'POST') {
			redirect('pemilihan');
		}

		$this->load->library('upload');

		$kelurahan = $this->input->post('kelurahan');
		$id_arsip = $this->input->post('id_arsip');

		$data = [
			'id_user'      => trim($this->session->userdata('id_user', true)),
			'id_kategori'  => trim($this->input->post('id_kategori', true)),
			'nama_dokumen' => trim($this->input->post('nama_dokumen', true)),
			'deskripsi'    => trim($this->input->post('deskripsi', true)),
		];

		$file_path = $this->arsip_model->get_by_id($id_arsip)->row('file_path');

		if ($_FILES['dokumen']['name']) {
			unlink("./dokumen/$file_path");
			$data['file_path'] = upload_file('dokumen');
		}

		$this->base_model->update('arsip', $data, $id_arsip);
		set_toasts('Data arsip berhasil diupdate', 'success');
		redirect("arsip/kelurahan/$kelurahan", 'refresh');
	}

	public function delete($kelurahan = null, $id_arsip = null)
	{
		if (is_null($kelurahan) || is_null($id_arsip)) {
			show_404();
		}

		$arsip = $this->arsip_model->get_by_id($id_arsip);

		if ((bool)$arsip->row('status_validasi')) {
			set_toasts('Tidak dapat menghapus Arsip yang telah tervalidasi.', 'danger');
			redirect("arsip/kelurahan/$kelurahan");
		}

		unlink("./dokumen/" . $arsip->row('file_path'));


		$this->base_model->delete('arsip', $id_arsip);
		set_toasts('Data arsip berhasil dihapus', 'success');
		redirect("arsip/kelurahan/$kelurahan", 'refresh');
	}

	public function validate($type = null, $id_arsip = null, $kelurahan = null)
	{
		if (is_null($type) || is_null($id_arsip) || is_null($kelurahan)) {
			show_404();
		}

		if (!($type == 'approve') && !($type == 'cancel')) {
			show_404();
		}

		$is_exist = !is_null($this->base_model->get_one_data_by('arsip', 'id_arsip', $id_arsip));

		if (!$is_exist) {
			show_404();
		}

		$status_validasi = $type == 'approve' ? 1 : 0;

		$result = $this->arsip_model->validate_arsip($id_arsip, $status_validasi);

		if ($result['status']) {
			set_toasts($result['message'], 'success');
		} else {
			set_toasts($result['message'], 'danger');
		}

		redirect("arsip/kelurahan/$kelurahan", 'refresh');
	}

	public function report($kelurahan = null, $tahun = null)
	{

		if (is_null($kelurahan) || is_null($tahun)) {
			show_404();
		}

		$data['data_result'] = $this->arsip_model->get_arsip_by_kelurahan_report('wonoasih', $tahun);
		$data['kelurahan'] = $kelurahan;
		$data['tahun'] = $tahun;
		$html = $this->load->view('arsip/report', $data, true);

		// Atur DOMPDF
		$this->dompdf_lib->loadHtml($html);
		$this->dompdf_lib->setPaper('A4', 'portrait');
		$this->dompdf_lib->render();

		// Output file PDF
		$this->dompdf_lib->stream("laporan-kel-$kelurahan-$tahun.pdf", array("Attachment" => 0));
	}
}
