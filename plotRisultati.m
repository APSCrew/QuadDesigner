function plotRisultati(ris)


if( strcmp(ris{1}.t,'motori') )
    
    n1 = ris{2}.nome;
    n2 = ris{3}.nome;
    n3 = ris{4}.nome;
    n4 = ris{5}.nome;
    n5 = ris{6}.nome;

    figure
    plot(ris{2}.o,max(ris{2}.i,0),'b',ris{3}.o,max(ris{3}.i,0),'r',ris{4}.o,max(ris{4}.i,0),'g',ris{5}.o,max(ris{5}.i,0),'m',ris{6}.o,max(ris{6}.i,0),'c');
    title('Velocità Angolare - Corrente')
    xlabel('\omega [rad/s]')
    ylabel('I [A]')
    legend(n1,n2,n3,n4,n5);

    figure
    plot(ris{2}.o,max(ris{2}.q,0),'b',ris{3}.o,max(ris{3}.q,0),'r',ris{4}.o,max(ris{4}.q,0),'g',ris{5}.o,max(ris{5}.q,0),'m',ris{6}.o,max(ris{6}.q,0),'c');
    title('Velocità angolare - Coppia')
    xlabel('\omega [rad/s]')
    ylabel('Q_m [Nm]')
    legend(n1,n2,n3,n4,n5);

    figure
    plot(ris{2}.o,max(ris{2}.p,0),'b',ris{3}.o,max(ris{3}.p,0),'r',ris{4}.o,max(ris{4}.p,0),'g',ris{5}.o,max(ris{5}.p,0),'m',ris{6}.o,max(ris{6}.p,0),'c');
    title('Velocità angolare - Potenza')
    xlabel('\omega [rad/s]')
    ylabel('P [W]')
    legend(n1,n2,n3,n4,n5);

    figure
    plot(ris{2}.o,max(ris{2}.e,0),'b',ris{3}.o,max(ris{3}.e,0),'r',ris{4}.o,max(ris{4}.e,0),'g',ris{5}.o,max(ris{5}.e,0),'m',ris{6}.o,max(ris{6}.e,0),'c');
    title('Velocità angolare - Efficienza')
    xlabel('\omega [rad/s]')
    ylabel('\eta [%]')
    legend(n1,n2,n3,n4,n5);


elseif( strcmp(ris{1,1}.t,'eliche') )

    % fattori di conversione
    f1 = 4.44822; % from [lbf] to [N]
    f2 = 745.7;   % from [hp] to [W]
    f3 = 1.35582; % from [lbf*ft] to [Nm]

    n1 = ris{2}.nome;
    n2 = ris{3}.nome;
    n3 = ris{4}.nome;
    n4 = ris{5}.nome;
    n5 = ris{6}.nome;

    figure
    plot(ris{2}.o,ris{2}.s.*f1,'b',ris{3}.o,ris{3}.s.*f1,'r',ris{4}.o,ris{4}.s.*f1,'g',ris{5}.o,ris{5}.s.*f1,'m',ris{6}.o,ris{6}.s.*f1,'c')
    title('fitting spinta generata dall''elica')
    xlabel('\omega [rad/s]')
    ylabel('T_e [N]')
    ylim([0 10])
    legend(n1,n2,n3,n4,n5);

    figure
    plot(ris{2}.o,ris{2}.p.*f2,'b',ris{3}.o,ris{3}.p.*f2,'r',ris{4}.o,ris{4}.p.*f2,'g',ris{5}.o,ris{5}.p.*f2,'m',ris{6}.o,ris{6}.p.*f2,'c')
    title('fitting potenza generata dall''elica')
    xlabel('\omega [rad/s]')
    ylabel('P_e [W]')
    ylim([0 100])
    legend(n1,n2,n3,n4,n5);

    figure
    plot(ris{2}.o,ris{2}.c.*f3,'b',ris{3}.o,ris{3}.c.*f3,'r',ris{4}.o,ris{4}.c.*f3,'g',ris{5}.o,ris{5}.c.*f3,'m',ris{6}.o,ris{6}.c.*f3,'c')
    title('fitting coppia generata dall''elica')
    xlabel('\omega [rad/s]')
    ylabel('Q_e [Nm]')
    ylim([0 0.2])
    legend(n1,n2,n3,n4,n5);

elseif( strcmp(ris{1,1}.t,'accoppiamento') )
    
    n1 = ris{1,3}{1,2}.nome;
    n2 = ris{1,3}{1,3}.nome;
    n3 = ris{1,3}{1,4}.nome;
    n4 = ris{1,3}{1,5}.nome;
    n5 = ris{1,3}{1,6}.nome;

    n6 = ris{1,4}{1,2}.nome;
    n7 = ris{1,4}{1,3}.nome;
    n8 = ris{1,4}{1,4}.nome;
    n9 = ris{1,4}{1,5}.nome;
    n10 = ris{1,4}{1,6}.nome;
    n11 = 'spinta desiderata'

    % fattori di conversione
    f1 = 4.44822; % from [lbf] to [N]
    f3 = 1.35582; % from [lbf*ft] to [Nm]
    
    disp('Spinta richiesta da un motore [N]')
    ris{1,2}.Tm %[N]
    disp('Potenza richiesta da un motore [W]')
    ris{1,2}.Pm %[W]

    figure
    plot(ris{1,3}{1,2}.o,max(ris{1,3}{1,2}.q,0),'b--',ris{1,3}{1,3}.o,max(ris{1,3}{1,3}.q,0),'r--',ris{1,3}{1,4}.o,max(ris{1,3}{1,4}.q,0),'g--',ris{1,3}{1,5}.o,max(ris{1,3}{1,5}.q,0),'m--',ris{1,3}{1,6}.o,max(ris{1,3}{1,6}.q,0),'c--')
    hold on
    h=plot(ris{1,4}{1,2}.o,ris{1,4}{1,2}.c.*f3,'b',ris{1,4}{1,3}.o,ris{1,4}{1,3}.c.*f3,'r',ris{1,4}{1,4}.o,ris{1,4}{1,4}.c.*f3,'g',ris{1,4}{1,5}.o,ris{1,4}{1,5}.c.*f3,'m',ris{1,4}{1,6}.o,ris{1,4}{1,6}.c.*f3,'c');
    set(h(1),'LineWidth',1.5);
    set(h(2),'LineWidth',1.5);
    set(h(3),'LineWidth',1.5);
    set(h(4),'LineWidth',1.5);
    set(h(5),'LineWidth',1.5);
    ylim([0 0.25]);
    title('Accoppiamento grafico coppia motore-elica');
    xlabel('\omega [rad/s]')
    ylabel('Q_m [Nm]')
    legend(n1,n2,n3,n4,n5,n6,n7,n8,n9,n10);

    
    figure
    plot(ris{1,3}{1,2}.o,max(ris{1,3}{1,2}.i,0),'b--',ris{1,3}{1,3}.o,max(ris{1,3}{1,3}.i,0),'r--',ris{1,3}{1,4}.o,max(ris{1,3}{1,4}.i,0),'g--',ris{1,3}{1,5}.o,max(ris{1,3}{1,5}.i,0),'m--',ris{1,3}{1,6}.o,max(ris{1,3}{1,6}.i,0),'c--')
    hold on
    plot(ris{1,4}{1,2}.o,ris{1,4}{1,2}.s.*f1,'b',ris{1,4}{1,3}.o,ris{1,4}{1,3}.s.*f1,'r',ris{1,4}{1,4}.o,ris{1,4}{1,4}.s.*f1,'g',ris{1,4}{1,5}.o,ris{1,4}{1,5}.s.*f1,'m',ris{1,4}{1,6}.o,ris{1,4}{1,6}.s.*f1,'c');
    plot(ris{1,3}{1,5}.o,ris{1,2}.Tm.*(ones(size(ris{1,3}{1,5}.o))),'k-.');
    ylim([0 15]);
    xlim([0 5800]);
    title('Accoppiamento grafico corrente-spinta-spinta desiderata');
    xlabel('\omega [rad/s]')
    ylabel('T_m [N] - i [A]')
    legend(n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11);
    
    figure
    plot(ris{1,4}{1,2}.o,ris{1,4}{1,2}.s.*f1,'b',ris{1,4}{1,3}.o,ris{1,4}{1,3}.s.*f1,'r',ris{1,4}{1,4}.o,ris{1,4}{1,4}.s.*f1,'g',ris{1,4}{1,5}.o,ris{1,4}{1,5}.s.*f1,'m',ris{1,4}{1,6}.o,ris{1,4}{1,6}.s.*f1,'c');
    hold on
    plot(ris{1,3}{1,5}.o,ris{1,2}.Tm.*(ones(size(ris{1,3}{1,5}.o))),'k-.');
    ylim([0 3]);
    xlim([0 2500]);
    title('spinta generata - spinta desiderata');
    xlabel('\omega [rad/s]')
    ylabel('T_m [N]')
    legend(n6,n7,n8,n9,n10,n11);
    
elseif( strcmp(ris{1,1}.t,'batterie') )
    
    figure
    plot(1,ris{1,2}.min,'b*',2,ris{1,3}.min,'r*',3, ris{1,4}.min,'c*',4, ris{1,5}.min,'m*',5, ris{1,6}.min,'g*',6, ris{1,7}.min,'k*',7, ris{1,8}.min,'y*',8, ris{1,9}.min,'b*',9, ris{1,10}.min,'c*',10, ris{1,11}.min,'g*',11, ris{1,12}.min,'k*')
    ylabel('tempo [min]')
    ylim([0 12]);
    xlim([0 15]);
    title('durata batteria per ogni motore')
    legend(ris{1,2}.nome,ris{1,3}.nome,ris{1,4}.nome,ris{1,5}.nome,ris{1,6}.nome,ris{1,7}.nome,ris{1,8}.nome,ris{1,9}.nome,ris{1,10}.nome,ris{1,11}.nome,ris{1,12}.nome);
    
elseif( strcmp(ris{1,1}.t,'mod_prog') )
end

end
