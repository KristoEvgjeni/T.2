clear;                             % clear all variables
clf;                               % clear all figures

N = 50;                            % Number of terms
T=40;
wo = 2*pi/T;                           % fundamental frequency (rad/s)
c0 = 1;                            % dc bias
t = -7:0.01:7;                     % declare time values de la 1 la 14

figure(1)                          % put first two plots on figure 1

% Compute yce, the Fourier Series in complex exponential form

yce = c0*ones(size(t));            % initialize yce to c0

for n = -N:-1,                    % loop over series index n (odd)
  cn = j/(2*pi*n);                % Fourier Series Coefficient
  yce = yce + real(cn*exp(j*n*wo*t)); % Fourier Series computation
end

for n =1:N,
    cn = j/(2*pi*n);
    yce = yce+real(cn*exp(j*n*wo*t));
end;

plot([-7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 ],...    % plot original y(t)
     [ 1  0  1  0  1  0  1 0 1 0 1 0 1 0 1], ':');
hold;
plot(t,yce);			    % plot truncated exponential FS
xlabel('t (seconds)'); ylabel('y(t)');
ttle = [' Truncated Exponential Fourier Series with N = ',...
         num2str(N)];
title(ttle);
hold;




% Draw the amplitude spectrum from exponential Fourier Series

figure(2)                          % put next plots on figure 2

stem(0,c0);                        % plot c0 at nwo = 0

hold;
for n = -N:2:N,                    % loop over series index n
  cn = 2/(j*n*wo);                 % Fourier Series Coefficient
  stem(n*wo,abs(cn))               % plot |cn| vs nwo
end
for n = -N+1:2:N-1,                % loop over even series index n 
  cn = 0;                          % Fourier Series Coefficient
  stem(n*wo,abs(cn));              % plot |cn| vs nwo
end

xlabel('w (rad/s)')
ylabel('|cn|')
ttle = ['EE341.01: Amplitude Spectrum with N = ',num2str(N)];
title(ttle); 
grid;
hold;

