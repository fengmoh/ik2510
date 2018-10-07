par = setpart;
par.cellradius = 400; par.alpha = 4;
par.sigma = 8; par.raa = 0.5;
par.usefastf = 0; par.noise = -118;
par.offtraf = 7;%TODO
num_channel = 84;
par.km =1; par.lm = 2;
par.kn =2; par.ln = 3;
K = par.km^2 + par.lm^2 + par.km*par.lm
par.kpc = floor(num_channel/K)
kpc = par.kpc
pch_load = par.offtraf /par.kpc;
par.nframes = 1;

[res, par, sta, sys] = runeft(par)

blocking = 0;
outage = 0
for i =1:length(sta.m)
    if isnan(sta.cul(i))
        blocking = blocking +1
    end
    if sta.sirul(i)<10
        outage = outage + 1;
    end
end
block_rate = blocking/sta.mtop;
outage_rate = outage/sta.mtop;
 
p = par.offtraf; n = kpc;
syms k;
theo_value = (p^n/factorial(n))/symsum(p^k/factorial(k),k,0,n)

        