<?php

class Kategori_model extends CI_Model
{
    public function get_sub_kategori(): array
    {
        $query = "SELECT kategori.*, sub_kategori.*
        FROM sub_kategori
        JOIN kategori ON sub_kategori.id_kategori = kategori.id_kategori";

        $result = $this->db->query($query)->result();
        return $result;
    }

    // Ambil kategori (kode & nama) yang pernah dipakai arsip pada tahun tertentu
    public function get_kategori_by_tahun($id_user, $tahun)
    {
        $query = "SELECT DISTINCT kategori.id_kategori, kategori.kode_kategori, kategori.nama_kategori
            FROM arsip
            JOIN sub_kategori ON arsip.id_sub_kategori = sub_kategori.id_sub_kategori
            JOIN kategori ON sub_kategori.id_kategori = kategori.id_kategori
            WHERE arsip.id_user = ? AND YEAR(arsip.created_at) = ? AND arsip.status_validasi = 'tervalidasi'";
        return $this->db->query($query, [$id_user, $tahun])->result();
    }
}
