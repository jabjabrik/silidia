<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Arsip extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		is_logged_in();
		$this->load->model('arsip_model');
	}

	public function index()
	{
		redirect('arsip/kelurahan', 'refresh');
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

		$result = $this->arsip_model->get_arsip_by_kelurahan($kelurahan);

		if (!$result['status']) {
			set_toasts($result['message'], 'danger');
		}

		$data['arsip'] 		= $result['data'] ?? [];
		$data['title'] 		= 'Arsip ' . ucfirst($kelurahan);
		$data['role']  		= $this->session->userdata('role');
		$data['kelurahan']  = $kelurahan;
		$this->load->view('arsip/index', $data);
	}

	public function insert()
	{
		if ($this->input->server('REQUEST_METHOD') !== 'POST') {
			redirect('pemilihan');
			return;
		}

		$this->load->library('upload');

		$kelurahan = $this->input->post('kelurahan');
		$id_user = $this->session->userdata('id_user');
		$nama_dokumen = $this->input->post('nama_dokumen');
		$deskripsi = $this->input->post('deskripsi');
		$file_path = upload_file('dokumen', $nama_dokumen);

		$data = [
			'id_user'      => $id_user,
			'nama_dokumen' => $nama_dokumen,
			'deskripsi'    => $deskripsi,
			'file_path'    => $file_path,
		];

		$result = $this->arsip_model->insert_arsip($data);

		if ($result['status']) {
			set_toasts($result['message'], 'success');
		} else {
			set_toasts($result['message'], 'danger');
		}

		redirect("arsip/kelurahan/$kelurahan", 'refresh');
	}

	public function edit()
	{
		if ($this->input->server('REQUEST_METHOD') !== 'POST') {
			redirect('pemilihan');
			return;
		}

		$this->load->library('upload');

		$kelurahan = $this->input->post('kelurahan');
		$id_arsip = $this->input->post('id_arsip');
		$nama_dokumen = $this->input->post('nama_dokumen');
		$deskripsi = $this->input->post('deskripsi');

		$data = [
			'nama_dokumen' => $nama_dokumen,
			'deskripsi'    => $deskripsi,
		];

		$file_path = $this->arsip_model->get_by_id($id_arsip)->row('file_path');

		if ($_FILES['dokumen']['name']) {
			unlink("./dokumen/$file_path");
			$data['file_path'] = upload_file('dokumen', $nama_dokumen);
		}

		$result = $this->arsip_model->update_arsip($id_arsip, $data);

		if ($result['status']) {
			set_toasts($result['message'], 'success');
		} else {
			set_toasts($result['message'], 'danger');
		}

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


		$result = $this->arsip_model->delete_arsip($id_arsip);

		if ($result['status']) {
			set_toasts($result['message'], 'success');
		} else {
			set_toasts($result['message'], 'danger');
		}

		redirect("arsip/kelurahan/$kelurahan", 'refresh');
	}
}
