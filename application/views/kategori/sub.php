<!DOCTYPE html>
<html lang="en">

<head>
    <?php $this->view('templates/head'); ?>
</head>

<body>
    <div class="wrapper">
        <!-- SideBar -->
        <?php $this->view('templates/sidebar'); ?>
        <!-- End SideBar -->
        <div class="main mx-0">
            <!-- TopBar -->
            <?php $this->view('templates/topbar'); ?>
            <!-- End TopBar -->
            <main class="content pt-4 pb-0">
                <div class="container-fluid p-0">
                    <h1 class="h3 mb-3 text-capitalize"><i class="bi bi-tag"></i> Halaman Manajemen Sub Kategori</h1>
                    <?php if ($this->session->userdata('role') == 'validator'): ?>
                        <button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#modal_form" onclick="setForm('tambah')">
                            <i class="bi bi-plus-circle"></i> Tambah
                        </button>
                    <?php endif; ?>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Daftar Data Sub Kategori</h5>
                                </div>
                                <div class="card-body" style="overflow: auto;">
                                    <table id="datatables" class="table table-striped table-bordered text-capitalize" style="white-space: nowrap; font-size: 1em;">
                                        <thead>
                                            <tr class="text-center">
                                                <th>No</th>
                                                <th>Nama kategori</th>
                                                <th>Sub kategori</th>
                                                <th>Keterangan</th>
                                                <?php if ($this->session->userdata('role') == 'validator'): ?>
                                                    <th>Aksi</th>
                                                <?php endif; ?>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $no = 1 ?>
                                            <?php foreach ($data_result as $item) : ?>
                                                <tr>
                                                    <td><?= $no ?></td>
                                                    <td><?= $item->nama_kategori ?></td>
                                                    <td><?= $item->nama_sub_kategori ?></td>
                                                    <td style="white-space: wrap"><?= $item->keterangan_sub_kategori; ?></td>
                                                    <?php if ($this->session->userdata('role') == 'validator'): ?>
                                                        <td>
                                                            <?php $params = "[`$item->id_sub_kategori`,`$item->id_kategori`,`$item->nama_sub_kategori`, `$item->keterangan_sub_kategori`]" ?>
                                                            <div class="btn-group btn-group-sm" role="group">
                                                                <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#modal_form" onclick="setForm('edit', <?= $params ?>)">
                                                                    <i class="bi bi-pencil-square"></i> Edit
                                                                </button>
                                                                <button id="btn_delete" type="button" class="btn btn-outline-danger" data-id="<?= $item->id_sub_kategori ?>" data-bs-toggle="modal" data-bs-target="#confirm_modal">
                                                                    <i class="bi bi-trash" data-bs-toggle="tooltip" data-bs-title="Hapus data"></i> Hapus
                                                                </button>
                                                            </div>
                                                        </td>
                                                    <?php endif; ?>
                                                </tr>
                                                <?php $no++ ?>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Modal Form -->
    <div class="modal fade" id="modal_form" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5 text-capitalize" id="title_form"></h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form method="POST" autocomplete="off">
                    <div class="modal-body">
                        <div class="row g-3">
                            <input type="text" name="id_sub_kategori" id="id_sub_kategori" hidden>
                            <div class="form-group col-md-6 col-12">
                                <label for="id_kategori" class="form-label">Nama Kategori</label>
                                <select class="form-select" name="id_kategori" id="id_kategori" required>
                                    <option value="" selected>-</option>
                                    <?php foreach ($kategori as $item): ?>
                                        <option value="<?= $item->id_kategori ?>"><?= $item->nama_kategori ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group col-md-6 col-12">
                                <label for="nama_sub_kategori" class="form-label">Nama Sub Kategori</label>
                                <input type="text" name="nama_sub_kategori" id="nama_sub_kategori" class="form-control" required>
                            </div>
                            <div class="form-group col-12">
                                <label for="keterangan_sub_kategori" class="form-label">Keterangan</label>
                                <input type="text" name="keterangan_sub_kategori" id="keterangan_sub_kategori" class="form-control" required>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                        <button id="btn_submit" type="submit" class="btn btn-primary">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- End Modal Form -->


    <!-- Delete Modal -->
    <?php $this->view('components/confirm_modal', ['url' => "kategori/sub_delete"]); ?>
    <!-- End Delete Modal -->

    <!-- Script Form -->
    <script>
        const modal_form = document.querySelector('#modal_form');
        const btn_submit = modal_form.querySelector('#btn_submit');

        const setForm = (title, data) => {
            modal_form.querySelector('#title_form').innerHTML = `${title} data sub kategori`
            const fields = ['id_sub_kategori', 'id_kategori', 'nama_sub_kategori', 'keterangan_sub_kategori'];
            fields.forEach((e, i) => {
                const element = modal_form.querySelector(`#${e}`);
                element.value = title === 'tambah' ? '' : data[i];
            })

            if (title === 'tambah') {
                modal_form.querySelector('form').setAttribute('action', '<?= base_url("kategori/sub_insert") ?>');
                btn_submit.innerHTML = 'Simpan';
            }

            if (title === 'edit') {
                modal_form.querySelector('form').setAttribute('action', '<?= base_url("kategori/sub_edit") ?>');
                btn_submit.innerHTML = 'Edit';
            }
        }
    </script>
    <!-- End Script Form -->

    <!-- Script -->
    <?php $this->view('templates/script'); ?>
    <!-- End Script -->

    <!-- Logout Modal  -->
    <?php $this->view('templates/toasts'); ?>
    <!-- End Logout Modal  -->

    <!-- Logout Modal  -->
    <?php $this->view('templates/logout_modal'); ?>
    <!-- End Logout Modal  -->
</body>

</html>