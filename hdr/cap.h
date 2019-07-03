#ifndef __FI2CAP_H__
#define __FI2CAP_H__

#include "protopia.h"
#include "tetraring.h"
//#include "ckai.h"

/* define */
#define FI2CAP_IFNAME "eth0"

/* function */
int capture (void (*cb)(uint8_t *, size_t));
void cap_chkpkt (uint8_t *, size_t);

#endif
