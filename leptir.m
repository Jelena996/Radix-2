function [ x2 ] = leptir(x1 )
% Funkcija koja realizuje geometriju leptira za odbirke odnosno clanove
% vektora x1 i kao izlazni argument daje vektor x2 sa primjenjenom
% geometrijom leptira na odbirke ulaznog signala.


N=length(x1);

for i=1:1:N/2
    
   x2(i)=x1(i*2-1)+x1(2*i);
   x2(i+N/2)=x1(i*2-1)-x1(2*i);
   
   
end


end

