function p = getAccoppiamento(mot,eli,m,f)
% calcolo potenza richiesta per sollevare la massa
s = 1; %[m]
t = 1; %[s]
g = 9.81; %[m*s^-2]
Fp =  - m*g; %[N]
% disp('Spinta [N]')
T = -Fp;  %[N]
L = T*s; %[J]
% disp('Potenza [W]')
P = L/t; %[W]
% disp('Spinta richiesta ad un rotore [N]')
Tn = T/4;
% disp('Potenza richiesta ad un rotore [W]')
Pn = P/4;
%---------------------------
% Calcolo della grandezze aumentate
% disp('Spinta aumentata [N]')
Ta = T + T*f; %[N]
% disp('Potenza aumentata [W]')
Pa = P + P*f; %[W]
%---------------------------
% Calcolo della spinta e della potenza richiesta per ogni motore
% disp('Spinta richiesta da un motore [N]')
Tm = Ta/4; %[N]
% disp('Potenza richiesta da un motore [W]')
Pm = Pa/4; %[W]

p{1}.t = 'accoppiamento';

p{2}.Tm = Tm;
p{2}.Pm = Pm;

p{3} = mot;
p{4} = eli;

end