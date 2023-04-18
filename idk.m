%f=inline('exp(x)-3');
%df=inline('exp(x)');

f=inline('sin(x)-0.5');
df=inline('cos(x)');

%f=inline('log(x)+2');
%df=inline('1/x');

iteraci=20; % celkovy pocet iteraci

a=0; % pocatecni body omezujici reseni
b=1;

epsilon = []; % odhad chyby, tedy delku intervalu <a,b> v jednotlivych krocich
reseni = []; % aktualni odhad reseni

for i=1:iteraci
	c=(a+b)/2;
	epsilon(i)=b-a;
	reseni(i)=(a+b)/2;
    if epsilon(i) < 0.1
        break;
    end;
	if f(a)*f(c)<0
		b=c;
	else
		a=c;
	end;

end;

 xi=reseni(i); % pocatecni body omezujici reseni x(i)
 xi_p1=reseni(i)+epsilon(i)/2; % a x(i+1)

 for j=i+1:iteraci
	c=xi_p1-f(xi_p1)/df(xi_p1);
	epsilon(j)=abs(xi-xi_p1);
	xi=xi_p1;
	xi_p1=c;
	reseni(j)=c;
end;

koren=reseni(end) % odhad konecneho reseni
chyba=epsilon(end) % odhadem konecne chyby
i

% zobrazime vyvoj reseni v zavislosti na iteracich vlevo
subplot(131);
plot(1:iteraci,reseni);
title('Vyvoj reseni');
xlabel('iterace');
ylabel('reseni');

% zobrazime vyvoj chyby v zavislosti na iteracich uprostred
subplot(132);
plot(1:iteraci,epsilon);
title('Vyvoj chyby');
xlabel('iterace');
ylabel('\epsilon');

% zobrazime zavislost log epsilon_i+1 na log epsilon_i
subplot(133);
x=log10(epsilon(1:(length(epsilon)-1)));
y=log10(epsilon(2:(length(epsilon))));
plot(x,y);
title('log \epsilon_{i+1} na log \epsilon_i');
xlabel('log \epsilon_{i}');
ylabel('log \epsilon_{i+1}');


% Toto se z nejakeho duvodu rozbilo :( 
% provedeme fit daty primkou
%p=polyfit(x,y,1);

% smernice (tedy i rad) je
%p(1)

