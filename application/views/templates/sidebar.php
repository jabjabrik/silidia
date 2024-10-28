<nav id="sidebar" class="sidebar js-sidebar">
    <div class="sidebar-content js-simplebar">
        <a class="sidebar-brand" href="<?= base_url(); ?>">
            <span class="align-middle">DIGIPER</span>
        </a>

        <ul class="sidebar-nav">

            <li class="sidebar-item <?= $title == 'Dashboard' ? 'active' : '' ?>">
                <a class="sidebar-link" href="<?= base_url(); ?>">
                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
                </a>
            </li>
            <li class="sidebar-header">
                Master
            </li>
            <li class="sidebar-item <?= $title == 'User' ? 'active' : '' ?>">
                <a class="sidebar-link" href="#">
                    <i class="align-middle" data-feather="users"></i> <span class="align-middle">User</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a class="sidebar-link" href="#">
                    <i class="align-middle" data-feather="hash"></i> <span class="align-middle">Kategori</span>
                </a>
            </li>
            <li class="sidebar-header">
                Pengarsipan
            </li>
            <li class="sidebar-item">
                <a class="sidebar-link" href="#">
                    <i class="align-middle" data-feather="save"></i> <span class="align-middle">Arsip</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a class="sidebar-link" href="#">
                    <i class="align-middle" data-feather="upload-cloud"></i> <span class="align-middle">Upload</span>
                </a>
            </li>
            <li class="sidebar-header">
                Akun
            </li>
            <li class="sidebar-item">
                <a class="sidebar-link" href="<?= base_url('auth/logout'); ?>">
                    <i class="align-middle" data-feather="log-in"></i> <span class="align-middle">Logout</span>
                </a>
            </li>
        </ul>
    </div>
</nav>