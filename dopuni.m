function [ x] = dopuni( x )
%Funkcija koja ispituje da li je duzina unesene sekvence jednaka nekom
%stepenu broja 2 i ako nije onda se unesena sekvenca periodicno produzi
%nulama do prvog veceg broja koji jeste neki stepen broja 2.

N=length(x);
p=log(N)/log(2);
n=nextpow2(N);
if (p~=N) 
    for i=1:1:(2^n-N)
        x(N+i)=0;
    end
end

        
end

