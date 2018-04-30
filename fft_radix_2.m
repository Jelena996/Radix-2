function [ X ] = fft_radix_2( x)
%Realizovan algoritam koriscenjem pomocnih funckija:
%1. dopuni (Ako je dati niz duzine koja nije stepen broja 2).
%2. Twiddle_koeficijetni (Racuna koeficijente twiddle fakotra u k-toj
%iteraciji koja se zadaje kao ulazna vrijednost.)
%3. leptir-primjenjuje geometriju leptira na ulazni vektor x1

x1=dopuni(x);
N=length(x1);
p=nextpow2(N);
Wn=exp((-2*pi*j)/N);

x=bitrevorder(x1);

for i=1:1:p
    if (i==1)  %da se izbjegne mnozenje svakog clana sa 1 u prvoj iteraciji
        x2=leptir(x); x=x2;
        
    else
        faktori=Wn.^Twiddle_koeficijenti(N,i);
        x2=x.*faktori; 
        x=leptir(x2);     
    end

end
X=x;
end
