<?php


class Arsip_model extends CI_Model
{
    public function get_arsip(string $id_user): array
    {

        $query = "SELECT arsip.*, user.role, user.sub_role, sub_kategori.nama_sub_kategori, kategori.nama_kategori
        FROM arsip 
        JOIN user ON arsip.id_user = user.id_user 
        JOIN sub_kategori ON arsip.id_sub_kategori = sub_kategori.id_sub_kategori
        JOIN kategori ON sub_kategori.id_kategori = kategori.id_kategori
        LEFT JOIN ba_detail ON arsip.id_arsip = ba_detail.id_arsip
        WHERE user.id_user = '$id_user' AND ba_detail.id_ba_detail IS NULL
        ORDER BY CASE arsip.status_validasi
            WHEN 'proses' THEN 1
            WHEN 'ditolak' THEN 2
            WHEN 'tervalidasi' THEN 3
            ELSE 4
        END, arsip.id_arsip DESC;";

        $result = $this->db->query($query)->result();
        return $result;
    }

    public function get_year_arsip($id_user): array
    {
        $query = "SELECT DISTINCT YEAR(arsip.created_at) AS tahun FROM arsip
        JOIN user ON arsip.id_user = user.id_user 
        WHERE user.id_user = '$id_user' AND arsip.status_validasi = 'tervalidasi'
        ORDER BY arsip.created_at";
        $result = $this->db->query($query)->result();
        return $result;
    }

    public function get_arsip_report(string $id_user, int $tahun): array
    {
        $query = "SELECT arsip.*, user.role, user.sub_role, kategori.nama_kategori, sub_kategori.nama_sub_kategori 
        FROM arsip 
        JOIN user ON arsip.id_user = user.id_user 
        JOIN sub_kategori ON arsip.id_sub_kategori = sub_kategori.id_sub_kategori
        JOIN kategori ON sub_kategori.id_kategori = kategori.id_kategori
        WHERE user.id_user = '$id_user' AND YEAR(arsip.created_at) = $tahun AND arsip.status_validasi = 'tervalidasi'
        ORDER BY arsip.created_at";

        $result = $this->db->query($query)->result();
        return $result;
    }

    // Ambil arsip berdasarkan user, tahun, dan kategori
    public function get_arsip_report_by_kategori($id_user, $tahun, $id_kategori)
    {
        $query = "SELECT arsip.*, user.role, user.sub_role, kategori.nama_kategori, sub_kategori.nama_sub_kategori 
        FROM arsip 
        JOIN user ON arsip.id_user = user.id_user 
        JOIN sub_kategori ON arsip.id_sub_kategori = sub_kategori.id_sub_kategori
        JOIN kategori ON sub_kategori.id_kategori = kategori.id_kategori
        WHERE user.id_user = ? AND YEAR(arsip.created_at) = ? AND kategori.id_kategori = ? AND arsip.status_validasi = 'tervalidasi'
        ORDER BY arsip.created_at";
        return $this->db->query($query, [$id_user, $tahun, $id_kategori])->result();
    }
}
