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
        $data['role'] = $this->session->userdata('role');
        $data['kelurahan_arsip'] = $this->dashboard_model->get_total_kelurahan_arsip();
        $data['kategori_arsip'] = $this->dashboard_model->get_total_kategori_arsip($data['role']);

        $this->load->view('dashboard/index', $data);
    }
}
