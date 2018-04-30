function [ x ] = IDFT_radix2( X)
%Funkcija koja racuna inverznu diskretnu Furijeovu transformaciju za vektor
%X, koriscenjem vec relizovanog algoritma fft_radix_2;

N=length(X);
X=conj(X);
x=fft_radix_2(X);
x=x.*(1/N);
x=conj(x);



end

