% Kasus 3 - Persamaan nonlinear jari-jari bola/tabug
% V_bola = 4/3*pi*r^3 = 300  ->  V_tabung = 2*pi*r^3 = 450 (tinggi = 2r)
% V_luar = V_tabung - V_bola = 2/3*pi*r^3 = 150.
% Persamaan nonlinear yang dipakai (setara dengan 4/3*pi*r^3 - 300 = 0):
%   f(r) = (2/3)*pi*r^3 - 150 = 0
f = @(r) (2/3)*pi*r.^3 - 150;
fprintf('f(3)=%.4f  f(4)=%.4f  f(5)=%.4f -> perubahan tanda di [4,5] (dari grafik)\n', f(3), f(4), f(5));
% Grafik f(r) untuk penentuan nilai awal
r = 0:0.01:6;
figure;
plot(r, f(r), 'b-', 'LineWidth', 1.5); hold on;
plot(r, zeros(size(r)), 'k--'); plot([4 5], [f(4) f(5)], 'ro');
grid on; xlabel('r (cm)'); ylabel('f(r)');
title('Kasus 3: f(r) = (2/3)pi r^3 - 150, akar di [4,5]');
legend('f(r)','f=0','ujung selang [4,5]','Location','best');
print('kasus3_grafik.png','-dpng','-r150');
% Biseksi pada [4,5], berhenti bila lebar selang/2 < 1e-6
a = 4; bb = 5; tol = 1e-6;
fprintf('\nBiseksi [4,5], tol lebar/2 < 1e-6:\n');
for it = 1:100
    c = (a+bb)/2;
    fprintf('  iter %2d: a=%.7f b=%.7f c=%.7f f(c)=%+.6f lebar=%.2e\n', it, a, bb, c, f(c), bb-a);
    if f(c) == 0 || (bb-a)/2 < tol, break; end
    if sign(f(c)) == sign(f(a)), a = c; else, bb = c; end
end
r_akar = c;
fprintf('HASIL: r = %.7f cm\n', r_akar);
fprintf('V_bola = %.4f cm^3, V_tabung = %.4f cm^3, V_luar = %.4f cm^3\n', ...
    (4/3)*pi*r_akar^3, 2*pi*r_akar^3, (2/3)*pi*r_akar^3);
fprintf('Rumus eksak pembanding: r = (225/pi)^(1/3) = %.7f cm\n', (225/pi)^(1/3));
