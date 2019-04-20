clc;
clear all;
close all;

# 2D
DGA_2DG20RaC75p200 = csvread('DGA_2DG20RaC75p200.csv');
DGA_2DG20RaC50p200 = csvread('DGA_2DG20RaC50p200.csv');
DGA_2DG20TaC75p200 = csvread('DGA_2DG20TaC75p200.csv');
DGA_2DG20TaC50p200 = csvread('DGA_2DG20TaC50p200.csv');
DGA_2DG30RaC75p200 = csvread('DGA_2DG30RaC75p200.csv');
DGA_2DG30RaC50p200 = csvread('DGA_2DG30RaC50p200.csv');
DGA_2DG30TaC75p200 = csvread('DGA_2DG30TaC75p200.csv');
DGA_2DG30TaC50p200 = csvread('DGA_2DG30TaC50p200.csv');
PSO_2Ds50          = csvread('PSO_2Ds50.csv');

# 5D
DGA_5DG40RaC75p450 = csvread('DGA_5DG40RaC75p450.csv');
DGA_5DG40RaC50p450 = csvread('DGA_5DG40RaC50p450.csv');
DGA_5DG40TaC75p450 = csvread('DGA_5DG40TaC75p450.csv');
DGA_5DG40TaC50p450 = csvread('DGA_5DG40TaC50p450.csv');
PSO_5Ds150         = csvread('PSO_5Ds150.csv');

# 10D
DGA_10DG50RaC75p900 = csvread('DGA_10DG50RaC75p900.csv');
DGA_10DG50RaC50p900 = csvread('DGA_10DG50RaC50p900.csv');
DGA_10DG50TaC75p900 = csvread('DGA_10DG50TaC75p900.csv');
DGA_10DG50TaC50p900 = csvread('DGA_10DG50TaC50p900.csv');
DGA_10DG50T2p75p900 = csvread('DGA_10DG50T2p75p900.csv');
PSO_10Ds300         = csvread('PSO_10Ds300.csv');

# plot results
t = 1:length(PSO_2Ds50);

# use gnuplot toolkit
graphics_toolkit('gnuplot');

figure(1);
plot(t, DGA_2DG20RaC75p200(1:2:1000, 2), '-k', 'linewidth', 2, ...
     t, PSO_2Ds50(:, 2), '-', 'linewidth', 2);
%hold on;
%plot(t, reER1p(:, 3), '-', 'linewidth', 2, ...
%     t, reERUn(:, 3), '-', 'linewidth', 2, ...
%     t, reET2p(:, 3), '-', 'linewidth', 2, ...
%     t, reETUn(:, 3), '-', 'linewidth', 2);
%hold on;
%plot(t, reE2R1p(:, 3), '-b', 'linewidth', 2, ...
%     t, reE2T1p(:, 3), '-', 'linewidth', 2, ...
%     t, reE3R2p(:, 3), '-', 'linewidth', 2, ...
%     t, reE3T2p(:, 3), '-', 'linewidth', 2);
%hold off;
grid minor;
legend('DGA\_2DG20RaC75p200', ...
       'PSO\_2Ds50', ...
       'location', 'southeast');
title('AG vs PSO - Experimentos 2D');
xlabel('Número de gerações/iterações');
ylabel('Fitness');
axis([1 500 .98 1]);

figure(2);
plot(t, DGA_5DG40TaC75p450(1:2:1000, 4), '-k', 'linewidth', 2, ...
     t, PSO_5Ds150(:, 4), '-', 'linewidth', 2);
#bar(p, [reER1p(p, 3) reERUn(p, 3) reET2p(p, 3) reETUn(p, 3)]);
%plot(t, renET2p(:, 3), '-k', 'linewidth', 2, ...
%     t, reET2p(:, 3), '-', 'linewidth', 2, ...
%     t, reE2R1p(:, 3), '-', 'linewidth', 2);
%
grid minor;
legend('DGA\_5DG40TaC75p450', ...
       'PSO\_5Ds150', ...
       'location', 'southeast');
title('AG vs PSO - Experimentos 5D - média dos medianos');
xlabel('Número de gerações/iterações');
ylabel('Fitness');
ylim([.5 1]);

figure(3);
plot(t, DGA_10DG50TaC75p900(1:2:1000, 2), '-k', 'linewidth', 2, ...
     t, PSO_10Ds300(:, 2), '-', 'linewidth', 2);
#bar(p, [reER1p(p, 3) reERUn(p, 3) reET2p(p, 3) reETUn(p, 3)]);
%plot(t, renET2p(:, 3), '-k', 'linewidth', 2, ...
%     t, reET2p(:, 3), '-', 'linewidth', 2, ...
%     t, reE2R1p(:, 3), '-', 'linewidth', 2);
%
grid minor;
legend('DGA\_10DG50TaC75p900', ...
       'PSO\_10Ds300', ...
       'location', 'southeast');
title('AG vs PSO - Experimentos 10D');
xlabel('Número de gerações/iterações');
ylabel('Fitness');
axis([1 500 .98 .9905]);

%
%figure;
%bar(p, [renET2p(p, 3) reET2p(p, 3) reE2R1p(p, 3)]);
%grid minor;
%legend('renET2p', ...
%       'reET2p', ...
%       'reE2R1p', ...
%       'location', 'northwest');
%ylim([.7 1]);
%
%figure;
%bar(p, [reE2R1p(p, 3) reE2T1p(p, 3) reE3R2p(p, 3) reE3T2p(p, 3)]);
%grid minor;
%legend('reE2R1p', ...
%       'reE2T1p', ...
%       'reE3R2p', ...
%       'reE3T2p', ...
%       'location', 'northwest');
%ylim([.7 1]);

%figure;
%bar(p, [renET2p(p, 3) reER1p(p, 3) reE2R1p(p, 3)]);
%grid minor;
%legend('nET2p', ...
%       'ER1p', ...
%       'Ee2R1p', ...
%       'location', 'northwest');
%ylim([.7 1]);

# show statistics resume
disptbl('PSO_5Ds150', PSO_5Ds150, 50);
disptbl('DGA_2DG20TaC50p200', PSO_10Ds300, 50);
%disptbl('reE3T2p', reE3T2p, 50);