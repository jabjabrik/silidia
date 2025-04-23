<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
		$this->load->model('base_model');
		$this->load->model('user_model');
		$this->load->helper('captcha');
	}

	public function index()
	{
		$is_login = $this->session->userdata('is_login');
		if ($is_login) redirect('dashboard');

		$this->form_validation->set_rules('username', 'Username', 'trim|callback_validate_username');
		$this->form_validation->set_rules('password', 'Password', 'trim|callback_validate_password');
		$this->form_validation->set_rules('captcha', 'Captcha', 'callback_validate_captcha');

		if ($this->form_validation->run() == false) {
			$data['title'] = 'Login Page';
			$data['captcha_img'] = $this->_captcha();
			$this->load->view('auth/login', $data);
		} else {
			$username = $this->input->post('username');
			$this->_login($username);
		}
	}

	public function validate_username($username)
	{
		if (empty($username)) {
			$this->form_validation->set_message('validate_username', 'Silahkan masukan username');
			return FALSE;
		}

		$user = $this->base_model->get_one_data_by('user', 'username', $username);

		if (is_null($user)) {
			$this->form_validation->set_message('validate_username', 'Username tidak ditemukan');
			return FALSE;
		}
		return TRUE;
	}

	public function validate_password($password)
	{
		if (empty($password)) {
			$this->form_validation->set_message('validate_password', 'Silahkan masukan password');
			return FALSE;
		}

		$username = $this->input->post('username');
		$user = $this->base_model->get_one_data_by('user', 'username', $username);

		if (is_null($user)) {
			$this->form_validation->set_message('validate_password', '');
			return FALSE;
		}

		// Cek apakah pengguna sudah mencapai batas percobaan login
		$current_time = time();
		$last_attempt_time = strtotime($user->last_login_attempt);

		$time  = 180; // 3mnt
		if ($user->login_attempts >= 10) {
			// Jika 10 kali salah
			if (($current_time - $last_attempt_time) < $time) {
				// kurang dari 3 menit
				$remaining_time = $time - ($current_time - $last_attempt_time);
				$this->form_validation->set_message("validate_password", "Terlalu banyak percobaan login. Silakan coba lagi setelah " . ceil($remaining_time / 60) . " menit.");
				return FALSE;
			} else {
				$this->user_model->reset_login_attempts($user->username);
			}
		}

		if (!password_verify($password, $user->password)) {
			$this->user_model->increment_login_attempts($user->username);
			$this->form_validation->set_message('validate_password', 'Password salah');
			return FALSE;
		}

		return TRUE;
	}

	public function validate_captcha($captcha)
	{
		if (empty($captcha)) {
			$this->form_validation->set_message('validate_captcha', 'Silahkan masukan captcha');
			return FALSE;
		}

		if ($this->session->userdata('captcha_word') !== $captcha) {
			$this->form_validation->set_message('validate_captcha', 'Captcha tidak sesuai');
			return FALSE;
		}
		return TRUE;
	}

	private function _captcha()
	{
		$params = array(
			'img_path'      => './captcha-images/',
			'img_url'       => base_url() . 'captcha-images/',
			'img_width'     => 150,
			'img_height'    => 30,
			'expiration'    => 7200,
			'word_length'   => 5,
			'font_size'     => 25,
			'img_id'        => 'Imageid',
			'pool'          => '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',

			// White background and border, black text and red grid
			'colors'        => array(
				'background'    => array(255, 255, 255),
				'border'        => array(255, 255, 255),
				'text'          => array(0, 0, 0),
				'grid'          => array(255, 40, 40)
			)
		);

		$cap = create_captcha($params);
		$captcha_word = $cap['word'];
		$this->session->set_userdata('captcha_word', $captcha_word);
		return $cap['image'];
	}

	private function _login($username)
	{
		$user = $this->base_model->get_one_data_by('user', 'username', $username);

		$data = [
			'id_user'  	=> $user->id_user,
			'username' 	=> $user->username,
			'nama_user' => $user->nama_user,
			'role'      => $user->role,
			'sub_role'  => $user->sub_role,
			'is_login'  => TRUE,
		];

		$this->session->set_userdata($data);
		redirect('dashboard');
	}

	public function logout()
	{
		$this->session->sess_destroy();
		redirect();
	}
}
