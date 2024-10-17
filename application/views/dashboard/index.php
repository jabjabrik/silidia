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

        <div class="main">
            <!-- TopBar -->
            <?php $this->view('templates/topbar'); ?>
            <!-- End TopBar -->

            <main class="content">
                <div class="container-fluid p-0">
                    <h1 class="h3 mb-3"><strong>Dashboard</strong> Pengarsipan Digital</h1>

                    <div class="row g-3">
                        <div class="px-3 col-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col mt-0">
                                            <a href="#" class="card-title"> Dokumen Administrasi</a>
                                        </div>
                                        <div class="col-auto">
                                            <div class="stat text-primary">
                                                <i class="align-middle bi bi-person-vcard"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <h1 class="mt-1 mb-3">102</h1>
                                    <div class="mb-0">
                                        <span class="text-primary"> <i class="mdi bi bi-stickies-fill"></i></span>
                                        <span class="text-muted"> Total Dokumen Administrasi</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="px-3 col-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col mt-0">
                                            <a href="#" class="card-title"> Dokumen Hukum</a>
                                        </div>
                                        <div class="col-auto">
                                            <div class="stat text-success">
                                                <i class="align-middle bi bi-award"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <h1 class="mt-1 mb-3">321</h1>
                                    <div class="mb-0">
                                        <span class="text-success"> <i class="mdi bi bi-stickies-fill"></i></span>
                                        <span class="text-muted"> Total Dokumen Hukum</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="px-3 col-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col mt-0">
                                            <a href="#" class="card-title"> Dokumen Proyek</a>
                                        </div>
                                        <div class="col-auto">
                                            <div class="stat text-warning">
                                                <i class="align-middle bi bi-building"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <h1 class="mt-1 mb-3">257</h1>
                                    <div class="mb-0">
                                        <span class="text-warning"> <i class="mdi bi bi-stickies-fill"></i></span>
                                        <span class="text-muted"> Total Dokumen Proyek</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="px-3 col-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col mt-0">
                                            <a href="#" class="card-title"> Dokumen Pendidikan</a>
                                        </div>
                                        <div class="col-auto">
                                            <div class="stat text-primary">
                                                <i class="align-middle bi bi-lightbulb-fill"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <h1 class="mt-1 mb-3">257</h1>
                                    <div class="mb-0">
                                        <span class="text-primary"> <i class="mdi bi bi-stickies-fill"></i></span>
                                        <span class="text-muted"> Total Dokumen Pendidikan</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="px-3 col-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col mt-0">
                                            <a href="#" class="card-title"> Dokumen Slip Gaji</a>
                                        </div>
                                        <div class="col-auto">
                                            <div class="stat text-success">
                                                <i class="align-middle bi bi-cash-stack"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <h1 class="mt-1 mb-3">191</h1>
                                    <div class="mb-0">
                                        <span class="text-success"> <i class="mdi bi bi-stickies-fill"></i></span>
                                        <span class="text-muted"> Total Dokumen Slip Gaji</span>
                                    </div>
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
    <!-- EndScript -->
</body>

</html>