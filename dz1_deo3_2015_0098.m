%---------------------------------------------------------------------------------
%DRUGA TAÈKA:

load('dz1_signali\impulse_response.mat') ;
impuls=impulse_response;
[x,Fs]=audioread('dz1_signali\pticice_avion.wav'); 
%zvuk=audioplayer(x,Fs);
%zvuk.play
Nh=length(impuls); %223
N=length(x); %441000
L=1000 %recimo 

x1=block_convolution(x,impuls,L);
M=length(x1);

n=0:1:length(x1)-1;



%TREÆA TAÈKA---------------------------------------------------------------
%Spektogram ulaznog signala

nfft = 4096; 
window_width = nfft;
overlap_num = 3/4*window_width;

ws = hamming(window_width);

%racunanje spektrograma
[B,frequencies,times] = spectrogram(x, ws, overlap_num, nfft, Fs);
B_dB = 20*log10(abs(B)); %u dB

% prikaz spektrograma
subplot (211)
imagesc(times, frequencies(1:end/2), B_dB(1:end/2,:));
axis('xy');
xlabel('vreme [s]');
ylabel('ucestanost [Hz]');
title(['Spektrogram za T = ' num2str(1000*window_width/Fs) ' ms-ulazni signal']);


%-----------------------
%ISFILTRIRANI SIGNAL

%racunanje spektrograma
[B,frequencies,times] = spectrogram(x1, ws, overlap_num, nfft, Fs);
B_dB = 20*log10(abs(B)); %u dB

% prikaz spektrograma
subplot (212)
imagesc(times, frequencies(1:end/2), B_dB(1:end/2,:));
axis('xy');
xlabel('vreme [s]');
ylabel('ucestanost [Hz]');
title(['Spektrogram za T = ' num2str(1000*window_width/Fs) ' ms-Isfiltrirani signal']);
%--------------------------------------
%Crtanje impulsnog odziva:
figure
plot(impuls), xlabel('t[s]'),ylabel('h(t)'), title('Impulsni odziv')
%--------------------------------------------------------------------------

%ÈETVRTA STAVKA:

audiowrite('pticice.wav',x1,Fs); %OTKOMENTARISATI!!!!
y1=10000*x1;
audiowrite( 'pojacanePticice.wav',y1,Fs); %OTKOMENTARISATII!!!






