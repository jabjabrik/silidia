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
                    <h1 class="h3 mb-3 text-capitalize">
                        <i class="bi bi-archive"></i>
                        Halaman Manajemen Arsip Kelurahan <?= $kelurahan ?>
                    </h1>
                    <?php if ($role != 'admin'): ?>
                        <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modal_form" onclick="setForm('tambah')">
                            <i class="bi bi-plus-circle"></i> Tambah
                        </button>
                    <?php endif ?>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Daftar Data Arsip</h5>
                                </div>
                                <div class="card-body">
                                    <table id="datatables" class="table table-striped table-bordered text-capitalize" style="white-space: nowrap; font-size: 1em;">
                                        <thead>
                                            <tr class="text-center">
                                                <th>No</th>
                                                <th class="no-sort">Nama Dokumen</th>
                                                <th class="no-sort">Deskripsi</th>
                                                <th class="no-sort">Tanggal</th>
                                                <th>Status</th>
                                                <th class="no-sort">Dokumen</th>
                                                <?php if ($role == 'admin'): ?>
                                                    <th class="no-sort">Validasi</th>
                                                <?php endif ?>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $no = 1 ?>
                                            <?php foreach ($arsip as $item) : ?>
                                                <tr>
                                                    <td><?= $no ?></td>
                                                    <td>
                                                        <span>
                                                            <?= strlen($item->nama_dokumen) > 20 ?
                                                                substr($item->nama_dokumen, 0, 20) . "..."
                                                                : $item->nama_dokumen;
                                                            ?>
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <span>
                                                            <?= strlen($item->deskripsi) > 30 ?
                                                                substr($item->deskripsi, 0, 30) . "..."
                                                                : $item->deskripsi;
                                                            ?>
                                                        </span>
                                                    </td>
                                                    <td><span><?= date('d-m-Y', strtotime($item->created_at)); ?></span></td>
                                                    <td>
                                                        <?php if ((bool)$item->status_validasi): ?>
                                                            <span class="badge bg-success">
                                                                <i style="cursor: pointer;" class="bi bi-check-circle text-white" data-bs-toggle="tooltip" data-bs-title="Data tervalidasi oleh admin"></i> Tervalidasi
                                                            </span>
                                                        <?php else: ?>
                                                            <span class="badge bg-warning">
                                                                <i style="cursor: pointer;" class="bi bi-clock text-white" data-bs-toggle="tooltip" data-bs-title="Menunggu validasi oleh admin"></i> Proses
                                                            </span>
                                                        <?php endif ?>
                                                    </td>
                                                    <td class="text-center">
                                                        <?php $params = "['$item->id_arsip','$item->nama_dokumen', '$item->deskripsi']"; ?>
                                                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic outlined example">
                                                            <a href="<?= base_url("dokumen/$item->file_path"); ?>" target="_blank" class="btn btn-outline-info">
                                                                <i class="bi bi-download" data-bs-toggle="tooltip" data-bs-title="Download data arsip"></i>
                                                            </a>
                                                            <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#modal_form" onclick="setForm('detail', <?= $params ?>)">
                                                                <i class="bi bi-eye" data-bs-toggle="tooltip" data-bs-title="Edit data arsip"></i>
                                                            </button>
                                                            <?php if (!(bool)$item->status_validasi): ?>
                                                                <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#modal_form" onclick="setForm('edit', <?= $params ?>)">
                                                                    <i class="bi bi-pencil-square" data-bs-toggle="tooltip" data-bs-title="Edit data arsip"></i>
                                                                </button>
                                                                <button id="delete-btn" type="button" class="btn btn-outline-danger btn-sm" data-id="<?= $item->id_arsip; ?>" data-bs-toggle="modal" data-bs-target="#modal_delete">
                                                                    <span data-bs-toggle="tooltip" data-bs-title="Hapus data arsip">
                                                                        <i class="bi bi-trash"></i>
                                                                    </span>
                                                                </button>
                                                            <?php endif ?>
                                                        </div>
                                                    </td>
                                                    <?php if ($role == 'admin'): ?>
                                                        <td class="text-center">
                                                            <?php if ((bool)$item->status_validasi): ?>
                                                                <button type="button" class="btn btn-sm btn-outline-danger">
                                                                    <i class="bi bi-check2-bi bi-x-circle" data-bs-toggle="tooltip" data-bs-title="Membatalkan validasi"></i>
                                                                </button>
                                                            <?php else: ?>
                                                                <button type="button" class="btn btn-sm btn-outline-primary">
                                                                    <i class="bi bi-check2-square" data-bs-toggle="tooltip" data-bs-title="Memvalidasi data"></i>
                                                                </button>
                                                            <?php endif ?>
                                                        </td>
                                                    <?php endif ?>
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
                <form method="POST" autocomplete="off" action="<?= base_url('arsip/insert') ?>" enctype="multipart/form-data">
                    <div class="modal-body">
                        <div class="row g-3">
                            <input name="kelurahan" id="kelurahan" hidden value="<?= $kelurahan ?>">
                            <input name="id_arsip" id="id_arsip" hidden>
                            <div class="form-group col-12">
                                <label for="nama_dokumen" class="form-label">Nama Dokumen</label>
                                <input type="text" name="nama_dokumen" id="nama_dokumen" class="form-control" required>
                            </div>
                            <div class="form-group col-12">
                                <label for="deskripsi" class="form-label">Deskripsi</label>
                                <textarea class="form-control" id="deskripsi" name="deskripsi" required rows="3"></textarea>
                            </div>
                            <div id="section_dokumen" class="form-group col-12">
                                <label for="dokumen" class="form-label">Unggah Dokumen</label>
                                <input class="form-control" type="file" id="dokumen" name="dokumen" required>
                                <div class="form-text mt-2">Biarkan Input Dokumen Kosong, Bila Tidak Ingin Mengunggah Dokumen Arsip</div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                        <button type="submit" class="btn btn-primary">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- End Modal Form -->

    <!-- Script Modal Form -->
    <script>
        const modal_form = document.querySelector('#modal_form');
        const section_dokumen = modal_form.querySelector('#section_dokumen');
        const dokumen = modal_form.querySelector('#dokumen');

        const setForm = (title, data) => {
            modal_form.querySelector('#title_form').innerHTML = `${title} data arsip kelurahan <?= $kelurahan ?>`

            const field = ['id_arsip', 'nama_dokumen', 'deskripsi'];
            field.forEach((e, i) => {
                const element = modal_form.querySelector(`#${field[i]}`);

                if (title === 'detail') {
                    element.setAttribute('disabled', '');
                } else {
                    element.removeAttribute('disabled', '');
                }

                if (element.tagName == 'INPUT') {
                    element.value = title === 'tambah' ? '' : data[i];
                } else {
                    element.innerHTML = title === 'tambah' ? '' : data[i];
                }
            })

            section_dokumen.removeAttribute('hidden');

            if (title === 'detail') {
                section_dokumen.setAttribute('hidden', '')
                return
            }

            if (title === 'tambah') {
                modal_form.querySelector('form').setAttribute('action', '<?= base_url('arsip/insert') ?>');
                dokumen.setAttribute('required', '');
                return
            }

            if (title === 'edit') {
                modal_form.querySelector('form').setAttribute('action', '<?= base_url('arsip/edit') ?>');
                dokumen.removeAttribute('required');
                return
            }
        }
    </script>
    <!-- End Script Modal Form -->


    <!-- Delete Modal -->
    <?php $this->view('templates/delete_modal', ['name' => "arsip/delete/$kelurahan"]); ?>
    <!-- End Delete Modal -->

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