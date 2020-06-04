% VA main function
clear all
clf
M=5;  % number of input bits, change here to define 
dB=-1000 % SNR (-1000 if noiseless)

k=1; n=2; K=3;  % convolution encoder parameters
% Draw encoder
subplot(211)
CodeFig;  % plot the code block diagram and trellis diagram

% message bit squence
mt=(sign(rand(1,M)-0.5)+1)/2; % generate random bit sequence
mt=[1 0 1 1 0];  % or, use this fixed sequence as example
%mt=[1 0 0 1 0]; % or, hange it to define your own input message

% encoder illustration
subplot(212), hold on
axis([0 (M+2)*10+20 0 50])
Encoder;  % call the encoder sub-routine 

% you can change y (with the same length as out)
% to your required received signal
y=out; % without noise
%y=[1 1 0 0 0 0 1 0 1 1 0 0 0 0]; % an example with receiving errors

noise=randn(1,length(out)); % we may add noise as well
if dB~=-1000
    y=out+noise*10^(-dB/20)*norm(out-mean(out))/norm(noise);
end

% decoder illustration
Decoder;   % call the decoder sub-routine

disp('end')

