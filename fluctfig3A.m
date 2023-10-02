function NC=fluctfig3A(T)

%FUNCTION TO SIMULATE POP DYNAMICS OF SLF OVER TIME WITH PERIOD

%CONTROL EFFORT DEPENDENT OF POPULATION SIZE (allocate a lot of control if

%many (>1000) and reduce control if few (<1000).

% TEMPERATURE WAS TAKEN OUT HERE; USING ONE CONTROL

p1=0.99; %Control effort when population larger than 1000

p2=0.05; %Control effort when population smaller than 1000

sPO=0.62;
sNP=0.74;
sNO=sPO*sNP;
sAN=0.25;
F=47.73;
sPOx=0;
sNPx=sNP;
sNOx=sPOx*sNPx;
sANx=sAN;
Fx=F;
 

N=1000; %Start with 1000 lanternfly

NC=[N]; %to collect population size over time 

 
for t=1:T

        if N>1000 %and there are more than 1000

            N= (sPOx*p1 + sPO*(1-p1)) * (sNPx*p1 + sNP*(1-p1))* (sANx*p1 + sAN*(1-p1)) * (Fx*p1 + F*(1-p1)) * N; %put in a lot of control effort

        else %and there are less than 1000

            N= (sPOx*p2 + sPO*(1-p2)) * (sNPx*p2 + sNP*(1-p2))* (sANx*p2 + sAN*(1-p2)) * (Fx*p2 + F*(1-p2)) * N; %put in a less control effort

        end

    
    NC=[NC,N]; %collect pop size

end

plot(1:size(NC,2),NC,'LineWidth',1.25)
%title('Population Fluctuations with Varying Control Efforts')
ax=gca;
ax.FontSize = 13;
ylabel('Population Size')
xlabel('Years Since Infestation')
set(gcf, 'Color', 'White')
hold on


