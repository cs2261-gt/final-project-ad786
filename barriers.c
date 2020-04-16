#include "barriers.h"
#include "game.h"
#include "myLib.h"


BARRIERS barriers[BARRIERCOUNT];
int barrierIndex;



void updateBarriers() {
    for (int i = 0; i < BARRIERCOUNT; i++) {
        if (barriers[i].active) {
            barriers[i].col -= barriers[i].cdel;

            if (barriers[i].col == 90) {
                barrierIndex = (i + 1) % 3;
                barriers[barrierIndex].active = 1;
                barriers[barrierIndex].col = 200;
                barriers[barrierIndex].row = (rand() % 100) + 18;
            } 
            if (barriers[i].col < 5) {
                barriers[i].active = 0;
            }
        
        } 
    }
}

void initBarriers() {
    for (int i = 0; i < BARRIERCOUNT; i++) {
        barriers[i].col = 200;
        barriers[i].row = (rand() % 80) + 16;
        barriers[i].height = 25;
        barriers[i].width = 8;
        barriers[i].active = 0;
        barriers[i].tileCol = 0;
        barriers[i].index = i;
        barriers[i].cdel = 1;
    }
    barriers[0].active = 1;
}