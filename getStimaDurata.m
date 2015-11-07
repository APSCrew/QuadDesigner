function p = getStimaDurata(m, b)

p{1}.t = 'batterie';
k=2;
for i=1:4
    batteria = b{i,1}{1,1}.iNom;
    
    for j=1:5
        if(b{i,1}{1,1}.vNom == m{j,1}{1,1}.vNom)
            iMax = m{j,1}{1,1}.iMax*4;

            tFlyh = (batteria/(1000*iMax)); %[h]
            tFlym = tFlyh * 60; %[min]
            min = floor(tFlym); %[min]
            sec = floor((tFlym - min) * 60); %[sec]

            p{k}.min = min;
            p{k}.sec = sec;
            p{k}.nome = strcat(b{i,1}{1,1}.nome,' - ',m{j,1}{1,1}.nome);
            k=k+1;
        end
    end
end

 p{1}.dim = k-2;

end