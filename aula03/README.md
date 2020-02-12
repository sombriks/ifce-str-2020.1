# sincronização de envio de mensagens

- envio de mensagens podem ser síncronas ou não
- recepção de mensagens é sempre síncrona

## execução com intervalo fixo de tempo

- interrupção timer_0
  - interrompe o curso principal de execução
  - configurar timer para ajustar o tempo desejado

## execução com eventos esporádicos

- variação de sensor
- sinal de linha

## tripla CPD

- C -> tempo de computação/execução
- P -> período/intervalo fixo de tempo
- D -> deadline/prazo limite ou prazo encerramento

### processos de tempo real respeitam a regra da tripla CPD

C <= D <= P

- Montar uma linha do tempo e distribuir marcações do D (deadline)
- C+D deve caber dentro do delay

### CPD com eventos esporádicos

- fazer análise da execução por um longo tempo para descobrir o menor intervalo
  de ocorrência do evento

## execução concorrente

- sincronização de processos
- comunicação interprocessos

## forma de interação dessas execuções

- independentes -> threads não se comunicam
- cooperativas -> threads colaboram
- concorrentes -> threads buscam recurso finito comum


## representação de processos

- fork/join
- cobegin (occam)
  - concurrent begin

## exercício 01

- usar 3 threads pra preencher um vetor de 10 posições
- a thread 1 escreve 1, a 2 escreve 2 e a 3 escreve 3
- de modo algum duas threads devem escrever no vetor ao mesmo tempo
- usar _busy-wait-loop-flag_ pra sincronizar

- para a próxima aula

