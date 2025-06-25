<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Kategori extends CI_Controller
{

	private $service_name;

	public function __construct()
	{
		parent::__construct();
		is_logged_in();
		$this->service_name = 'kategori';
		$this->load->model('base_model');
		$this->load->model('kategori_model');
	}

	public function index()
	{
		$data['title'] 		  = 'Kategori';
		$data['data_result']  = $this->base_model->get_all($this->service_name);
		$data['service_name'] = $this->service_name;
		$data['role']         = $this->session->userdata('role');
		$this->load->view('kategori/index', $data);
	}

	public function insert()
	{
		if ($this->input->server('REQUEST_METHOD') !== 'POST') {
			redirect($this->service_name, 'refresh');
		}

		$data = [
			'kode_kategori' =>  trim($this->input->post('kode_kategori')),
			'nama_kategori' => trim($this->input->post('nama_kategori')),
			'keterangan_kategori'    => trim($this->input->post('keterangan_kategori')),
		];

		$this->base_model->insert($this->service_name, $data);
		set_toasts("Data $this->service_name berhasil disimpan.", 'success');

		redirect($this->service_name, 'refresh');
	}

	public function edit()
	{
		if ($this->input->server('REQUEST_METHOD') !== 'POST') redirect($this->service_name);
		$id_kategori = $this->input->post('id_kategori');

		$data = [
			'kode_kategori' =>  trim($this->input->post('kode_kategori')),
			'nama_kategori' => trim($this->input->post('nama_kategori')),
			'keterangan_kategori'    => trim($this->input->post('keterangan_kategori')),
		];

		$this->base_model->update($this->service_name, $data, $id_kategori);
		set_toasts("Data $this->service_name berhasil diedit.", 'success');
		redirect($this->service_name);
	}

	public function delete($id_kategori = null)
	{
		if (is_null($id_kategori)) show_404();

		$is_exist_sub_kategori = !is_null($this->base_model->get_one_data_by('sub_kategori', 'id_kategori', $id_kategori));

		if ($is_exist_sub_kategori) {
			set_toasts("Kategori tidak dapat dihapus dikarenakan kategori telah terpakai oleh data sub kategori", 'danger');
			redirect($this->service_name);
		}

		$this->base_model->delete($this->service_name, $id_kategori);
		set_toasts("Data $this->service_name berhasil di Hapus", 'success');
		redirect($this->service_name);
	}

	public function sub()
	{
		$data['title'] 		  = 'Sub Kategori';
		$data['data_result']  = $this->kategori_model->get_sub_kategori();
		$data['kategori']  = $this->base_model->get_all('kategori');
		$data['service_name'] = 'sub_kategori';
		$data['role']         = $this->session->userdata('role');
		$this->load->view('kategori/sub', $data);
	}

	public function sub_insert()
	{
		if ($this->input->server('REQUEST_METHOD') !== 'POST') {
			redirect('kategori/sub', 'refresh');
		}

		$data = [
			'id_kategori' => trim($this->input->post('id_kategori')),
			'nama_sub_kategori' => trim($this->input->post('nama_sub_kategori')),
			'keterangan_sub_kategori' => trim($this->input->post('keterangan_sub_kategori')),
		];

		$this->base_model->insert('sub_kategori', $data);
		set_toasts("Data Sub Kategori berhasil disimpan.", 'success');

		redirect('kategori/sub', 'refresh');
	}

	public function sub_edit()
	{
		if ($this->input->server('REQUEST_METHOD') !== 'POST') {
			redirect('kategori/sub', 'refresh');
		}

		$id_sub_kategori = $this->input->post('id_sub_kategori');

		$data = [
			'id_kategori' => trim($this->input->post('id_kategori')),
			'nama_sub_kategori' => trim($this->input->post('nama_sub_kategori')),
			'keterangan_sub_kategori' => trim($this->input->post('keterangan_sub_kategori')),
		];

		$this->base_model->update('sub_kategori', $data, $id_sub_kategori);
		set_toasts("Data Sub Kategori berhasil diedit.", 'success');
		redirect('kategori/sub', 'refresh');
	}

	public function sub_delete($id_sub_kategori = null)
	{
		if (is_null($id_sub_kategori)) show_404();

		$is_exist_arsip = !is_null($this->base_model->get_one_data_by('arsip', 'id_sub_kategori', $id_sub_kategori));

		if ($is_exist_arsip) {
			set_toasts("Kategori tidak dapat dihapus dikarenakan kategori telah terpakai oleh data arsip", 'danger');
			redirect('kategori/sub');
		}

		$this->base_model->delete('sub_kategori', $id_sub_kategori);
		set_toasts("Data Sub Kategori berhasil di Hapus", 'success');
		redirect('kategori/sub');
	}
}
