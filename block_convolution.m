function [ C] = block_convolution2( x,h,L )
%BLOCK_CONVOLUTION (OVERLAP-AND-ADD)
%Funkcija koristeci pomocnu funkciju podijeli_u_matricu pravi matricu A
%koja kao vrste ime vektore duzine L+Nh-1, koji predstavljaju konvoluciju
%blok sekvenci ulaznog vektora (koje su produzene sa Nh-1 nula). Ova
%funkcija vrsi preklapanje odnosno sabiranje preklopljenih djelova i sve
%zajedno upisuje u izlazni argument tj. vektor C;

%NapomenaÈ Iako nije naznaèeno u zadatku u sluèaju da se dobije da dužina signala
%nije jednaka cjelobrojnom umnošku parametra L, taj signal se mora
%produžiti nulama. Kako u zadatku nije navedeno da u opticaju može doæi
%takvo L, taj dio koda je zakomentarisan:
  %N=length(x);
   %a=mod(N,L);
   %if (a~=0) then 
   % Nxx=L*(N/L+1);
   % for i=Nx+1:1:Nxx 
      %x(i)=0;
     %end
   %end
   

N=length(x);
Nh=length(h);
A=podijeli_u_matricu(x,h,L);

C=[];
n=N/L;
for i=1:1:n

    
    if(i==1)
       for k=1:1:L
        B(k)=A(1,k);
       end
       for k=1:1:Nh-1
       B(k+L)=A(1,k+L)+A(2,k);
       
       end
        C=cat(2,C,B);
        continue
    end
   
   
   if(i==n)
       %for k=1:1:Nh-1
       %  D(k)= A(n-1,L+k)+A(n,k);
       % A=block_convolution2(x,3,4)end
       for k=1:1:L
         D(k)=A(n,k+Nh-1);
       end
       C=cat(2,C,D);
        continue
   end
     
      
  if(1<i<n)

      for k=1:1:L-Nh+1
               E(k)=A(i,k+Nh-1);
           end
           
           for k=L-(Nh-1)+1:1:L
               E(k)= A(i,k+Nh-1)+A(i+1,k+Nh-1-L);
           end
           
     C=cat(2,C,E);
        continue
    end
   
   
        
   end


end

