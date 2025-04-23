<!DOCTYPE html>
<html lang="en">

<head>
	<?php $this->view('templates/head'); ?>
</head>

<body style="background-color: #eaeaea;">
	<!-- Login 5 - Bootstrap Brain Component -->
	<section class="p-5 p-md-5">
		<div class="container">
			<div class="card border-light-subtle shadow">
				<div class="row g-0">
					<div class="col-12 col-md-6 py-5" style="background-color: #1d4ed8;">
						<!-- <div class="col-12 col-md-6 text-bg-info"> -->
						<div class="d-flex align-items-center justify-content-center h-100 py-2">
							<div class="col-10 col-xl-8 py-3 text-center">
								<img class="img-fluid rounded mb-3" loading="lazy" src="<?= base_url('assets/img/logo_pemkot.png') ?>" width="130" alt=" BootstrapBrain Logo">
								<hr class="border-primary-subtle mb-3">
								<h3 class="h3 mb-4" style="color: aliceblue;">Selamat Datang di Sistem Pengarsipan Kecamatan Wonoasih</h3>
								<p class="lead m-0" style="font-size: 1em; color: aliceblue;">Aplikasi Sistem Informasi Arsip Digital Alih Media (SILIDIA) dirancang khusus untuk mendukung pengelolaan arsip di lingkungan Kecamatan secara digital, cepat, dan aman.</p>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-6">
						<div class="card-body p-3 p-md-4 p-xl-5">
							<div class="row">
								<div class="col-12">
									<div class="mb-5">
										<h3><i class="bi bi-person-circle me-3"></i>Halaman Login</h3>
									</div>
								</div>
							</div>
							<form action="<?= base_url(); ?>" method="POST">
								<div class="row gy-3  overflow-hidden">
									<div class="col-12">
										<label for="username" class="form-label">Username <span class="text-danger">*</span></label>
										<input type="text" class="form-control" name="username" id="username" value="<?= set_value('username'); ?>">
										<?= form_error('username', '<small class="text-danger pl-3 mt-1 d-block" style="text-align: left;">', '</small>'); ?>
									</div>
									<div class="col-12">
										<label for="password" class="form-label">Password <span class="text-danger">*</span></label>
										<input type="password" class="form-control" name="password" id="password" value="<?= set_value('password'); ?>">
										<div style="position: relative;">
											<i id="eye" hidden class="bi bi-eye" style="position: absolute; right: 10px; top: -27px; cursor: pointer;"></i>
											<i id="eye" class="bi bi-eye-slash" style="position: absolute; right: 10px; top: -27px; cursor: pointer;"></i>
										</div>
										<?= form_error('password', '<small class="text-danger pl-3 mt-1 d-block" style="text-align: left;">', '</small>'); ?>
									</div>
									<div class="mt-3">
										<label>Captcha</label>
										<?= $captcha_img ?>
									</div>
									<div class="col-12">
										<label for="captcha" class="form-label">Masukan Captcha <span class="text-danger">*</span></label>
										<input type="text" class="form-control" name="captcha" id="captcha">
										<?= form_error('captcha', '<small class="text-danger pl-3 mt-1 d-block" style="text-align: left;">', '</small>'); ?>
									</div>
									<div class="col-12">
										<div class="d-grid">
											<button class="btn bsb-btn-xl" style="background-color: #1d4ed8; color: aliceblue" type="submit">Login</button>
										</div>
									</div>
								</div>
							</form>
							<div class="row">
								<div class="col-12">
									<hr class="mt-5 mb-4 border-secondary-subtle">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Eye Icon Password -->
	<?php $this->view('templates/eye_icon_password'); ?>
	<!-- Eye Icon Password -->

	<!-- Script -->
	<?php $this->view('templates/script'); ?>
	<!-- End Script -->
</body>

</html>