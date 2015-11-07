function ris = getInsiemeEliche()

% ocio alle unità di misura!
load('dati_eliche_apc_3')

apc = {apc_5_5x4_5 apc_5x5 apc_6x4 apc_7x4 apc_8x4};
d = [5.5 5 6 7 8];
p = [4.5 5 4 4 4];

[~,m] = size(apc);
rho = 0.00238;
for i=1:m
    temp = apc{1,i};
    rpm =[];
    Ct =[];
    Cp = [];
    [n,~] = size(temp);
    for j=1:n
        rps = temp(j,3)/(temp(j,1)*(d(1,i)/12)^4*rho);
        rpm(j,1) = sqrt(rps)*60;
        Ct(j,1) = temp(j,1);
        Cp(j,1) = temp(j,2);
    end
    ris{i}.d = d(1,i); 
    ris{i}.p = p(1,i);
    ris{i}.rpm = rpm;
    ris{i}.Ct = Ct;
    ris{i}.Cp = Cp;
    ris{i}.nome = [num2str(d(1,i)) 'x' num2str(p(1,i))];
end

end