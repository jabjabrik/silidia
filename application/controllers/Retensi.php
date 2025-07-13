<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Retensi extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		is_logged_in();
		$this->load->model('retensi_model');
		$this->load->model('base_model');
	}

	public function index()
	{
		$type = htmlspecialchars($this->input->get('type', TRUE));
		if (!$type) redirect('dashboard');
		if ($type != 'kecamatan' && $type != 'kelurahan') redirect('dashboard');

		$data['data_result'] = $this->retensi_model->get_arsip($type);
		$data['role'] = $this->session->userdata('role');
		$data['title'] = 'Retensi Arsip ' . ucfirst($type);
		$data['type'] = $type;
		$this->load->view('retensi/index', $data);
	}

	public function musnah()
	{
		$type = htmlspecialchars($this->input->get('type', TRUE));
		if (!$type) redirect('dashboard');
		if ($type != 'kecamatan' && $type != 'kelurahan') redirect('dashboard');

		$data['data_result'] = $this->retensi_model->get_arsip_musnah($type);
		$data['role'] = $this->session->userdata('role');
		$data['title'] = 'Retensi Arsip ' . ucfirst($type);
		$data['type'] = $type;
		$this->load->view('retensi/musnah', $data);
	}

	public function insert()
	{
		$this->load->library('upload');
		$type = $this->input->post('type', true);
		$kode_ba = $this->input->post('kode_ba', true);


		$ba = $this->base_model->get_one_data_by('ba', 'kode_ba', $kode_ba);
		if ($ba) {
			set_toasts('Kode Berita Acara sudah ada', 'danger');
			redirect("retensi?type=$type");
		}

		$data_ba = [
			'kode_ba' => $kode_ba,
			'tanggal_ba' => trim($this->input->post('tanggal_ba', true)),
			'file_ba' => upload_file('file_ba'),
		];

		$this->db->insert('ba', $data_ba);
		$id_ba =  $this->db->insert_id();

		$list_id_arsip = explode(",", $this->input->post('id_arsip'));

		foreach ($list_id_arsip as $item) {
			$data_ba = [
				'id_ba' => $id_ba,
				'id_arsip' => $item
			];
			$this->base_model->insert('ba_detail', $data_ba);
		}

		set_toasts('Data berhasil disimpan', 'success');
		redirect("retensi?type=$type");
	}

	public function edit()
	{
		$id_arsip = $this->input->post('id_arsip');
		$type = $this->input->post('type');

		$data = [
			'tanggal_retensi'  => trim($this->input->post('tanggal_retensi', true)),
			'status_retensi'  => trim($this->input->post('status_retensi', true)),
		];

		$this->base_model->update('arsip', $data, $id_arsip);
		set_toasts('Data retensi berhasil diupdate', 'success');
		redirect("retensi?type=$type");
	}

	public function delete($id_ba = null, $type = null)
	{
		if (is_null($id_ba) || is_null($type)) show_404();

		$ba = $this->base_model->get_one_data_by('ba', 'id_ba', $id_ba);

		if (!$ba) {
			set_toasts('Data Berita Acara tidak ditemukan.', 'danger');
			redirect("retensi/musnah?type=$type", 'refresh');
		}

		unlink("dokumen/$ba->file_ba");


		$this->db->delete('ba_detail', ['id_ba' => $id_ba]);
		$this->db->delete('ba', ['id_ba' => $id_ba]);
		set_toasts('Data Berita Acara berhasil dihapus', 'success');
		redirect("retensi/musnah?type=$type", 'refresh');
	}
}
