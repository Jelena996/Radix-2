function [A] = podijeli_u_matricu( x,h,L)
%Funkcija dijeli ulaznu sekvencu na potreban broj podsekvenci, a iste
%dopunjuje sa Nh-1 nula. Zatim se koristeci implementiran algoritam
%fft_radix_2 racuna DFT te jedne podsekvence i mnozi sa DFT-om impulsnog
%odziva. A onda se dobijena sekvenca koristeci implementiranu funkciju
%IDFT_radix2 (ili ugradjenu ifft) prebacuje u vremenski domen i koristi kao
%jedna vrsta u matrici A. Pomenuta matrica A predstavlja izlazni argument.

Nh=length(h);
N=length(x);
A=[];
h=Produzi(h,L);
H=fft_radix_2(h);

for i=1:1:N/L
   for k=1:1:L
       x1(k)=x((i-1)*L+k);
   end
   for k=L+1:1:L+Nh-1;
       x1(k)=0;
   end
   X1=fft_radix_2(x1);
   
   X1=X1.*H;  
   
   x1=ifft(X1);
   A=cat(1,A,x1); %dodat vektor u matricu
end
end

