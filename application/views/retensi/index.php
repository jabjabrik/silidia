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
                        <?= $title ?>
                    </h1>
                    <div class="btn-group btn-group-sm">
                        <a href="<?= base_url("retensi?type=$type"); ?>" class="btn btn-primary active" aria-current="page"><i class="bi bi-house"></i></a>
                        <a href="<?= base_url("retensi/musnah?type=$type"); ?>" class="btn btn-outline-primary">Pemusnahan</a>
                        <a target="_blank" href="<?= base_url("retensi/export/$type"); ?>" class="btn btn-success ms-2"><i class="bi bi-flag"></i> Export Excel</a>
                        <button id="btn_musnah" hidden type="button" class="btn  btn-danger ms-3" data-bs-toggle="modal" data-bs-target="#modal_form">
                            <i class="bi bi-plus-circle"></i> Musnahkan Arsip
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Daftar Data Arsip</h5>
                                </div>
                                <div class="card-body" style="overflow: auto;">
                                    <table id="datatables" class="table table-striped table-bordered text-capitalize" style="white-space: nowrap; font-size: .9em;">
                                        <thead>
                                            <tr class="text-center">
                                                <th rowspan="2">No</th>
                                                <?php if ($role == 'admin' || $role == 'validator'): ?>
                                                    <th rowspan="2"></th>
                                                <?php endif; ?>
                                                <th rowspan="2">Kode</th>
                                                <th rowspan="2">Nama Dokumen</th>
                                                <th rowspan="2">Bagian</th>
                                                <th rowspan="2">TGL Upload</th>
                                                <th colspan="3">Retensi</th>
                                                <?php if ($role == 'admin' || $role == 'validator'): ?>
                                                    <th rowspan="2">Aksi</th>
                                                <?php endif; ?>
                                            </tr>
                                            <tr>
                                                <th>Tanggal</th>
                                                <th>Status</th>
                                                <th>KD Berita Acara</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $no = 1 ?>
                                            <?php foreach ($data_result as $item) : ?>
                                                <tr>
                                                    <td><?= $no ?></td>
                                                    <?php if ($role == 'admin' || $role == 'validator'): ?>
                                                        <td>
                                                            <?php if (!is_null($item->tanggal_retensi) && (strtotime($item->tanggal_retensi) <= now()) && $item->status_retensi == 'sementara' && is_null($item->kode_ba)): ?>
                                                                <input type="checkbox" class="row-checkbox" value="<?= $item->id_arsip ?>">
                                                            <?php else: ?>
                                                            <?php endif; ?>
                                                        </td>
                                                    <?php endif; ?>
                                                    <td><span><?= $item->kode_arsip; ?></span></td>
                                                    <td style="white-space: wrap"><?= $item->nama_dokumen ?></td>
                                                    <td style="white-space: wrap"><?= $item->sub_role ?></td>
                                                    <td><span><?= date('d-m-Y', strtotime($item->tanggal_upload)); ?></span></td>
                                                    <td><?= $item->tanggal_retensi ? date('d-m-Y', strtotime($item->tanggal_retensi)) : '-'; ?></td>
                                                    <td>
                                                        <?php if (is_null($item->status_retensi)): ?>
                                                            <span>-</span>
                                                        <?php else: ?>
                                                            <span class="badge <?= $item->status_retensi == 'musnah' ? 'bg-danger' : ($item->status_retensi == 'permanen' ? 'bg-warning' : 'bg-secondary') ?>">
                                                                <?= $item->status_retensi ?? '-' ?>
                                                            </span>
                                                        <?php endif; ?>
                                                    </td>
                                                    <td><?= $item->kode_ba ?? '-' ?></td>
                                                    <?php if ($role == 'admin' || $role == 'validator'): ?>
                                                        <td>
                                                            <?php if (is_null($item->kode_ba)): ?>
                                                                <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#modal_edit" onclick="set_edit('<?= $item->id_arsip ?>', '<?= $item->tanggal_retensi ?>', '<?= $item->status_retensi ?>')">
                                                                    <i class=" bi bi-arrow-repeat" data-bs-toggle="tooltip" data-bs-title="Retensi Arsip"></i>
                                                                </button>
                                                            <?php endif; ?>
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
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5 text-capitalize">Form Berita Acara</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form method="POST" autocomplete="off" action="<?= base_url('retensi/insert') ?>" enctype="multipart/form-data">
                    <div class="modal-body">
                        <div class="row g-3">
                            <input name="id_arsip" id="id_arsip_musnah" hidden>
                            <input name="type" id="type" value="<?= $type ?>" hidden>
                            <div class="form-group col-12">
                                <label for="kode_ba" class="form-label">Kode Berita Acara</label>
                                <input type="text" name="kode_ba" id="kode_ba" class="form-control" required>
                            </div>
                            <div class="form-group col-12">
                                <label for="tanggal_ba" class="form-label">Tanggal Berita Acara</label>
                                <input type="date" name="tanggal_ba" id="tanggal_ba" class="form-control" required>
                            </div>
                            <div id="section_dokumen" class="form-group col-12">
                                <label for="file_ba" class="form-label">Unggah File</label>
                                <input class="form-control" type="file" id="file_ba" name="file_ba" required>
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

    <!-- Modal Edit -->
    <div class="modal fade" id="modal_edit" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5 text-capitalize">Form retensi</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form method="POST" autocomplete="off" action="<?= base_url('retensi/edit') ?>">
                    <div class="modal-body">
                        <div class="row g-3">
                            <input name="id_arsip" id="id_arsip" hidden>
                            <input name="type" id="type" value="<?= $type ?>" hidden>
                            <div class="form-group col-12">
                                <label for="tanggal_retensi" class="form-label">Tanggal Retensi</label>
                                <input type="date" name="tanggal_retensi" id="tanggal_retensi" class="form-control">
                            </div>
                            <div id="section_dokumen" class="form-group col-12">
                                <label for="status_retensi" class="form-label">Status Retensi</label>
                                <select class="form-select" name="status_retensi" id="status_retensi" required>
                                    <option value="" selected>-</option>
                                    <option value="permanen">Permanen</option>
                                    <option value="sementara">Sementara</option>
                                </select>
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
    <!-- End Modal Edit -->

    <!-- Script -->
    <?php $this->view('templates/script'); ?>
    <!-- End Script -->

    <!-- Logout Modal  -->
    <?php $this->view('templates/toasts'); ?>
    <!-- End Logout Modal  -->

    <!-- Logout Modal  -->
    <?php $this->view('templates/logout_modal'); ?>
    <!-- End Logout Modal  -->

    <script>
        const set_edit = (id_arsip, tanggal_retensi, status_retensi) => {
            const modal_edit = document.getElementById('modal_edit');

            modal_edit.querySelector('#id_arsip').value = id_arsip;
            console.log(tanggal_retensi, status_retensi);

            modal_edit.querySelector('#tanggal_retensi').value = tanggal_retensi;
            modal_edit.querySelector('#status_retensi').value = status_retensi;
        }


        document.getElementById('btn_submit').addEventListener('click', function() {
            var selectedData = [];
            var checkboxes = document.querySelectorAll('.row-checkbox:checked');

            checkboxes.forEach(function(checkbox) {
                selectedData.push(checkbox.value);
            });

            document.querySelector('#id_arsip_musnah').value = selectedData;
        });

        const row_checkbox = document.querySelectorAll('.row-checkbox')

        row_checkbox.forEach(e => {
            e.addEventListener('click', () => {
                const allFalse = [...row_checkbox].every(e => e.checked === false);
                const btn_musnah = document.querySelector('#btn_musnah');
                if (allFalse) {
                    btn_musnah.setAttribute('hidden', '')
                } else {
                    btn_musnah.removeAttribute('hidden')
                }
            })
        })
    </script>
</body>

</html>