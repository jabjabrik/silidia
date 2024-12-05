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
			'nama_kategori' => trim($this->input->post('nama_kategori')),
			'keterangan'    => trim($this->input->post('keterangan')),
		];

		$this->base_model->insert($this->service_name, $data);
		set_toasts("Data $this->service_name berhasil disimpan.", 'success');

		redirect($this->service_name, 'refresh');
	}

	public function edit()
	{
		if ($this->input->server('REQUEST_METHOD') !== 'POST') {
			redirect($this->service_name, 'refresh');
		}

		$id = $this->input->post('id_kategori');

		$data = [
			'nama_kategori' => trim($this->input->post('nama_kategori')),
			'keterangan'    => trim($this->input->post('keterangan')),
		];

		$this->base_model->update($this->service_name, $data, $id);
		set_toasts("Data $this->service_name berhasil diedit.", 'success');
		redirect($this->service_name, 'refresh');
	}

	public function delete($id = null)
	{
		if (is_null($id)) show_404();
		$this->base_model->delete($this->service_name, $id);
		set_toasts("Data $this->service_name berhasil di Hapus", 'success');
		redirect($this->service_name, 'refresh');
	}
}
