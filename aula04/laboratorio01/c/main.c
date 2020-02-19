#include <stdio.h>
#include <pthread.h>
#include <string.h>

int i = 0;                // índice do array
char array[30];           // array de caracteres
int flags[3] = {0, 1, 1}; // flags de sincronização
struct contexto           // estrutura contexto para as três linhas de execução
{
  int flag; // qual a flag da thread
  int next; // qual a flag seguinte a thread deve baixar
  char to_write; // qual letra escrever
  int max; // índice máximo do cursor
};

void *trabalho(void *params) // corpo de thread
{
  struct contexto *ctx = params;
  printf("Thread %d started\n", ctx->flag);
  while (i <= ctx->max) // laço de preenchimento colaborativo do array
  {
    // laço busy-wait
    while (flags[ctx->flag])
    {
      // noop
    }

    printf("Thread %d to write [%c] on %d\n", ctx->flag, ctx->to_write, i);
    // escrever no array
    array[i++] = ctx->to_write;
    // subir a própria flag
    flags[ctx->flag] = 1;
    // descer a flag da thread seguinte
    flags[ctx->next] = 0;
  }
  printf("Thread %d exiting\n", ctx->flag);
  return NULL;
}

void print_array()
{
  int i = -1;
  while (++i < 30)
    printf("%c,", array[i]);
  printf("\n");
}

int main(int argc, char **argv) // ponto de entrada da aplicação
{
  memset(array, '?', 30 * sizeof(char)); // zerando o array

  print_array();

  pthread_t thread_a, thread_b, thread_c;

  // a correta configuração do contexto é importante
  struct contexto a, b, c;

  a.flag = 0;
  b.flag = 1;
  c.flag = 2;

  a.next = 1;
  b.next = 2;
  c.next = 0;

  a.max = 27;
  b.max = 28;
  c.max = 29;

  a.to_write = 'a';
  b.to_write = 'b';
  c.to_write = 'c';

  // começando tudo
  pthread_create(&thread_a, NULL, trabalho, &a);
  pthread_create(&thread_b, NULL, trabalho, &b);
  pthread_create(&thread_c, NULL, trabalho, &c);

  pthread_join(thread_a, NULL);
  pthread_join(thread_b, NULL);
  pthread_join(thread_c, NULL);

  printf("Resultado:\n");
  print_array();
  return 0;
}