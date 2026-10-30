% Kasus 2 - SPL harga per kg (beras, telur, tepung, ayam)
% Urutan variabel: [beras; telur; tepung; ayam], satuan kg, harga Rp/kg.
% Konversi: 1 kg=1000 g, 1 hg=100 g=0.1 kg, 1 dag=10 g=0.01 kg.
%   Adel : 2.5, 1.5, 5, 0.5 -> 161000
%   Briza: 4, 0.75, 1, 2   -> 149000
%   Caca : 2, 1.5, 0.5, 6  -> 251500
%   Dinda: 1, 4.25, 2, 0.9 -> 173000
A = [2.5 1.5 5 0.5; 4 0.75 1 2; 2 1.5 0.5 6; 1 4.25 2 0.9];
b = [161000; 149000; 251500; 173000];
fprintf('det(A) = %.4f (tak nol -> solusi tunggal)\n', det(A));
fprintf('Dominan diagonal urutan asal: TIDAK (tiap baris: diagonal < jumlah kolom lain)\n');
for i = 1:4
    fprintf('  baris %d: |a_ii|=%.2f < %.2f (jumlah |lain|)\n', i, abs(A(i,i)), sum(abs(A(i,:)))-abs(A(i,i)));
end
% Penukaran baris TIDAK mengubah solusi. Susun ulang agar dominan diagonal:
%   Briza (beras dominan 4), Dinda (telur dominan 4.25),
%   Adel (tepung dominan 5), Caca (ayam dominan 6).
perm = [2 4 1 3];
Ap = A(perm,:); bp = b(perm);
fprintf('Setelah tukar baris %s: dominan diagonal KETAT di semua baris\n', mat2str(perm));
for i = 1:4
    fprintf('  baris %d: |a_ii|=%.2f > %.2f\n', i, abs(Ap(i,i)), sum(abs(Ap(i,:)))-abs(Ap(i,i)));
end
% Gauss-Seidel pada sistem yang sudah disusun ulang, x0 = 0, tol 1e-6
x = zeros(4,1); tol = 1e-6; maks = 100;
fprintf('\nGauss-Seidel (sistem tersusun ulang), x0=0:\n');
for it = 1:maks
    x_lama = x;
    for i = 1:4
        x(i) = (bp(i) - Ap(i,:)*x + Ap(i,i)*x(i)) / Ap(i,i);
    end
    fprintf('  iter %2d: beras=%.4f telur=%.4f tepung=%.4f ayam=%.4f (selisih maks %.2e)\n', ...
        it, x(1), x(2), x(3), x(4), max(abs(x-x_lama)));
    if max(abs(x-x_lama)) < tol, break; end
end
fprintf('HASIL Gauss-Seidel: beras=%.2f telur=%.2f tepung=%.2f ayam=%.2f\n', x(1), x(2), x(3), x(4));
% Verifikasi silang Gauss-Jordan (rref) pada sistem asal
R = rref([A b]);
fprintf('Verifikasi Gauss-Jordan (rref sistem asal): beras=%.2f telur=%.2f tepung=%.2f ayam=%.2f\n', ...
    R(1,5), R(2,5), R(3,5), R(4,5));
fprintf('Cek substitusi A*x-b = %s\n', mat2str(A*x-b, 6));
