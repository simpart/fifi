#include "cap.h"

uint8_t g_capbuf[128];


int capture (void (*cb)(uint8_t *, size_t)) {
    cb = cb;
    int ret  = 0;
    int sock = 0;
    
    /* init interface */
    sock = ttr_nw_init(FI2CAP_IFNAME, &g_capbuf[0], sizeof(g_capbuf));
    if (TTR_NG == sock) {
        return TTR_NG;
    }
    
    /* start capture */
    ret = ttr_nw_rcvloop(sock, cap_chkpkt);
    if (TTR_NG == ret) {
        return TTR_NG;
    }
    
    return TTR_OK;
}

void cap_chkpkt (uint8_t *pkt, size_t siz) {
    siz = siz;
    pkt = pkt;
    printf("packet\n");
}
