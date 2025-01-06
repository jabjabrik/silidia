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
}
