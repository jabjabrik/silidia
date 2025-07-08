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
                        <i class="align-middle" data-feather="lock"></i>
                        Halaman Ganti Password
                    </h1>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Form Password User</h5>
                                </div>
                                <div class="card-body" style="overflow: auto;">
                                    <form method="post" action="<?= base_url('akun/password'); ?>">
                                        <div class="mb-3">
                                            <label for="password1" class="form-label">Password Lama</label>
                                            <input type="password" class="form-control" id="password1" name="password1" value="<?= set_value('password1'); ?>">
                                            <?= form_error('password1', '<small class="text-danger pl-3 mt-1 d-block" style="text-align: left;">', '</small>'); ?>

                                        </div>
                                        <div class="mb-3">
                                            <label for="password2" class="form-label">Password Baru</label>
                                            <input type="password" class="form-control" id="password2" name="password2" value="<?= set_value('password2'); ?>">
                                            <?= form_error('password2', '<small class="text-danger pl-3 mt-1 d-block" style="text-align: left;">', '</small>'); ?>

                                        </div>
                                        <div class="mb-3">
                                            <label for="password3" class="form-label">Konfirmasi Password Baru</label>
                                            <input type="password" class="form-control" id="password3" name="password3" value="<?= set_value('password3'); ?>">
                                            <?= form_error('password3', '<small class="text-danger pl-3 mt-1 d-block" style="text-align: left;">', '</small>'); ?>

                                        </div>
                                        <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
                                    </form>
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