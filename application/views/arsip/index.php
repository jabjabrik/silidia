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
            <main class="content p-3">
                <div class="container-fluid p-0">
                    <h1 class="h3 mb-3 text-capitalize">
                        <i class="bi bi-archive"></i>
                        Halaman Manajemen Arsip <?= $role ?> <strong><?= $sub_role ?></strong>
                    </h1>
                    <?php if ($session_role != 'admin' && $session_role != 'validator'): ?>
                        <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#modal_form" onclick="setForm('tambah')">
                            <i class="bi bi-plus-circle"></i> Tambah
                        </button>
                    <?php endif ?>
                    <?php if (!empty($year_arsip) && $session_role == 'admin'): ?>
                        <div class="btn-group btn-group-sm" role="group">
                            <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                Cetak Laporan
                            </button>
                            <ul class="dropdown-menu">
                                <?php foreach ($year_arsip as $item): ?>
                                    <li><a class="dropdown-item" target="_blank" href="<?= base_url("arsip/report/$id_user/$item->tahun"); ?>">Tahun <?= $item->tahun ?></a></li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                    <?php endif; ?>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Daftar Data Arsip</h5>
                                </div>
                                <div class="card-body">
                                    <table id="datatables" class="table table-striped table-bordered text-capitalize" style="white-space: nowrap; font-size: .9em;">
                                        <thead>
                                            <tr class="text-center">
                                                <th>No</th>
                                                <th>Nama Dokumen</th>
                                                <th>Kategori</th>
                                                <th>Tanggal</th>
                                                <th>Status</th>
                                                <th class="no-sort">Dokumen</th>
                                                <?php if ($session_role == 'admin' || $session_role == 'validator'): ?>
                                                    <th class="no-sort">Validasi</th>
                                                <?php endif ?>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $no = 1 ?>
                                            <?php foreach ($data_result as $item) : ?>
                                                <tr>
                                                    <td><?= $no ?></td>
                                                    <td>
                                                        <span>
                                                            <?= strlen($item->nama_dokumen) > 55 ?
                                                                substr($item->nama_dokumen, 0, 55) . "..."
                                                                : $item->nama_dokumen;
                                                            ?>
                                                        </span>
                                                    </td>
                                                    <td><span><?= $item->nama_kategori; ?></span></td>
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
                                                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic outlined example">
                                                            <?php $params = "[`$item->id_arsip`,`$item->id_kategori`,`$item->nama_dokumen`,`$item->deskripsi`, `$item->file_path`]"; ?>
                                                            <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#modal_form" onclick="setForm('detail', <?= $params ?>)">
                                                                <i class="bi bi-eye" data-bs-toggle="tooltip" data-bs-title="Detail data arsip"></i>
                                                            </button>
                                                            <?php if (!(bool)$item->status_validasi && $session_role != 'validator'): ?>
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
                                                    <?php if ($session_role == 'admin' || $session_role == 'validator'): ?>
                                                        <td class="text-center">
                                                            <?php if ((bool)$item->status_validasi): ?>
                                                                <button type="button" id="btn_cancel" class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#modal_validasi" data-id="<?= $item->id_arsip ?>">
                                                                    <i class="bi bi-check2-bi bi-x-circle" data-bs-toggle="tooltip" data-bs-title="Membatalkan validasi"></i>
                                                                </button>
                                                            <?php else: ?>
                                                                <button type="button" id="btn_approve" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#modal_validasi" data-id="<?= $item->id_arsip ?>">
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
                            <input name="id_user" id="id_user" hidden value="<?= $id_user ?>">
                            <input name="id_arsip" id="id_arsip" hidden>
                            <div class="form-group col-12">
                                <label for="nama_dokumen" class="form-label">Nama Dokumen</label>
                                <input type="text" name="nama_dokumen" id="nama_dokumen" class="form-control" required>
                            </div>
                            <div class="form-group col-12">
                                <label for="id_kategori" class="form-label">Kategori</label>
                                <select class="form-select" name="id_kategori" id="id_kategori" required>
                                    <option value="" selected>-</option>
                                    <?php foreach ($kategori as $item): ?>
                                        <option value="<?= $item->id_kategori ?>"><?= $item->nama_kategori ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group col-12">
                                <label for="deskripsi" class="form-label">Deskripsi</label>
                                <textarea class="form-control" id="deskripsi" name="deskripsi" required rows="3"></textarea>
                            </div>
                            <div id="section_dokumen" class="form-group col-12">
                                <label for="dokumen" class="form-label">Unggah Dokumen</label>
                                <input class="form-control" type="file" id="dokumen" name="dokumen" required accept="application/pdf">
                                <div class="form-text mt-2">Upload file bertipe PDF | Maks 5mb</div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a id="view_file" target="_blank" class="btn btn-info">
                            Lihat File <i class="bi bi-filetype-pdf" data-bs-toggle="tooltip" data-bs-title="Lihat Dokumen"></i>
                        </a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                        <button id="btn_submit" type="submit" class="btn btn-primary">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- End Modal Form -->

    <!-- Modal Validasi -->
    <div class="modal fade" id="modal_validasi" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="title"></h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                    <a id="confirm" type="button" class="btn btn-primary"></a>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal Validasi -->

    <!-- Script Modal Form -->
    <script>
        const modal_form = document.querySelector('#modal_form');
        const section_dokumen = modal_form.querySelector('#section_dokumen');
        const view_file = modal_form.querySelector('#view_file');
        const dokumen = modal_form.querySelector('#dokumen');
        const btn_submit = modal_form.querySelector('#btn_submit');

        const setForm = (title, data) => {
            modal_form.querySelector('#title_form').innerHTML = `${title} data arsip`

            const field = ['id_arsip', 'id_kategori', 'nama_dokumen', 'deskripsi'];
            field.forEach((e, i) => {
                const element = modal_form.querySelector(`#${e}`);

                if (title === 'detail') {
                    element.setAttribute('disabled', '');
                } else {
                    element.removeAttribute('disabled', '');
                }

                if (element.tagName == 'INPUT' || element.tagName == 'SELECT') {
                    element.value = title === 'tambah' ? '' : data[i];
                } else {
                    element.innerHTML = title === 'tambah' ? '' : data[i];
                }
            })

            btn_submit.removeAttribute('hidden');
            section_dokumen.removeAttribute('hidden');
            view_file.setAttribute('hidden', '')

            if (title === 'detail') {
                section_dokumen.setAttribute('hidden', '')
                btn_submit.setAttribute('hidden', '')
                view_file.removeAttribute('hidden')
                view_file.setAttribute('href', `<?= base_url('dokumen/'); ?>${data[4]}`)
            }

            if (title === 'tambah') {
                modal_form.querySelector('form').setAttribute('action', '<?= base_url('arsip/insert') ?>');
                dokumen.setAttribute('required', '');
                btn_submit.innerHTML = 'Simpan';
            }

            if (title === 'edit') {
                modal_form.querySelector('form').setAttribute('action', '<?= base_url('arsip/edit') ?>');
                dokumen.removeAttribute('required');
                btn_submit.innerHTML = 'Edit';
            }
        }
    </script>
    <!-- End Script Modal Form -->


    <!-- Script Modal Validasi -->
    <script>
        const btn_approve = document.querySelectorAll('#btn_approve');
        const btn_cancel = document.querySelectorAll('#btn_cancel');
        const modal_validasi = document.querySelector('#modal_validasi');
        const title = modal_validasi.querySelector('.modal-title');
        const body = modal_validasi.querySelector('.modal-body');
        const confirm = modal_validasi.querySelector('#confirm');

        btn_approve.forEach(btn => {
            btn.addEventListener('click', () => {
                const id_arsip = btn.getAttribute('data-id');
                title.innerHTML = 'Konfirmasi Validasi.'
                body.innerHTML = 'Apakah Anda yakin ingin Validasi Data Arsip?'
                confirm.setAttribute('href', `<?= base_url("arsip/validate/approve/") ?>${id_arsip}/<?= $id_user ?>`)
                confirm.innerHTML = 'Approve'
                confirm.setAttribute('class', 'btn btn-primary')
            })
        })

        btn_cancel.forEach(btn => {
            btn.addEventListener('click', () => {
                const id_arsip = btn.getAttribute('data-id');
                title.innerHTML = 'Konfirmasi Pembatalan Validasi.'
                body.innerHTML = 'Apakah Anda yakin ingin Membatalkan Validasi Data Arsip?'
                confirm.setAttribute('href', `<?= base_url("arsip/validate/cancel/") ?>${id_arsip}/<?= $id_user ?>`)
                confirm.innerHTML = 'Batalkan'
                confirm.setAttribute('class', 'btn btn-danger')
            })
        })
    </script>
    <!-- End Script Modal Validasi -->


    <!-- Delete Modal -->
    <?php $this->view('templates/delete_modal', ['name' => "arsip/delete/$id_user"]); ?>
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