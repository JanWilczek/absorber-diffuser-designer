function a = abs_coeff(z, c0, ro0, psi)

R = ((z/(ro0*c0))*cos(psi) - 1)./((z/(ro0*c0))*cos(psi) + 1);

a = 1 - abs(R).^2;