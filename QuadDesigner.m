%%
clc
clear all
close all
%%
% Dati modello progettuale
m = 0.35; %[Kg]
f = 0.6;  %[%]
%%
motori = getInsiemeMotori();
ris_motori = simulaMotori(motori);
plotRisultati(ris_motori);
%%
eliche = getInsiemeEliche();
ris_eliche = simulaEliche(eliche);
plotRisultati(ris_eliche);
%%
ris_accoppiamento = getAccoppiamento(ris_motori, ris_eliche, m, f);
plotRisultati(ris_accoppiamento);
%%
batterie = getInsiemeBatterie();
ris_batterie = getStimaDurata(motori, batterie);
plotRisultati(ris_batterie);