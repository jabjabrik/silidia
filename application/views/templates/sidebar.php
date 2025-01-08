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
            <?php $role = $this->session->userdata('role'); ?>
            <?php if ($role == 'admin' || $role == 'validator' || $role == 'viewer'): ?>
                <li class="sidebar-header">
                    Master
                </li>
                <?php if ($role == 'admin'): ?>
                    <li class="sidebar-item <?= $title == 'User' ? 'active' : '' ?>">
                        <a class="sidebar-link" href="<?= base_url('user'); ?>">
                            <i class="align-middle" data-feather="users"></i> <span class="align-middle">User</span>
                        </a>
                    </li>
                <?php endif; ?>
                <li class="sidebar-item <?= $title == 'Kategori' ? 'active' : '' ?>">
                    <a class="sidebar-link" href="<?= base_url('kategori'); ?>">
                        <i class="bi bi-tag"></i> <span class="align-middle">Kategori</span>
                    </a>
                </li>
                <li class="sidebar-item <?= $title == 'Sub Kategori' ? 'active' : '' ?>">
                    <a class="sidebar-link" href="<?= base_url('kategori/sub'); ?>">
                        <i class="bi bi-tag"></i> <span class="align-middle">Sub Kategori</span>
                    </a>
                </li>
            <?php endif; ?>
            <?php if ($this->session->userdata('role') != 'kelurahan'): ?>
                <li class="sidebar-header">
                    Pengarsipan Kecamatan
                </li>
                <?php $sub_role = $this->session->userdata('sub_role'); ?>
                <?php foreach (get_role_kecamatan_kelurahan('kecamatan') as $item): ?>
                    <?php if ($sub_role == 'admin' || $sub_role == 'validator' || $sub_role == 'viewer' || $sub_role == $item->sub_role): ?>
                        <li class="sidebar-item <?= $title == "Arsip " . ucfirst($item->sub_role) ? 'active' : '' ?>">
                            <a class="sidebar-link" href="<?= base_url("arsip?id=$item->id_user"); ?>">
                                <i class="align-middle" data-feather="hash"></i> <span class="align-middle text-capitalize"><?= $item->sub_role; ?></span>
                            </a>
                        </li>
                    <?php endif; ?>
                <?php endforeach; ?>
            <?php endif; ?>
            <?php if ($this->session->userdata('role') != 'kecamatan'): ?>
                <li class="sidebar-header">
                    Pengarsipan Kelurahan
                </li>
                <?php $sub_role = $this->session->userdata('sub_role'); ?>
                <?php foreach (get_role_kecamatan_kelurahan('kelurahan') as $item): ?>
                    <?php if ($sub_role == 'admin' || $sub_role == 'validator' || $sub_role == 'viewer' || $sub_role == $item->sub_role): ?>
                        <li class="sidebar-item <?= $title == "Arsip " . ucfirst($item->sub_role) ? 'active' : '' ?>">
                            <a class="sidebar-link" href="<?= base_url("arsip?id=$item->id_user"); ?>">
                                <i class="align-middle" data-feather="hash"></i> <span class="align-middle text-capitalize"><?= $item->sub_role; ?></span>
                            </a>
                        </li>
                    <?php endif; ?>
                <?php endforeach; ?>
            <?php endif; ?>
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