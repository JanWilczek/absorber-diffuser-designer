clear all;
clc;

c0 = 343; % m/s
ro0 = 1.21; % kg/m^3
sigma = 40000; % Pa/m^2 - flow resistivity
d = 0.02; % m
fmin = 50; % Hz
fmax = 6400; % Hz
f = fmin:2:fmax; % Hz
psi = 0; % rad

%% wall - air - mineral wool
air_thickness = 0.09;
wool_thickness = 0.05;
sigma = mineral_fibre_flow_resistivity(); % Pa/m^2

[zc_db, kc_db] = zc_kc('DB', sigma, f, c0, ro0);
[zc_m, kc_m] = zc_kc('Miki', sigma, f, c0, ro0);

z_air = surface_impedance_single_layer(ro0 * c0, 2*pi.*f./c0, air_thickness);
z_air_wool_db = surface_impedance_next_layer(z_air, zc_db, kc_db, wool_thickness);
z_air_wool_m = surface_impedance_next_layer(z_air, zc_m, kc_m, wool_thickness);

a_air_wool_db = abs_coeff(z_air_wool_db, c0, ro0, psi);
a_air_wool_m = abs_coeff(z_air_wool_m, c0, ro0, psi);

figure(2)
xticks_plot = 125 * 2.^(-1:1:5);
semilogx(f, a_air_wool_db,f, a_air_wool_m);
xlim([fmin fmax]);
set(gca,'XTick',xticks_plot);
title('Absorption coefficient of wall - air - mineral wool setup');
legend('Delany-Bazley model', 'Miki model', 'Location', 'southeast');
xlabel('f [Hz]');
ylabel('abs. coeff.');
