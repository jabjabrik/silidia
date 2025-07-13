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
                    <div class="btn-group">
                        <a href="<?= base_url("retensi?type=$type"); ?>" class="btn btn-outline-primary"><i class="bi bi-house"></i></a>
                        <a href="<?= base_url("retensi/musnah?type=$type"); ?>" class="btn btn-primary active" aria-current="page">Pemusnahan</a>
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
                                                <th>No</th>
                                                <th>Kode BA</th>
                                                <th>Tanggal</th>
                                                <th>Jumlah</th>
                                                <th>File BA</th>
                                                <th>Daftar Dokumen</th>
                                                <?php if ($role == 'admin' || $role == 'validator'): ?>
                                                    <th>Aksi</th>
                                                <?php endif; ?>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $no = 1 ?>
                                            <?php foreach ($data_result as $item) : ?>
                                                <tr>
                                                    <td><?= $no ?></td>
                                                    <td><?= $item->kode_ba ?></td>
                                                    <td><?= $item->tanggal_ba ?></td>
                                                    <td><?= $item->jumlah ?></td>
                                                    <td><a target="_blank" href="<?= base_url("dokumen/$item->file_ba"); ?>">Unduh</a>
                                                    <td><?= str_replace('|', '<br>', $item->daftar_dokumen) ?></td>
                                                    <?php if ($role == 'admin' || $role == 'validator'): ?>
                                                        <td>
                                                            <a href="<?= base_url("retensi/delete/$item->id_ba/$type"); ?>" class="btn btn-sm btn-outline-danger" onclick="return confirm('Apakah Anda yakin ingin menghapus Berita Acara ini?');">
                                                                <i class="bi bi-trash"></i> Hapus
                                                            </a>
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