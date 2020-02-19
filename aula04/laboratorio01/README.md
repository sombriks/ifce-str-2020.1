# Laboratório 01

Crie um programa que dispare três threads que colaborem para preencher um vetor
de char de 30 posições.

A primeira thread preenche uma posição do vetor com valor 'A', libera a segunda
thread e entra em espera. A segunda thread começa suspensa e quando liberada
escreve no vetor o valor 'B', libera a terceira e e entra em espera. Raciocínio
similar para a terceira thread.

Usar o *busy-wait loop* para a sincronização das threads