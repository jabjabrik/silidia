<?php

class Retensi_model extends CI_Model
{
    public function get_arsip(string $type): array
    {
        $query = "SELECT arsip.*, arsip.created_at AS tanggal_upload, user.*, kategori.*, sub_kategori.*, ba.kode_ba
        FROM arsip
        JOIN user ON arsip.id_user = user.id_user 
        JOIN sub_kategori ON arsip.id_sub_kategori = sub_kategori.id_sub_kategori
        JOIN kategori ON sub_kategori.id_kategori = kategori.id_kategori
        LEFT JOIN ba_detail ON arsip.id_arsip = ba_detail.id_arsip
        LEFT JOIN ba ON ba_detail.id_ba = ba.id_ba
        WHERE user.role = '$type' AND arsip.status_validasi = 'tervalidasi'
        ORDER BY user.sub_role, ba.kode_ba, arsip.tanggal_retensi,  user.sub_role";
        return $this->db->query($query)->result();
    }

    public function get_arsip_musnah(string $type): array
    {
        $query = "SELECT  ba.id_ba, ba.kode_ba, ba.tanggal_ba, ba.file_ba,
        GROUP_CONCAT(CONCAT(arsip.kode_arsip, ' ', arsip.nama_dokumen) SEPARATOR '|') AS daftar_dokumen,
        COUNT(arsip.id_arsip) AS jumlah
        FROM ba
        JOIN ba_detail ON ba.id_ba = ba_detail.id_ba
        JOIN arsip ON ba_detail.id_arsip = arsip.id_arsip
        JOIN user ON arsip.id_user = user.id_user 
        WHERE user.role = '$type'
        GROUP BY ba.kode_ba";
        return $this->db->query($query)->result();
    }

    public function get_id_arsip(string $id_ba): array
    {
        $query = "SELECT ba_detail.id_arsip FROM ba
        JOIN ba_detail ON ba.id_ba = ba_detail.id_ba
        WHERE ba.id_ba = '$id_ba'";
        return $this->db->query($query)->result();
    }
}
