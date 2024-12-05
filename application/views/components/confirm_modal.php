<div class="modal fade" id="confirm_modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5">Konfirmasi Penghapusan</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span>Apakah Anda yakin ingin menghapus data?</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                <a id="btn_confirm" type="button" class="btn btn-danger">Hapus</a>
            </div>
        </div>
    </div>
</div>
<!-- End Modal Delete -->

<!-- Script Modal Delete -->
<script>
    const btn_delete_nonactive = document.querySelectorAll('#btn_delete');
    const btn_confirm = document.querySelector('#btn_confirm');

    btn_delete_nonactive.forEach(button => {
        button.addEventListener('click', () => {
            const id = button.getAttribute('data-id');
            btn_confirm.setAttribute('href', `<?= base_url("$url/") ?>${id}`);
        })
    })
</script>