#include "myLib.h"
#include "game.h"


OBJ_ATTR shadowOAM[128];
HELICOPTER helicopter;
SOAP soap[SOAPCOUNT];
BARRIERS barriers[BARRIERCOUNT];
CORONAVIRUS coronavirus;
int barrierTimer;
int barrierIndex;
int hOff;
int screenBlock;
int playerHOff;

void initGame() {
    hOff = 0;
    screenBlock = 28;
    playerHOff = 0;
    initHelicopter();
    initBarriers();
}

void drawGame() {
    drawHelicopter();
    drawBarriers();

}
void updateGame() {
    // if (hOff > 256) {
    //     screenBlock++;
    //     hOff -= 256;
    //     REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_WIDE | BG_4BPP;
    // }

    // if (playerHOff > 512) {
    //     playerHOff -= 512;
    // }

    updateHelicopter();
    updateBarriers();
    barrierTimer++;

    REG_BG0HOFF = hOff;

}
void updateHelicopter() {
    if (BUTTON_HELD(BUTTON_UP)) {
        helicopter.row--;
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        helicopter.row++;
    }
    // if (screenBlock < 31 && hOff < (1024 - SCREENWIDTH - 1)) {
    //     hOff++;
    //     playerHOff++;
    // }
}
void drawHelicopter() {
    shadowOAM[10].attr0 = helicopter.row | ATTR0_SQUARE;
    shadowOAM[10].attr1 = helicopter.col | ATTR1_MEDIUM;
    shadowOAM[10].attr2 = ATTR2_TILEID(0, 0);
}

void drawBarriers() {
    for (int i = 0; i < BARRIERCOUNT; i++) {
        if (barriers[i].active) {
            shadowOAM[barriers[i].index].attr0 = barriers[barriers[i].index].row | ATTR0_SQUARE;
            shadowOAM[barriers[i].index].attr1 = barriers[barriers[i].index].col | ATTR1_MEDIUM;
            shadowOAM[barriers[i].index].attr2 = ATTR2_TILEID(0, 4);
        } else {
            shadowOAM[barriers[i].index].attr0 = ATTR0_HIDE;
        }
    }
}
void updateBarriers() {
    for (int i = 0; i < BARRIERCOUNT; i++) {
        if (barriers[i].active) {
            barriers[i].col--;
        }
        if (barriers[i].col < 50) {
            barriers[i].active = 0;
            barrierIndex++;
            // barriers[i].col = 200;
            // barriers[i].row = (rand() % 105) + 20;
        }
        //barriers[barrierIndex].active = 1;
    }


    // if (barriers[barrierIndex].col < 1) {
    //     barriers[barrierIndex].active = 0;
    //     barrierIndex++;
    //     barriers[barrierIndex].active = 1;
    // }
}

void initHelicopter() {
    helicopter.col = 30;
    helicopter.row = 80;
    helicopter.height = 32;
    helicopter.width = 32;
}

void initBarriers() {
    for (int i = 0; i < BARRIERCOUNT; i++) {
        barriers[i].col = 200;
        barriers[i].row = (rand() % 105) + 20;
        barriers[i].height = 32;
        barriers[i].width = 32;
        barriers[i].active = 0;
        barriers[i].tileCol = 0;
        barriers[i].index = i;
    }
    barriers[0].active = 1;
}
