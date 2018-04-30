function [ h ] = Produzi( h, L )
%Funkcija produzava impulsni odziv kako bi mogla da se izvrsi blok
%konvolucija sa signalom duzine L.

Nh=length(h);
for i=Nh+1:1:Nh+L-1
    h(i)=0;
end

