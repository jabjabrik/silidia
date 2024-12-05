<nav id="sidebar" class="sidebar js-sidebar">
    <div class="sidebar-content js-simplebar">
        <a class="sidebar-brand" href="<?= base_url(); ?>">
            <span class="align-middle">SILIDIA</span>
        </a>

        <ul class="sidebar-nav">
            <li class="sidebar-item <?= $title == 'Dashboard' ? 'active' : '' ?>">
                <a class="sidebar-link" href="<?= base_url(); ?>">
                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
                </a>
            </li>
            <?php if ($this->session->userdata('role') == 'admin'): ?>
                <li class="sidebar-header">
                    Master
                </li>
                <li class="sidebar-item <?= $title == 'User' ? 'active' : '' ?>">
                    <a class="sidebar-link" href="<?= base_url('user'); ?>">
                        <i class="align-middle" data-feather="users"></i> <span class="align-middle">User</span>
                    </a>
                </li>
                <li class="sidebar-item <?= $title == 'Kategori' ? 'active' : '' ?>">
                    <a class="sidebar-link" href="<?= base_url('kategori'); ?>">
                        <i class="bi bi-tag"></i> <span class="align-middle">Kategori</span>
                    </a>
                </li>
            <?php endif; ?>
            <li class="sidebar-header">
                Pengarsipan Kelurahan
            </li>
            <?php $role = $this->session->userdata('role'); ?>
            <?php foreach (['wonoasih', 'jrebengkidul', 'pakistaji', 'kedunggaleng', 'kedungasem', 'sumbertaman'] as $item): ?>
                <?php if ($role == 'admin' || $role == 'validator' || $role == $item): ?>
                    <li class="sidebar-item <?= $title == "Arsip " . ucfirst($item) ? 'active' : '' ?>">
                        <a class="sidebar-link" href="<?= base_url("arsip/kelurahan/$item"); ?>">
                            <i class="align-middle" data-feather="hash"></i> <span class="align-middle text-capitalize"><?= $item; ?></span>
                        </a>
                    </li>
                <?php endif; ?>
            <?php endforeach; ?>
            <li class="sidebar-header">
                Akun
            </li>
            <li class="sidebar-item">
                <a class="sidebar-link" data-bs-toggle="modal" data-bs-target="#logout_modal">
                    <i class="align-middle" data-feather="log-in"></i> <span class="align-middle">Logout</span>
                </a>
            </li>
        </ul>
    </div>
</nav>