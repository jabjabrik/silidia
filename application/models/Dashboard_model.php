<?php

class Dashboard_model extends CI_Model
{
    public function get_total_kelurahan_arsip(): array
    {
        $query = "SELECT user.nama, COUNT(arsip.id_arsip) AS total FROM user
        LEFT JOIN arsip ON user.id_user = arsip.id_user
        WHERE user.role != 'admin' AND user.role != 'validator'
        GROUP BY user.nama ORDER BY user.id_user";
        $result = $this->db->query($query);
        return $result->result();
    }

    public function get_total_kategori_arsip($role = null): array
    {

        $where = "";

        if ($role != 'admin' && $role != 'validator') {
            $where .= "JOIN user ON arsip.id_user = user.id_user WHERE user.role = '$role'";
        }

        $query = "SELECT kategori.nama_kategori, COUNT(arsip.id_arsip) AS total FROM kategori
        LEFT JOIN arsip ON kategori.id_kategori = arsip.id_kategori
        $where
        GROUP BY kategori.nama_kategori
        ORDER BY kategori.id_kategori";

        $result = $this->db->query($query);
        return $result->result();
    }
}
