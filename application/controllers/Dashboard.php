<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->model('dashboard_model');
    }

    public function index()
    {
        $data['title'] = 'Dashboard';
        $role = $this->session->userdata('role');
        $sub_role = $this->session->userdata('sub_role');
        $data['role'] = $role;
        $data['sub_role'] = $sub_role;
        $data['kecamatan_arsip'] = $this->dashboard_model->get_total_arsip('kecamatan');
        $data['kelurahan_arsip'] = $this->dashboard_model->get_total_arsip('kelurahan');

        $data['kategori_arsip'] = $this->dashboard_model->get_total_kategori_arsip($sub_role);

        $this->load->view('dashboard/index', $data);
    }
}
