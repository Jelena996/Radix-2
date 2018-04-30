function [ x] = Twiddle_koeficijenti( N,m )
%Funckija pravi vektor ciji su elementi koeficijenti kojim
%se stepenuje twiddle faktor u m-toj iteraciji.
%N predstavlja broj odbiraka ulazne sekvence na koje se primjenjuje
%radix-2 algoritam.



r=N/(2^(m-1)); %broj grupisanih sa istim koeficijentom twiddle faktora
k=0;
p=nextpow2(N);
t=2^(p-m);

for i=1:1:N/r

    for j=(r*(i-1)+1):2:((r*(i-1)+r))
     x(j)=0;
     x(j+1)=k*t;    
     
        
    end
    
 k=k+1;

 
end


end