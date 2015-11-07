function p = simulaMotori(m)

p{1}.t = 'motori';
p{1}.dim = m{6};

n =  m{6};

for j=2:n+1
    kv = m{j-1,1}{1}.kv *(2*pi/60); % from [rpm/v] to [rad/(sec*v)]
    r  = m{j-1,1}{1}.r;
    i0 = m{j-1,1}{1}.i0;
    vNom = m{j-1,1}{1}.vNom;
    
    p{j}.o = 0:0.1:kv*vNom;
    p{j}.i = (vNom-(p{j}.o./kv))./r;
    p{j}.q = (p{j}.i-i0)./kv;
    p{j}.p = p{j}.q.*p{j}.o;%((p{j}.i-i0).*p{j}.o)./kv;
    p{j}.e = (1-((i0*r)./(vNom - p{j}.o./kv))).*(p{j}.o./(vNom*kv));
    
    p{j}.nome = m{j-1,1}{1}.nome;

end






end