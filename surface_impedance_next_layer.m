function impedance = surface_impedance_next_layer(z_surface_inner, z_outer, k_outer, d_outer)

impedance = ( -1j * z_surface_inner.* z_outer.* cot(k_outer .* d_outer) + z_outer.^2) ./ (z_surface_inner - 1j * z_outer.* cot(k_outer .* d_outer));