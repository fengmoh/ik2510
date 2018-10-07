par = setpart;
par.cellradius = 400;
par.km = 1;
par.lm = 2;
par.kn=5; par.ln = 5;
par.sps = 1;
par.alpha = 4; par.raa = 0;
par.sigma = 8; par.usefastf = 0;
par.kpc = 15;
par.offtraf = 10;
par.noise = -128;
position=0
%start simulate
for i=0:0.5:1
    position=position + 1
    par.raa = i;
    [res,par,sta, sys] = runeft(par)
    subplot(3,1,position)
    plot(sta.cdl, sta.idl,'*');
    hold on
    plot(sta.cul,sta.iul,'*');
    xlabel('Received power(dBm)')
    ylabel('Interference(dB)')
    til =[ 'raa = ',num2str(i)]
    title(til)
    legend('downlink','uplink')
end
