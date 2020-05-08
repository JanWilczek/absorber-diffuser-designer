function sigma = mineral_fibre_flow_resistivity()
    air_viscosity = 1.84e-5; % poiseuille
    porosity = 0.95; % mineral wool (0.92-0.95)
    fibre_radius = 5e-6; % m (1-10 um)
    sigma = 4.4 * air_viscosity * (1 - porosity) ^ 1.59 / fibre_radius^2;
