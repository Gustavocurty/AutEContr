% Limpa os comandos do workspace
clc
clear all

% Declaramos os paramêtros do problema
Hmax = 0.45           % Altura do tanque(m)
Qmax = 0.015          % Fluxo máximo de entrada (m3/s)
Hmed = Hmax*0.7       % Altura média utilizado para linearizar o modelo
Qmed = Qmax*0.7       % Fluxo médio para linearizar o modelo

L1 = 1                % Lado 1 do tanmque(m)
L2 = 0.85             % Lado 2 do tanmque(m)
Area = L1*L2          % Area transversal do tanque(m2)
C = Area              % Capacidade do tanque

R = Hmed/Qmed         % Restrição (s/m2)

f_red = 50            % Frequencia da grade
Gvdf = Qmax/f_red     % Bloquear fluxo VDF + Bomba
Gsen = 1   

% Desenvolvendo a função de transferência
num = [R]             % Numerador da função de transferência
den = [R*C 1];        % Denominador da função de transferência

Gp = tf(num,den)      % Função de transferência% Bloquear sensor

% Grafico
step(Qmed*Gp)         % Reduz a escala a 60% do fluxo máximo


step(Gp)              % A função step aplica por padrão uma escala unitária
                      % que para nosso porblema seria de 1 m3/s
