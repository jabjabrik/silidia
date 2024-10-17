<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading"></div>
                <a class="nav-link <?= $title == 'Dashboard' ? 'active' : '' ?>" href="<?= base_url('dashboard') ?>">
                    <div class="sb-nav-link-icon">
                        <i class="fas fa-tachometer-alt"></i>
                    </div>
                    Dashboard
                </a>
                <div class="sb-sidenav-menu-heading">Master</div>
                <a class="nav-link <?= $title == 'User' ? 'active' : '' ?>" href="<?= base_url('user') ?>">
                    <div class="sb-nav-link-icon">
                        <i class="bi bi-person-circle"></i>
                    </div>
                    User
                </a>
                <div class="sb-sidenav-menu-heading">Transaksi</div>

                <a class="nav-link <?= $title == 'Pengarsipan' ? 'active' : '' ?>" href="<?= base_url('pengarsipan') ?>">
                    <div class="sb-nav-link-icon">
                        <i class="bi bi-cash-stack"></i>
                    </div>
                    Pengarsipan
                </a>
                <div class="sb-sidenav-menu-heading">Akun</div>
                <a class="nav-link <?= $title == 'Change Password' ? 'active' : '' ?>" href="<?= base_url('account/changepassword') ?>">
                    <div class="sb-nav-link-icon">
                        <i class="bi bi-person-lock"></i>
                    </div>
                    Change Password
                </a>
                <a class="nav-link" data-bs-toggle="modal" data-bs-target="#exampleModal" style="cursor: pointer;">
                    <div class="sb-nav-link-icon">
                        <i class="bi bi-box-arrow-right"></i>
                    </div>
                    Logout
                </a>

            </div>
        </div>
    </nav>
</div>