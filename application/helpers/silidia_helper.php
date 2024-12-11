<?php

function is_logged_in()
{
    $CI = &get_instance();
    if (!$CI->session->userdata('is_login')) {
        redirect();
    }
}

function get_role_kecamatan_kelurahan($role): array
{
    $query = "SELECT user.id_user, user.sub_role FROM user WHERE user.role = '$role'";
    $CI = &get_instance();
    return $CI->db->query($query)->result();
}

function authorize($_role = 'admin')
{
    $CI = &get_instance();
    $role = $CI->session->userdata('role');
    if ($role !=  $_role  && !($role == 'admin')) redirect('dashboard');
}

function dd($data)
{
    var_dump($data);
    die();
}


function set_toasts($message, $color)
{
    $CI = get_instance();
    $params = array(
        'message' => $message,
        'color' => $color
    );
    $CI->session->set_flashdata('toasts', $params);
}

function upload_file($file_upload)
{
    $CI = get_instance();
    $file_name = $_FILES[$file_upload]['name'];

    $config['upload_path'] = "./dokumen/";
    $config['file_name'] = time() . "_" . $file_name;
    $config['allowed_types'] = '*';
    $config['file_ext_tolower'] = TRUE;

    $CI->upload->initialize($config);
    if (!$CI->upload->do_upload($file_upload)) {
        var_dump($CI->upload->display_errors());
        die();
    } else {
        return $CI->upload->data()['file_name'];
    }
}
