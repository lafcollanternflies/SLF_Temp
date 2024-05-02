%3. Effectiveness of control measures when proportion p of the population
%is treated (Fig. 3)

%GROWTHRATE WHEN PROPORTION p OF POPULATION TREATED WITH CONTROLS

%Initiate arrays to store values
COMB=[];
COMBTmax=[];
COMBTmin=[];

x=0:0.001:1;

%BASE PARAMETERS UNDER NO CONTROL
sPO=0.62;
sNP=0.74;
%new temp parameter
sNO=sPO*sNP;
sAN=0.25;
F=47.73;
Tmax=20;
Tmin=27;
a11=0.1846;
b11=-0.0547;
c11=0.3877;
a21=7.9501;
b21=0.1764;
c21=3.7651;
a12=-0.02141;
b12=1.0395;
a22=0.1009;
b22=1.0322;

%CREATE FIG. 3
for p=0:0.001:1 

%All combined NO TEMP
sPOx=0;
sNPx=0;
sANx=0;%.13;
Fx=0;%27.21;
COMB=[COMB,(sPOx*p+sPO*(1-p))*(sNPx*p+sNP*(1-p))*(sANx*p+sAN*(1-p))*(Fx*p+F*(1-p))];

%All combined w Tmax
sPOx=0;
sNPx=0;
sNOx=sPOx*sNPx;
sANx=0;%.13;
Fx=0;%27.21;
if Tmax>0.06 
COMBTmax=[COMBTmax,(sNOx.*p + (a12.*Tmax+b12).*(1-p)) .* (sANx.*p + sAN.*(1-p)) .* (Fx.*p + F.*(1-p))];
else 
COMBTmax=[COMBTmax,(sNOx.*p + (a22.*Tmax+b22).*(1-p)) .* (sANx.*p + sAN.*(1-p)) .* (Fx.*p + F.*(1-p))];
end

%All combined w Tmin
sPOx=0;
sNPx=0;
sNOx=sPOx*sNPx;
sANx=0;%.13;
Fx=0;%27.21;
if Tmin>0.06 ]
COMBTmin=[COMBTmin,(sNOx.*p + (a12.*Tmin+b12).*(1-p)) .* (sANx.*p + sAN.*(1-p)) .* (Fx.*p + F.*(1-p))];
else 
COMBTmin=[COMBTmin,(sNOx.*p + (a22.*Tmin+b22).*(1-p)) .* (sANx.*p + sAN.*(1-p)) .* (Fx.*p + F.*(1-p))];
end
end

%plot
plot(x,COMBTmax,'--b','LineWidth',1)
hold on
plot(x,COMBTmin,'--m','LineWidth',1)
hold on
plot(x,COMB,'-r','LineWidth',1)
hold on

%add threshold
plot(x,ones(1,size(x,2)),'-.k')
xlabel('Proportion treated (p)')
ylabel('Annual growth rate (\lambda^x(p,T))')
set(gcf, 'Color', 'White')
legend('Max Survival Rate Temp','Min Survival Rate Temp','No Temp','Growth Threshold')
X=0;
