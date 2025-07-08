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
                        <i class="align-middle bi bi-person-fill-gear"></i>
                        Halaman Setting User
                    </h1>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Form Data User</h5>
                                </div>
                                <div class="card-body" style="overflow: auto;">
                                    <form method="post" action="<?= base_url('akun/edit_user'); ?>">
                                        <div class="mb-3">
                                            <label for="nama_user" class="form-label">Nama User</label>
                                            <input type="text" class="form-control" id="nama_user" name="nama_user" value="<?= $user->nama_user ?>" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="username" class="form-label">Username</label>
                                            <input type="text" class="form-control" id="username" name="username" value="<?= $user->username ?>" required>
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