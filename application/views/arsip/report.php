<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan</title>
    <style>
        body {
            font-size: .85em;
            font-family: Arial, sans-serif;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            /* margin: 20px 0; */
        }

        table th {
            text-align: center;
        }

        table td {
            border: 1px solid #ddd;
            padding: 7px;
            text-align: left;
        }

        table th {
            background-color: #f2f2f2;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        h2 {
            text-align: center;
            text-transform: capitalize;
            color: #333;
        }
    </style>
</head>

<body>
    <h2>Laporan Pengarsipan Kelurahan <?= $kelurahan ?> Tahun <?= $tahun ?></h2>

    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Nama Dokumen</th>
                <th>Tanggal</th>
                <th>Kategori</th>
                <th>Deskripsi</th>
            </tr>
        </thead>
        <tbody>
            <?php if (!empty($data_result)): ?>
                <?php $no = 1;
                foreach ($data_result as $item): ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?= $item->nama_dokumen; ?></td>
                        <td style="white-space: nowrap;"><?= date('d-m-Y', strtotime($item->created_at)); ?></td>
                        <td style="white-space: nowrap;"><?= $item->nama_kategori; ?></td>
                        <td><?= $item->deskripsi; ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php else: ?>
                <tr>
                    <td colspan="4" style="text-align: center;">Tidak ada data tersedia.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>
</body>

</html>