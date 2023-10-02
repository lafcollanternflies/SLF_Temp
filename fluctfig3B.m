%VARYING TEMPERATURE MODEL: FIGURE 3

%FUNCTION FOR GIVEN AMOUNT OF YEARS

%INDUCES FLUCTUATIONS

%UNDER A CONTROL MEASURE 



function NC=fluctfig3B(Time)

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
To= -0.021411;
Tb=1.039553;


N=1000; %Start with 1000 lanternfly

NC=[N]; %to collect population size over time 

mxval=30.0;
mnval=15.0;


for t=1:Time

   T = [mnval + rand*(mxval-mnval)]; %RANDOM TEMP EVERY YEAR
   
   
    if mod(t,2)==1 %If odd year

        if N>1000 %and there are more than 1000
%proportion surviving from one stage to next
            N=(sNOx.*p1 + (To.*T+Tb).*(1-p1)) .* (sANx.*p1 + sAN.*(1-p1)) .* (Fx.*p1 + F.*(1-p1)).*N; %put in a lot of control effort

        else %and there are less than 1000

            N=(sNOx.*p2 + (To.*T+Tb).*(1-p2)) .* (sANx.*p2 + sAN.*(1-p2)) .* (Fx.*p2 + F.*(1-p2)).*N; %put in a lot of control effort

        end

    else %If even year

        if N>1000 %more than 1000

            N=(sNOx.*p1.*(To.*T+Tb) + (To.*T+Tb).*(1-p1)) .* (sANx.*p1 + sAN.*(1-p1)) .* (Fx.*p1 + F.*(1-p1)).*N; %put in a lot of control effort

        else %less than 1000

            N=(sNOx.*p2.*(To.*T+Tb) + (To.*T+Tb).*(1-p2)) .* (sANx.*p2 + sAN.*(1-p2)) .* (Fx.*p2 + F.*(1-p2)).*N; %put in a lot of control effort

        end

    end
    
    NC=[NC,N]; %collect pop size

end

plot(1:size(NC,2),NC,'-k','LineWidth',1.25)
set(gcf, 'Color', 'White')
ax=gca;
ax.FontSize = 13;
%legend('Control Effort','Control Effort and Temperature')
ylabel('Population Size')
xlabel('Years Since Infestation')
hold on