%FUNCTION OF TEMP & P FOR HEATMAP

% make column to multiply all elements by each element
T = [15 : 1 : 30]';
p= [0.0 :0.01: 1.0];

T=flip(T,1);

grc=[];
temp=[];
efforts=[];

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

%%%%%%%%%%%%%Growth Rate as a function of BOTH effort and temp%%%%%%%%%%%

gr= (sNOx.*p + (To.*T+Tb).*(1-p)) .* (sANx.*p + sAN.*(1-p)) .* (Fx.*p + F.*(1-p));
%gr= (T.*(1-p)).*(sAN.*(1-p)).*(F.*(1-p));


temp=[temp,T];

efforts=[efforts,p];
grc=[grc,gr];
 
heatmap(efforts,temp,grc,'GridVisible','off','CellLabelColor','none');
ax=gca;
ax.FontSize = 12;
ylabel('Temperature (Celsius)')
xlabel('Control Effort')
set(gcf, 'Color', 'White')
axs = struct(gca); %ignore warning that this should be avoided
cb = axs.Colorbar;
cb.Label.String = 'Growth Rate';
