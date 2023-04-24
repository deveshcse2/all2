clc;
clear all;
close all;
bit_number=10^6;
data=randn(1, bit_number)>0.5;
bpsk_data=2*data - 1;
noise=1/sqrt(2)*(randn(1, bit_number)+1i*randn(1, bit_number));
mean(abs(noise.^2))
SNR=0:9;
snr_lin=10.^(SNR/10);
y=zeros(length(SNR), bit_number);
for i=1:length(SNR)
   y(i, :)=real(sqrt(snr_lin(i))*bpsk_data+noise);
end
err=zeros(length(SNR), bit_number);
Err=zeros(10, 2);
for i=1:length(SNR)
   for j=1:bit_number
       if y(i, j)>=0
           y(i, j)=1;
       else
           y(i, j)=0;
       end
   end
   err(i,:)=abs(y(i,:)-data);
   Err(i,:)=size(find(err(i,:)));
end
ber=zeros(length(SNR), 1);
for i=1:length(SNR)
   ber(i)=Err(i,2)/bit_number;
end
theoryBer=0.5*erfc(sqrt(snr_lin));
semilogy(SNR,ber,'b*-','linewidth',1);
grid on;
hold on;
semilogy(SNR,theoryBer,'r+-','linewidth',1);
grid on;
xlabel('Eb/NO');
ylabel('BER');
legend('Simulation', 'Theory');
toc;
