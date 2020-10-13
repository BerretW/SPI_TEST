#include <stdlib.h>
#include <stdio.h>

#include "acia.h"
//#include "bank.h"
//#include "wait.h"
//
//#include "utils.h"
//#include "GameDuino.h"

#include "copyshort.h"
#include "spi.h"
unsigned int i = 0;
char c;
void main(void) {
while(1){
  c = acia_getc();

  if (c != 0x8) {
    ++i;
  } else {
    if (i > 0) {
    --i;
    }
  }
  spi_write_to(0x8000 + i, c);
  acia_putc(c);

}

}
