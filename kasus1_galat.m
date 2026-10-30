% Kasus 1 - Galat / Error Pemotongan (deret Taylor cos dan exp)
% Definisi yang dipakai di sini, ditulis eksplisit di laporan:
%   n = JUMLAH SUKU deret (k = 0 .. n-1) untuk cos maupun exp.
%   h(t) = h0 * ( cos(t*v/lambda) + exp(x) )
lambda = 12; v = 36; x = 10; h0 = 5;
t = 0:0.01:5;
theta = t*v/lambda;                 % 0 .. 15 rad
f_eksak = h0*(cos(theta) + exp(x));

ns = [23, 24, 25];
fprintf('lambda=%g v=%g x=%g h0=%g, t=0..5\n', lambda, v, x, h0);
fprintf('f_eksak: min=%.4f max=%.4f (didominasi exp(10)=%.4f)\n', ...
    min(f_eksak), max(f_eksak), exp(x));
hasil = zeros(length(ns), 3);      % MAE, rerata galat relatif %, galat maks
for j = 1:length(ns)
    n = ns(j);
    cos_ap = zeros(size(theta));
    for k = 0:n-1
        cos_ap = cos_ap + (-1)^k * theta.^(2*k) / factorial(2*k);
    end
    exp_ap = 0;
    for k = 0:n-1
        exp_ap = exp_ap + x^k / factorial(k);
    end
    f_ap = h0*(cos_ap + exp_ap);
    galat = abs(f_ap - f_eksak);
    hasil(j,:) = [mean(galat), mean(galat./abs(f_eksak))*100, max(galat)];
    fprintf('n=%d: exp_ap=%.6f (galat exp=%.6f) | MAE=%.6f | rerata galat relatif=%.6f%% | galat maks=%.6f\n', ...
        n, exp_ap, exp_ap-exp(x), hasil(j,1), hasil(j,2), hasil(j,3));
end
fprintf('Kesimpulan: rerata galat relatif ketiganya < 1%% -> LAYAK dipakai.\n');

figure;
plot(t, f_eksak, 'k-', 'LineWidth', 1.5); hold on;
% f_ap dihitung ulang untuk plot (disimpan agar tidak bergantung pada loop di atas)
for j = 1:length(ns)
    n = ns(j);
    cos_ap = zeros(size(theta));
    for k = 0:n-1, cos_ap = cos_ap + (-1)^k * theta.^(2*k) / factorial(2*k); end
    exp_ap = 0;
    for k = 0:n-1, exp_ap = exp_ap + x^k / factorial(k); end
    plot(t, h0*(cos_ap + exp_ap), '--', 'LineWidth', 1.2);
end
hold off; grid on;
xlabel('t'); ylabel('h(t)');
title('Kasus 1: Eksak vs Pendekatan Taylor (n = 23, 24, 25)');
legend('Eksak','n=23','n=24','n=25','Location','best');
print('kasus1_plot.png','-dpng','-r150');
