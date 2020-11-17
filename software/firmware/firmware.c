//#include "stdlib.h"
#include "system.h"
#include "periphs.h"
#include "iob-uart.h"

int main()
{
int i=0; // iterador
int value= 0; //valor random 
int max_value= 0; // guarda o valor max

  //init uart 
  uart_init(UART_BASE,FREQ/BAUD); 
    
    for (i = 0; i <= 10; ++i) {
        value = rand();
	uart_printf("Valor: %d\n", value);
	if (value > max_value){
	   max_value = value;
			      }
	uart_printf("Valor max: %d\n", max_value);
}

  //char *a = malloc(10);
  //free(a);
}
