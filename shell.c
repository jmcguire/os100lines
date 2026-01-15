#include "user.h"

void main(void) {
  *((volatile int *) 0x00200000) = 0x1234;
  for (;;);
}

