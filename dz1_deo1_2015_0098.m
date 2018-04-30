
%prva tacka----------------------------------------------------------------
f1=1000;
f2=1240;
f3=1300;
fs=11250;

Fo1=f1/fs;
Fo2=f2/fs;
Fo3=f3/fs;
N=1125;
n=0:N-1;

x1=5*cos(2*pi*Fo1*n);
x2=10*cos(2*pi*Fo2*n);
x3=10*cos(2*pi*Fo3*n);
x=x1+x2+x3;
X=fft(x);
Xi=imag(X);
Xr=real(X);
n1=0:(N/2-1); %da bi moglo da se crta do fs
n1=n1*10;
t=0:0.01:0.5;
td=n*1/fs;
xk=5*cos(2*pi*f1*t)+10*cos(2*pi*f2*t)+10*cos(2*pi*f3*t); 
figure
stem (n, x), title(' Signal nacrtan u N nacaka-bez plotovanja'),ylabel('x[n]')
figure
%jer je receno da je vremenska osa u sekundama
plot(td,x), title('Signal sa vremenskom osom u sekundama'), xlabel('t[s]'),ylabel('x')
figure
subplot (211), stem(n1,Xr(1:N/2)), title('Re(DFT(x[n]))'),xlabel('freq [Hz]'),ylabel('Xr')
subplot (212), stem(n1,Xi(1:N/2)), title('Im(DFT(x[n])'),xlabel('freq [Hz]'),ylabel('Xi')
figure
plot(t,xk), title ('Kontinualni signal'),xlabel('vreme [s]'), ylabel('xk')

%-------------------------------------------------------------------------
%Drugi dio (Signal koji se dobije kad se uzme svaki deveti odbirak).....
n9=0:9:N-1;
x11=5*cos(2*pi*Fo1*n9);
x22=10*cos(2*pi*Fo2*n9);
x33=10*cos(2*pi*Fo3*n9);
x9=x11+x22+x33;
X9=fft(x9);
Xr9=real(X9);
Xi9=imag(X9);

%lx = length(X9); 
%f = (0:lx/2-1)/lx*fs;
%%moze da se i koristi ova relacija da bi se dobile ose do fs/2


nx=0:9:(N/2-1);
nx=10*nx;
figure
subplot( 211) ,stem(nx,Xr9(1:length(nx))), title('Re(DFT(x9[n]))-svaki 9. odbirak'),xlabel('freq [Hz]'),ylabel('Xr9');
subplot(212), stem(nx, Xi9(1:length(nx))), title('Im(DFT(x9[n]))--svaki 9. odbirak'),xlabel('freq [Hz]'),ylabel('Xi9');
%-------------------------------------------------------------------------

%Treæa tacka
[x,Fs]=audioread('dz1_signali\chopin.wav'); 
a=audioplayer(x,Fs);
%a.play;

nfft = 4096; 
window_width = nfft;
overlap_num = 3/4*window_width;

ws = hamming(window_width);

%racunanje spektrograma
[B,frequencies,times] = spectrogram(x, ws, overlap_num, nfft, Fs);
B_dB = 20*log10(abs(B)); %u dB

% prikaz spektrograma
figure;
imagesc(times, frequencies(1:end/3), B_dB(1:end/3,:));
axis('xy');
xlabel('vreme [s]');
ylabel('ucestanost [Hz]');
title(['Spektrogram za T = ' num2str(1000*window_width/Fs) ' ms']);

%Na osnovu spektrograma se vidi da su najgušæe frekvencije do 2kHz.
%Testiranje granicne frekvencije odabiranja signala, a da se ne ošteti
%kvalitet zvuka.------------------------------------------------------

pomjeraj=10;
y=x(1:1*pomjeraj:end);

a=audioplayer(y,Fs/pomjeraj);
%a.play;


%ZAKLJUÈAK: Procjena preko spektrograma se manje-više poklapa sa testiranjem
%preko zvuènika. Kako je max uèestanost koju smatramo korisnom 2kHz, znaèi
%da je frekvencija odabiranja 4kHz. Puštanjem na zvuènike se zakljuèuje da
%signal skoro nije ošteæen.
%-------------------------------------------------------------------------

%Degradirani signal

 pomjeraj=30;
 y=x(1:1*pomjeraj:end);
 a=audioplayer(y,Fs/pomjeraj);
 %a.play;
nfft = 4096; 
window_width = nfft;
overlap_num = 3/4*window_width;
ws = hamming(window_width);

%racunanje spektrograma
[B,frequencies,times] = spectrogram(y, ws, overlap_num, nfft, Fs/pomjeraj);
B_dB = 20*log10(abs(B)); %u dB

% prikaz spektrograma
figure;
imagesc(times, frequencies(1:end), B_dB(1:end,:));
axis('xy');
xlabel('vreme [s]');
ylabel('ucestanost [Hz]');
title(['Spektrogram za T = ' num2str(1000*window_width/(Fs/pomjeraj)) ' ms']);
%---------------------------------------------------------------------------
 


