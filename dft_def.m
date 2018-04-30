function [ X ] = dft_def( x )
%DFT_DEF Diskretna Fourijeova transformacija (DFT) signala x
%   DFT N-dimenzionog vektora x izracunata po definiciji u N tacaka prema
%   jednacini 4.16 iz [1] (prvi blok u kodu - nekomentarisani) ili pomocu
%   matricne jednakosti 4.19 iz [1] (drugi blok u kodu, zakomentarisati
%   prvi i odkomentarisati drugi blok za ovakvu implementaciju).
%
%   Ulazni paramteri: x - N-dimenzioni signal
%   Izlazni parametri: X - Kompleksni koeficijenti DFT-a signala x
%
%   Reference:
%   [1] M. Popovic, "Digitalna obrada signala", Akademska misao, Beograd,
%   2003.

%# codegen

Nx = length(x);

% definiciji (j-na 4.16 iz [1])
X = zeros(1,Nx);
n = 0:Nx-1;
Ws = exp(-1j*2*pi/Nx*n);%
for k = 1:Nx
    X(k) = sum(x.*(Ws.^(k-1)));
end

%% mnozenjem matrica (j-na 4.19 iz [1])
 %[n,k] = meshgrid(0:Nx-1, 0:Nx-1); %za detalje, kucati: help meshgrid
 %WN = exp(-1*j*2*pi/Nx*n.*k);
 %X = WN*x';

end

