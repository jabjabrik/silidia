<?php


class Arsip_model extends CI_Model
{
    public function get_arsip_by_kelurahan(string $kelurahan): array
    {

        $query = "SELECT arsip.*, user.role AS kelurahan FROM arsip 
        JOIN user ON arsip.id_user = user.id_user 
        WHERE user.role = '$kelurahan'
        ORDER BY arsip.status_validasi DESC, user.role DESC";

        $this->db->trans_begin();
        $result = $this->db->query($query);

        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return ['status' => false, 'message' => 'Data gagal diambil karena kesalahan sistem.'];
        } else {
            $this->db->trans_commit();
            return ['status' => true, 'message' => 'Data arsip berhasil diambil.', 'data' => $result->result()];
        }
    }

    public function insert_arsip(array $data): array
    {
        $this->db->trans_begin();
        $this->db->insert('arsip', $data);

        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return ['status' => false, 'message' => 'Data gagal diproses karena kesalahan sistem.'];
        } else {
            $this->db->trans_commit();
            return ['status' => true, 'message' => 'Data arsip berhasil disimpan.'];
        }
    }

    public function update_arsip(string $id_arsip, array $data): array
    {
        $this->db->trans_begin();
        $this->db->where('id_arsip', $id_arsip);
        $this->db->update('arsip', $data);

        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return ['status' => false, 'message' => 'Data gagal diproses karena kesalahan sistem.'];
        } else {
            $this->db->trans_commit();
            return ['status' => true, 'message' => 'Data arsip berhasil diperbarui.'];
        }
    }

    public function delete_arsip(string $id_arsip): array
    {
        $this->db->trans_begin();
        $this->db->where('id_arsip', $id_arsip);
        $this->db->delete('arsip');

        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return ['status' => false, 'message' => 'Data gagal diproses karena kesalahan sistem.'];
        } else {
            $this->db->trans_commit();
            return ['status' => true, 'message' => 'Data arsip berhasil dihapus.'];
        }
    }

    public function get_by_id(string $id_arsip): object
    {
        return $this->db->get_where('arsip', ['id_arsip' => $id_arsip]);
    }
}
