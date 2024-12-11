<?php

class Dashboard_model extends CI_Model
{
    public function get_total_arsip($role): array
    {
        $query = "SELECT user.id_user, user.sub_role, COUNT(arsip.id_arsip) AS total 
        FROM user
        LEFT JOIN arsip ON user.id_user = arsip.id_user
        WHERE user.role = '$role'
        GROUP BY user.id_user, user.sub_role
        ORDER BY user.id_user";
        $result = $this->db->query($query)->result();
        return $result;
    }

    public function get_total_kategori_arsip($sub_role = null): array
    {
        $where = "";
        if ($sub_role != 'admin' && $sub_role != 'validator') {
            $where .= "WHERE user.sub_role = '$sub_role'";
        }

        $query = "SELECT kategori.nama_kategori, COUNT(arsip.id_arsip) AS total 
        FROM kategori 
        LEFT JOIN arsip ON kategori.id_kategori = arsip.id_kategori 
        JOIN user ON arsip.id_user = user.id_user 
        $where
        GROUP BY kategori.nama_kategori ORDER BY kategori.id_kategori";

        $result = $this->db->query($query)->result();
        return $result;
    }
}
