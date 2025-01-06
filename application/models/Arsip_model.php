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
        WHERE user.id_user = '$id_user'
        ORDER BY arsip.status_validasi, arsip.id_arsip DESC";

        $result = $this->db->query($query)->result();
        return $result;
    }

    public function validate_arsip(string $id_arsip, int $status_validasi): array
    {
        $this->db->trans_begin();
        $this->db->where('id_arsip', $id_arsip);
        $this->db->update('arsip', ['status_validasi' => $status_validasi]);

        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return ['status' => false, 'message' => 'Data gagal diproses karena kesalahan sistem.'];
        } else {
            $this->db->trans_commit();
            $msg = $status_validasi == 1 ? "Data Arsip Berhasil di Validasi" : "Pembatalan Validasi Berhasil";
            return ['status' => true, 'message' => $msg];
        }
    }


    public function get_year_arsip($id_user): array
    {
        $query = "SELECT DISTINCT YEAR(arsip.created_at) AS tahun FROM arsip
        JOIN user ON arsip.id_user = user.id_user 
        WHERE user.id_user = '$id_user' AND arsip.status_validasi = '1'
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
        WHERE user.id_user = '$id_user' AND YEAR(arsip.created_at) = $tahun AND arsip.status_validasi = '1'
        ORDER BY arsip.created_at";

        $result = $this->db->query($query)->result();
        return $result;
    }
}
