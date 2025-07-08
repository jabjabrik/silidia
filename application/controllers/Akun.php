<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Akun extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		is_logged_in();
		$this->load->library('form_validation');
		$this->load->model('base_model');
	}

	public function index()
	{
		$id_user = $this->session->userdata('id_user');
		$data['user'] = $this->base_model->get_one_data_by('user', 'id_user', $id_user);
		$data['title'] = 'Setting User';
		$this->load->view('akun/index', $data);
	}

	public function edit_user()
	{
		$id_user = $this->session->userdata('id_user');
		$username = $this->input->post("username");
		$data = [
			"nama_user" => $this->input->post("nama_user"),
			"username" => $username,
		];

		$user_username = $this->base_model->get_one_data_by('user', 'username', $username);
		$user_id = $this->base_model->get_one_data_by('user', 'id_user', $id_user);

		if ((bool)$user_username && !($user_id->username == $username)) {
			set_toasts("Username '$username' telah terpakai, Mohon gunakan username baru.", 'danger');
			redirect('akun');
		}

		$this->base_model->update('user', $data, $id_user);
		set_toasts('Data user berhasil di update', 'success');
		redirect('akun');
	}

	public function password()
	{
		$this->form_validation->set_rules('password1', 'Password 1', 'trim|callback_validate_password1');
		$this->form_validation->set_rules('password2', 'Password 2', 'trim|callback_validate_password2');
		$this->form_validation->set_rules('password3', 'Password 3', 'trim|callback_validate_password3');

		if (!$this->form_validation->run()) {
			$data['title'] = 'Ganti Password';
			$this->load->view('akun/password', $data);
			return;
		}

		$id_user = $this->session->userdata('id_user');
		$password2 = $this->input->post("password2");

		$data = [
			"password" => password_hash($password2, PASSWORD_DEFAULT),
		];

		$this->base_model->update('user', $data, $id_user);
		set_toasts('Password berhasil di update', 'success');
		redirect('akun/password');
	}

	public function validate_password1($password)
	{
		if (empty($password)) {
			$this->form_validation->set_message('validate_password1', 'Silahkan masukan password lama');
			return FALSE;
		}

		$id_user = $this->session->userdata('id_user');
		$user = $this->base_model->get_one_data_by("user", "id_user", $id_user);

		if (!password_verify($password, $user->password)) {
			$this->form_validation->set_message('validate_password1', 'Password salah');
			return FALSE;
		}

		return TRUE;
	}

	public function validate_password2($password)
	{
		if (empty($password)) {
			$this->form_validation->set_message('validate_password2', 'Silahkan masukan password baru');
			return FALSE;
		}

		return TRUE;
	}

	public function validate_password3($password)
	{
		if (empty($password)) {
			$this->form_validation->set_message('validate_password3', 'Silahkan masukan konfirmasi password baru');
			return FALSE;
		}

		if ($this->input->post("password2") !== $password) {
			$this->form_validation->set_message('validate_password3', 'Konfirmasi password tidak sesuai');
			return FALSE;
		}

		return TRUE;
	}
}
