%Prva dva pasusa su testiranje realizovane funkcije nezavisno od zadatka.
%Mogu se zakomentarisati.


%Test na signalu koji je suma sinusoida a N je stepen broja 2.
%---------------------------------------------------------------------
Novo=64;
nnovo=0:1:Novo-1;
xnovo=cos(2*pi*1/Novo*nnovo)+8*cos(2*pi*3/Novo*nnovo)+8*cos(2*pi*4/Novo*nnovo);


figure
subplot(211), stem(nnovo,fft(xnovo)),title('Spektar dobijen funkcijom fft'),xlabel('freq [Hz]'),ylabel('X')
subplot(212),stem(nnovo,fft_radix_2(xnovo)), title('Spektar dobijen algoritmom fft-radix-2'),xlabel('freq [Hz]'),ylabel('X')


%Test na signalu èije N nije stepen broja 2.
%---------------------------------------------------------------------------------------
Novo1=31;
nnovo1=0:1:Novo1-1;
xnovo1=cos(2*pi*1/31*nnovo1)+8*cos(2*pi*3/31*nnovo1);
Xnovo=fft_radix_2(xnovo1);
figure
subplot(211), stem(nnovo1,fft(xnovo1)),title('Spektar dobijen funkcijom fft'),xlabel('freq [Hz]'),ylabel('X')
nn=0:1:length(Xnovo)-1;
subplot(212),stem(nn,fft_radix_2(xnovo1)), title('Spektar dobijen algoritmom fft-radix-2'),xlabel('freq [Hz]'),ylabel('X')


%Test na signalu iz prvog zadatka.
%----------------------------------------------------------------------

N=1125;
f0l=100/1125;
f02=124/1125;
f03=130/1125;
n=0:N-1;
x1=cos(2*pi*f0l*n);
x2=cos(2*pi*f02*n);
x3=cos(2*pi*f03*n);
xsignal=5*x1+10*x2+10*x3;

Xf=fft(xsignal);
Xr=fft_radix_2(xsignal);
nx=0:(N/2-1);
nx=nx*10;
figure
subplot(211),stem(nx,Xf(1:N/2)),title('Spektar signala iz 1. zadatka-koriscenjem fft-a'),xlabel('freq [Hz]'),ylabel('X')
subplot(212), stem(nx,Xr(1:N/2)), title('Spektar signala iz 1. zadatka-koriscenjem fft-radix2'),xlabel('freq [Hz]'),ylabel('X')
%--------------------------------------------------------------------------

%TREÆA STAVKA DRUGOG ZADATKA:
%-----------------------------------------------------------------------


%Crtanje chopin.wav u vremenskom domenu 

 [x,Fs] = audioread('dz1_signali\chopin.wav');
 [M,N] = size(x);
  dt = 1/Fs;
  t = dt*(0:M-1)';
  figure
  plot(t,x), title('crtanje chopin.wav u vremenskom domenu')
  
%--------------------------------------------------------------------------
%Kreiranje novog fajla-0,25s

[Y,FS,NBITS] = wavread('dz1_signali\chopin.wav'); 
    num_samp = round(FS); %broj odbiraka u jednoj sekundi
    wavwrite(Y(6.7*num_samp:6.95*num_samp), FS,NBITS,'novi_fajl');
 
        
%Crtanje novog signala u vremenskom domenu
 [Y1,Fs] = audioread('novi_fajl.wav');
  [M,N] = size(Y1);
  dt1 = 1/Fs;
  t1= dt1*(0:M-1)';
  figure
  plot(t1,Y1), title('Odsjeceni signal (0.25s) u vremenskom domenu'),xlabel('t[s]'), ylabel('Y1')
 %-------------------------------------------------------------
 %Crtanje spektra odsjeèenog signala primjenom dft_def
  
Y2=Y1';
tic
Xy1=dft_def(Y2); 
toc
ly = length(Xy1);
f = (0:ly/2-1)/ly*Fs;

figure

stem(f,Xy1(1:ly/2)), title(' Crtanje spektra odsjecenog signala primjenom dft-def'),xlabel('freq [Hz]'),ylabel('Xy1')
%--------------------------------------------------------------------------

 
 
 %Crtanje spektra novog audio fajla uz pomoc radix-2 algoritma
 tic;
 Xy1=fft_radix_2(Y1); 
 toc; 
ly = length(Xy1);
f = (0:ly/2-1)/ly*Fs;
  figure
 stem(f,Xy1(1:ly/2)), title('Crtanje spektra odsjecenog signala uz pomoc radix-2 algoritma'),xlabel('freq [Hz]'),ylabel('X')
  
%--------------------------------------------------------------------------




