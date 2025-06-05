<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User extends CI_Controller
{
	private $service_name;

	public function __construct()
	{
		parent::__construct();
		is_logged_in();
		authorize();
		$this->service_name = 'user';
		$this->load->model('base_model');
	}

	public function index()
	{
		$data['data_result']  = $this->base_model->get_all('user');
		$data['title']        = 'User';
		$this->load->view('user/index', $data);
	}

	public function insert()
	{
		$nama_user = trim($this->input->post('nama_user', true));
		$username  = trim($this->input->post('username', true));
		$password  = trim($this->input->post('password', true));
		$role  = trim($this->input->post('role', true));
		$sub_role  = trim($this->input->post('sub_role', true));

		if (strlen($username) < 5) {
			set_toasts('Username harus minimal 5 karakter.', 'danger');
			redirect($this->service_name);
		}

		if (strlen($password) < 8) {
			set_toasts('Password harus minimal 8 karakter.', 'danger');
			redirect($this->service_name);
		}
		if (!preg_match('/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$/', $password)) {
			set_toasts('Password harus mengandung huruf kecil, huruf besar, angka, dan karakter spesial.', 'danger');
			redirect($this->service_name);
		}

		$user_username = $this->base_model->get_one_data_by($this->service_name, 'username', $username);

		if ((bool)$user_username) {
			set_toasts("Username '$username' telah terpakai, Mohon gunakan username baru.", 'danger');
			redirect($this->service_name);
		}

		$user_sub_role = $this->base_model->get_one_data_by($this->service_name, 'sub_role', $sub_role);

		if ((bool)$user_sub_role) {
			set_toasts('Role tidak boleh sama.', 'danger');
			redirect($this->service_name);
		}

		$data = [
			'nama_user' => $nama_user,
			'username' => $username,
			'password' => password_hash($password, PASSWORD_DEFAULT),
			'role' => $role,
			'sub_role' => $sub_role,
		];

		$this->base_model->insert($this->service_name, $data);
		set_toasts('User Berhasil di Dibuat', 'success');
		redirect($this->service_name);
	}

	public function edit()
	{
		$id_user   = trim($this->input->post('id_user', true));
		$nama_user = trim($this->input->post('nama_user', true));
		$username  = trim($this->input->post('username', true));
		$password  = trim($this->input->post('password', true));
		$role  = trim($this->input->post('role', true));
		$sub_role  = trim($this->input->post('sub_role', true));

		$data = [
			'nama_user' => $nama_user,
			'username' => $username,
		];

		if (strlen($username) < 5) {
			set_toasts('Username harus minimal 5 karakter.', 'danger');
			redirect($this->service_name);
		}

		if (!empty($password)) {
			if (strlen($password) < 8) {
				set_toasts('Password harus minimal 8 karakter.', 'danger');
				redirect($this->service_name);
			}
			if (!preg_match('/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$/', $password)) {
				set_toasts('Password harus mengandung huruf kecil, huruf besar, angka, dan karakter spesial.', 'danger');
				redirect($this->service_name);
			}
			$data['password'] = password_hash($password, PASSWORD_DEFAULT);
		}

		$user_username = $this->base_model->get_one_data_by($this->service_name, 'username', $username);
		$user_id = $this->base_model->get_one_data_by($this->service_name, 'id_user', $id_user);

		if ((bool)$user_username && !($user_id->username == $username)) {
			set_toasts("Username '$username' telah terpakai, Mohon gunakan username baru.", 'danger');
			redirect($this->service_name);
		}

		$user_sub_role = $this->base_model->get_one_data_by($this->service_name, 'sub_role', $sub_role);

		if ((bool)$user_sub_role && !($user_id->sub_role == $sub_role)) {
			set_toasts('Role tidak boleh sama.', 'danger');
			redirect($this->service_name);
		}

		if ($role == 'kecamatan' || $role == 'kelurahan') {
			$data["role"] = $role;
			$data["sub_role"] = $sub_role;
		}

		$this->base_model->update($this->service_name, $data, $id_user);
		set_toasts('User Berhasil di Update', 'success');
		redirect($this->service_name);
	}

	public function delete($id_user = null)
	{
		if (is_null($id_user)) redirect('user');

		$user = $this->base_model->get_one_data_by('user', 'id_user', $id_user);
		$is_exist_user_arsip = $this->base_model->get_one_data_by('arsip', 'id_user', $id_user);

		if ($user->role == "admin" || $user->role == "validator") {
			set_toasts("User admin dan validator tidak dapat dihapus", "danger");
			redirect("user");
		}

		if ($is_exist_user_arsip) {
			set_toasts("User tidak dapat dihapus dikarenakan user telah membuat arsip", "danger");
			redirect("user");
		}

		$this->base_model->delete('user', $id_user);
		set_toasts('Data user berhasil dihapus', 'success');
		redirect("user");
	}
}
