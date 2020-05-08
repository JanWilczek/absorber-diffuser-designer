function impedance = surface_impedance_single_layer(z, k, d)

impedance = -1j * z.* cot(k.*d);