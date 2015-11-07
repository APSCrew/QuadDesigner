function ris = simulaEliche(e)

% ocio alle unità di misura!
load('dati_eliche_apc_3')

apc = {apc_5_5x4_5 apc_5x5 apc_6x4 apc_7x4 apc_8x4};
d = [5.5 5 6 7 8];
p = [4.5 5 4 4 4];

[~,m] = size(apc);
rho = 0.00238;

ris{1}.t = 'eliche';
ris{1}.dim = m;


for i=2:m+1
    ris{i}.o = e{i-1}.rpm .* (2*pi/60); %[rad/s]
    
    dd = e{i-1}.d * 1/12;%[ft]
    
    % calcolo spinta
    ris{i}.s = ((e{i-1}.Ct .* rho * dd^4).* (e{i-1}.rpm ./ 60).^2);%[lbf]

    % calcolo coppia
    ris{i}.c = (((e{i-1}.Cp .* rho * dd^5).* (e{i-1}.rpm ./ 60).^2)./(2*pi)); %[lbf*ft]
    
    % calcolo potenza
    ris{i}.p = ris{i}.c .*(e{i-1}.rpm)./5252; %[hp]

    ris{i}.nome =  e{i-1}.nome;
end