Responsi 1 Praktikum Metode Numerik
Penyusun: L0325016 – Agis Lentera Pratama
Mata kuliah: Metode Numerik, Program Studi Informatika, Fakultas Teknologi Informasi dan Sains Data, Universitas Sebelas Maret
Materi responsi: Galat, SPL, dan SPNL
Dokumen ini adalah peta isi folder ini: kode apa saja yang ada, laporan versi mana yang terbaru, cara menjalankan kodenya, hasil yang diharapkan, dan masalah yang sudah pernah ditemui beserta solusinya.
Ringkasan soal dan jawaban
Kasus 1 – Galat / error pemotongan (deret Taylor)
Rumus dibaca sebagai h(t) = h0 × (cos(t·v/λ) + exp(x)), dengan λ = 12, v = 36, x = 10, h0 = 5, t dari 0 sampai 5, sehingga h(t) = 5 × (cos(3t) + exp(10)).
n diartikan sebagai jumlah suku deret, yaitu k = 0 sampai n − 1, untuk cos maupun exp.
n
MAE
Rata-rata galat relatif
Di bawah toleransi 1%?
23
32,57
0,0296%
Ya
24
13,23
0,0120%
Ya
25
5,17
0,0047%
Ya
Kesimpulan: pendekatan Taylor layak digunakan, bahkan n = 23 sudah cukup; n = 25 paling akurat.
Galat didominasi pemotongan deret exp(10), bukan cos, sehingga MAE hampir sama dengan galat maksimumnya.
Kasus 2 – SPL harga bahan makanan (Gauss-Seidel + verifikasi Gauss-Jordan)
Variabel berurutan: beras, telur, tepung, ayam, dalam Rp/kg. Semua satuan disamakan dulu ke kg
(1 kg = 1000 g, 1 hg = 0,1 kg, 1 dag = 0,01 kg).
Bahan
Harga per kg
Beras
Rp14.000
Telur
Rp24.000
Tepung
Rp15.000
Ayam
Rp30.000
Poin penting: matriks urutan asal tidak dominan diagonal pada satu pun barisnya, dan Gauss-Seidel
pada urutan asal divergen (radius spektral 21,43). Setelah baris disusun ulang menjadi
[Briza, Dinda, Adel, Caca], diagonal menjadi dominan ketat pada semua baris dan Gauss-Seidel
konvergen dalam 18 iterasi, dengan hasil yang sama persis dengan Gauss-Jordan (rref)
dan substitusi kembali keempat total belanja (selisih 0).
Kasus 3 – Persamaan nonlinear jari-jari bola dan tabung (biseksi)
Diketahui volume bola 300 cm³. Soal menulis cm², tetapi karena yang dibicarakan adalah volume,
satuan itu dibaca sebagai cm³. Tinggi tabung diambil 2r (tabung membungkus bola), sehingga
V_tabung = 2πr³ = 450 cm³ dan V_luar = (2/3)πr³ = 150 cm³.
Persamaan nonlinear: f(r) = (2/3)πr³ − 150 = 0, setara dengan (4/3)πr³ − 300 = 0.
Biseksi pada selang [4, 5] (f(4) ≈ −15,96, f(5) ≈ +111,80) selama 20 iterasi menghasilkan:
Besaran
Hasil
Jari-jari r
4,1528 cm
Volume bola
300 cm³
Volume tabung
450 cm³
Volume tabung di luar bola
150 cm³
Pembanding eksak: r = (225/π)^(1/3) ≈ 4,1528306 cm, selisihnya dari hasil biseksi hanya
sekitar 0,0000005 cm.
Berkas yang dipakai
Versi terbaru (pakai yang ini)
Berkas
Isi
Laporan_Responsi_1_Metode_Numerik_L0325016_AgisLenteraPratama_Revisi_Kesimpulan.docx
Laporan terbaru, 26 halaman A4, Times New Roman 12
Laporan_Responsi_1_Metode_Numerik_L0325016_AgisLenteraPratama_Revisi_Kesimpulan.pdf
PDF dari berkas yang sama, 26 halaman
Struktur laporan terbaru:
BAB I – Analisis Source Code: tiap kasus hanya a. Proses sebelum kode ditulis dan
  b. Proses selama kode ditulis (screenshot kode + paragraf panjang analisis kode).
BAB II – Analisis Praktikum: tiap kasus berisi a. Hasil dan b. Analisis hasil
  (tabel + paragraf), ditambah verifikasi silang hasil di akhir bab.
BAB III – Kesimpulan: kesimpulan perbandingan, kesimpulan per kasus, keterbatasan,
  implikasi praktis, dan penutup yang merangkum jawaban ketiga soal.
Lampiran: source code lengkap ketiga berkas .m.
Versi laporan sebelumnya (arsip, jangan dipakai untuk kumpul kecuali sengaja)
Berkas
Halaman
Keterangan
Laporan_Responsi_1_Metode_Numerik_L0325016_AgisLenteraPratama.docx / .pdf
18
Versi awal + paragraf subbab b diperpanjang + TNR 12 disamakan
..._Revisi_Hasil.docx / .pdf
23
Bagian Hasil diperdalam (tabel + paragraf); screenshot asli Agis dimasukkan
..._Revisi_Bab.docx / .pdf
24
Hasil dipindah dari BAB I ke BAB II Analisis Praktikum; BAB III menjadi Kesimpulan
..._Revisi_Kesimpulan.docx / .pdf
26
Terbaru. BAB III diperpanjang (225 → 1.334 kata)
Kode MATLAB / Octave
Berkas
Isi
kasus1_galat.m
Kasus 1: Taylor cos + exp, n = 23, 24, 25, grafik eksak vs pendekatan
kasus2_spl.m
Kasus 2: Gauss-Seidel setelah tukar baris + verifikasi Gauss-Jordan
kasus3_spnl.m
Kasus 3: grafik f(r) + biseksi [4, 5]
kasus1_plot.png
Grafik hasil Kasus 1
kasus3_grafik.png
Grafik hasil Kasus 3
kasus1_galat_ss.png, kasus2_spl_ss.png, kasus3_spnl_ss.png
Gambar kode untuk laporan (render dari berkas .m, bukan tangkapan layar Octave)
Dua versi zip kode — jangan tertukar
Zip
Perilaku grafik
Kapan dipakai
Kode_MATLAB_Responsi_Metode_Numerik.zip (asli, 2026-10-28)
figure('visible','off'): grafik tidak tampil, hanya disimpan sebagai PNG (kasus1_plot.png, kasus3_grafik.png)
Kalau hanya butuh angka + berkas PNG, atau dijalankan tanpa layar
Kode_MATLAB_Responsi_Metode_Numerik_tampil-grafik.zip
figure;: grafik tampil di jendela Figure, dan PNG tetap disimpan
Kalau dijalankan di Octave/MATLAB bergrafis dan ingin melihat grafiknya langsung
Isi kedua zip sama-sama 3 berkas .m; yang berbeda hanya baris figure pada
kasus1_galat.m (baris 33) dan kasus3_spnl.m (baris 10). kasus2_spl.m tidak berubah
karena Kasus 2 tidak punya grafik.
Cara menjalankan
Ekstrak dulu zip ke folder biasa (misalnya Documents), jangan menjalankan
   berkas .m langsung dari dalam zip. Lihat bagian Troubleshooting di bawah.
Buka Octave atau MATLAB, atur Current Directory ke folder hasil ekstrak itu.
Jalankan satu per satu, sesuai urutan soal:
kasus1_galat — tunggu sampai muncul kesimpulan dan grafik / berkas kasus1_plot.png.
kasus2_spl — tunggu sampai muncul hasil Gauss-Seidel dan verifikasi Gauss-Jordan.
kasus3_spnl — tunggu sampai muncul hasil biseksi dan berkas kasus3_grafik.png.
Cocokkan output dengan tabel hasil pada bagian Ringkasan di atas. Kalau angkanya
   sama, berarti kode berjalan dengan benar; kalau berbeda, periksa dulu apakah
   berkas .m yang dijalankan adalah versi yang benar (lihat tabel dua zip di atas)
   dan apakah Current Directory-nya sudah benar.
Troubleshooting (masalah yang sudah pernah terjadi)
Grafik tidak muncul saat di-run
Penyebabnya hampir pasti baris figure('visible','off'); pada versi zip asli.
Grafik memang sengaja tidak ditampilkan, hanya disimpan sebagai PNG.
Solusinya: pakai zip _tampil-grafik, atau ubah baris itu menjadi figure;,
simpan, lalu run lagi. Perhitungan tetap jalan walaupun grafik tidak tampil —
buktinya variabel hasil di Workspace sudah berisi angka yang benar.
Error “file is not writable” saat menyimpan edit di Octave
Ini terjadi kalau berkas .m dibuka langsung dari dalam zip. Windows mengekstraknya
ke folder AppData\Local\Temp\...zip.dea yang ditandai tidak bisa ditulis, sehingga
Octave bisa membaca dan menjalankan, tetapi tidak bisa menimpa berkas itu.
Solusinya: klik OK pada dialog error, lalu File > Save File As ke folder biasa
(misalnya Documents) dengan nama yang sama, pindahkan Current Directory ke folder
baru itu, baru run lagi. Jangan memaksakan save di folder Temp.
Berkas PNG hasil print berukuran 0 byte
Penyebabnya sama dengan di atas: Current Directory masih folder Temp hasil buka zip
yang tidak bisa ditulis. Setelah berkas dipindah ke folder biasa dan di-run dari sana,
PNG akan tersimpan dengan ukuran normal.
Berkas pembangun (bukan untuk dikumpulkan)
Berkas-berkas ini hanya dipakai untuk membangun dan merevisi laporan, bukan bagian
dari laporan itu sendiri:
build_laporan.py — pembangun laporan awal.
expand_hasil.py — penambah analisis hasil (tabel + paragraf) ke berkas kiriman Agis.
restructure_bab.py — pemindah Hasil dari BAB I ke BAB II dan penggantian judul BAB III.
expand_kesimpulan.py — penambah subbab 2 dan 3 pada BAB III.
render_code_ss.py — perender gambar kode untuk laporan.
Catatan
Dokumen ini adalah draf kerja. Sebelum dikumpulkan, periksa kembali nama, NIM,
  dan isi laporan terhadap soal dan format yang diminta asisten.
Angka-angka pada bagian Ringkasan sudah diverifikasi silang: Kasus 1 dengan fungsi
  eksak, Kasus 2 dengan Gauss-Jordan dan substitusi balik, Kasus 3 dengan rumus eksak
  (225/π)^(1/3).
