function [zc, kc] = zc_kc(model, sigma, f, c0, ro0)

omega = 2 * pi * f;

X = ro0 * f / sigma;

if strcmp(model, 'DB')
    zc = ro0 * c0 * (1 + 0.0571 * X.^(-0.754) - 1i*0.087 * X.^(-0.732));
    kc = (omega / c0 ).*(1 + 0.0978 * X.^(-0.7) - 1i * 0.189 * X.^(-0.595));
elseif strcmp(model, 'Miki')
    zc = ro0 * c0 * (1 + 0.07 * (f / sigma).^(-0.632) - 1i*0.107*(f/sigma).^(-0.632));
    kc = (omega / c0).* (1 + 0.109 * (f / sigma).^(-0.618) - 1i*0.160*(f/sigma).^(-0.618));
end;
