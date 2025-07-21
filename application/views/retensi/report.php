<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Export to Excel</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/exceljs/4.3.0/exceljs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
</head>

<body>
    <table id="myTable" style="display:none;">
        <thead>
            <tr>
                <th>No</th>
                <th>Kode Arsip</th>
                <th>Nama Dokumen</th>
                <th>Bagian</th>
                <th>Tanggal Upload</th>
                <th>Tanggal Retensi</th>
                <th>Status Retensi</th>
                <th>Kode Berita Acara</th>
            </tr>
        </thead>
        <tbody>
            <?php $no = 1; ?>
            <?php foreach ($data_result as $item) : ?>
                <tr>
                    <td><?= $no ?></td>
                    <td><span><?= $item->kode_arsip; ?></span></td>
                    <td><?= $item->nama_dokumen ?></td>
                    <td><?= $item->sub_role ?></td>
                    <td><span><?= date('d-m-Y', strtotime($item->tanggal_upload)); ?></span></td>
                    <td><?= $item->tanggal_retensi ? date('d-m-Y', strtotime($item->tanggal_retensi)) : '-'; ?></td>
                    <td><span><?= $item->status_retensi ?? '-' ?></span></td>
                    <td><?= $item->kode_ba ?? '-' ?></td>
                </tr>
                <?php $no++; ?>
            <?php endforeach; ?>
        </tbody>
    </table>

    <script>
        async function exportTableToExcel(tableID, filename = '') {
            const table = document.getElementById(tableID);
            const wb = new ExcelJS.Workbook();
            const ws = wb.addWorksheet('Sheet1');

            const rows = [];
            const colWidths = [];

            for (let i = 0, row; row = table.rows[i]; i++) {
                const cells = [];
                for (let j = 0, col; col = row.cells[j]; j++) {
                    const cellText = col.innerText || '';
                    cells.push(cellText);

                    // Hitung panjang maksimum teks untuk autosize
                    const cellLength = cellText.toString().length;
                    if (!colWidths[j] || cellLength > colWidths[j]) {
                        colWidths[j] = cellLength;
                    }
                }
                rows.push(cells);
            }

            ws.addRows(rows);

            // Set lebar kolom
            ws.columns.forEach((column, index) => {
                column.width = colWidths[index] + 2;
            });

            // Tambahkan border dan alignment
            ws.eachRow((row, rowNumber) => {
                row.eachCell((cell, colNumber) => {
                    cell.border = {
                        top: {
                            style: 'thin'
                        },
                        left: {
                            style: 'thin'
                        },
                        bottom: {
                            style: 'thin'
                        },
                        right: {
                            style: 'thin'
                        }
                    };
                    cell.alignment = {
                        vertical: 'middle',
                        horizontal: 'left'
                    };
                });
            });

            filename = filename ? filename + '.xlsx' : 'excel_data.xlsx';

            const buffer = await wb.xlsx.writeBuffer();
            const blob = new Blob([buffer], {
                type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
            });
            saveAs(blob, filename);
        }

        window.onload = function() {
            exportTableToExcel('myTable', 'laporan_retensi_arsip');
        }
    </script>
</body>

</html>