function[err] = sample(v, w, alfF, alfS)
varnc = alfF*v + alfS*w;
mu = 0;
sigma = sqrt(varnc);
err = normrnd(mu,sigma);
end