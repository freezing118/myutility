int main(void)
{
    unsigned int low = 10000, high = 30000;
    int mask[50];
    unsigned char done[50];
    unsigned int key[50];
    char i, j = 0, k;

    memset(mask, 0xFFFFFFFF, sizeof(mask));
    memset(done, 0, sizeof(done));

    for (i = 0; ; i++) {
        if (low & (0x1 << i)) {
            mask[j] <<= i;
            if ((low | ~mask[j]) > high) {
                /* need to split mask */
                mask[j] = 0xFFFFFFFF;
                printf("i: %d, to split\n", i);
                break;
            }
            else if ((low | ~mask[j]) == high) {
                /* all done */
                done[j] = 1;
                key[j] = low;
                j++;
                goto done;
            }
            else {
                done[j] = 1;
                key[j] = low;
                j++;
                low += 0x1 << i;
                printf("new loww: %u\n", low);
            }
        }
    }

    for (; i >= 0; i--) {
        mask[j] <<= i;
        /* split mask */
        if((low | ~mask[j]) > high) {
            mask[j] = 0xFFFFFFFF;
            continue;
        }

        if ((low | ~mask[j]) == high) {
            /* all done */
            done[j] = 1;
            key[j] = low;
        }
        else {
            done[j] = 1;
            key[j] = low;
            low += 0x1 << i;
            j++;
        }
    }

done:
    for (k = 0; k < 50; k++) {
        if (done[k] == 1)
            printf("mask: 0x%08x, key: 0x%08x\n",
              mask[k], key[k]);
    }

    return 0;
}

