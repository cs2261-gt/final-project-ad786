
#include "myLib.h"
#include "game.h"
#include "helicopter.h"
#include "soap.h"
#include "barriers.h"
#include "coronavirus.h"

OBJ_ATTR shadowOAM[128];
int sprite_tile_index[] = {384, 388, 392, 396, 400, 512, 516, 520, 524, 528};


int scoreRow;
int onesCol;
int tensCol;
int hundCol;
int onesIndex;
int tensIndex;
int hundIndex;


int scoreTimer;
int scoreTimer2;
int scoreTimer3;


void initGame() {
    endGame = 0;
    barrierIndex = 0;
    coronaTimer = 0;
    topBoundary = 17;
    bottomBoundary = 125;

    soapIndex = 6;
    soapCol = 217;


    onesCol = 66;
    scoreRow = 146;
    tensCol = 56;
    hundCol = 46;
    onesIndex = 0;
    tensIndex = 0;
    hundIndex = 0;


    scoreTimer = 0;
    scoreTimer2 = 0;
    scoreTimer3 = 0;

    initHelicopter();
    initBarriers();
    initSoap();
    initCoronavirus();
}



void drawGame() {
    drawHelicopter();
    drawBarriers();
    drawSoap();
    drawCoronavirus();
    drawScore();

}



void updateGame() {
    coronaTimer++;
    scoreTimer++;
    scoreTimer2++;
    scoreTimer3++;
    updateCoronavirus();
    updateBarriers();
    updateSoap();
    updateHelicopter();
    updateScore();
}

void updateScore() {
    if (scoreTimer == 70) {
        onesIndex = onesIndex % 10;
        onesIndex++;
        scoreTimer = 0;
    }
    if (scoreTimer2 == 700) {
        tensIndex = tensIndex % 10;
        tensIndex++;
        scoreTimer2 = 0;
    }
    if (scoreTimer3 == 7000) {
        hundIndex = hundIndex % 10;
        hundIndex++;
        scoreTimer3 = 0;
      
    }
}

void drawScore() {
    shadowOAM[40].attr0 = scoreRow | ATTR0_SQUARE;
    shadowOAM[40].attr1 = onesCol | ATTR1_MEDIUM;
    if (onesIndex == 10) {
        onesIndex = 0;
    }
    shadowOAM[40].attr2 = sprite_tile_index[onesIndex];

    shadowOAM[41].attr0 = scoreRow | ATTR0_SQUARE;
    shadowOAM[41].attr1 = tensCol | ATTR1_MEDIUM;
    if (tensIndex == 10) {
        tensIndex = 0;
    }
    shadowOAM[41].attr2 = sprite_tile_index[tensIndex];

    shadowOAM[42].attr0 = scoreRow | ATTR0_SQUARE;
    shadowOAM[42].attr1 = hundCol | ATTR1_MEDIUM;
    if (hundIndex == 10) {
        hundIndex = 0;
        tensIndex = 0;
        onesIndex = 0;
    }
    shadowOAM[42].attr2 = sprite_tile_index[hundIndex];

}


void drawHelicopter() {
    shadowOAM[10].attr0 = SHIFTDOWN(helicopter.row) | ATTR0_SQUARE;
    shadowOAM[10].attr1 = helicopter.col | ATTR1_MEDIUM;
    shadowOAM[10].attr2 = ATTR2_TILEID(0, 0);

}



void drawBarriers() {
    for (int i = 0; i < BARRIERCOUNT; i++) {
        if (barriers[i].active) {
            shadowOAM[barriers[i].index].attr0 = barriers[i].row | ATTR0_SQUARE;
            shadowOAM[barriers[i].index].attr1 = barriers[i].col | ATTR1_MEDIUM;
            shadowOAM[barriers[i].index].attr2 = ATTR2_TILEID(0, 4);
        } else {
            shadowOAM[barriers[i].index].attr0 = ATTR0_HIDE;
        }
    }
}

void drawCoronavirus() {
    for (int i = 0; i < CORONAVIRUSCOUNT; i++) {
        if (coronavirus[i].active) {
            shadowOAM[coronavirus[i].index + 25].attr0 = (ROWMASK & coronavirus[i].row) | ATTR0_SQUARE;
            shadowOAM[coronavirus[i].index + 25].attr1 = (COLMASK & coronavirus[i].col) | ATTR1_MEDIUM;
            shadowOAM[coronavirus[i].index + 25].attr2 = ATTR2_TILEID(4, 0);
        } else {
            shadowOAM[coronavirus[i].index + 25].attr0 = ATTR0_HIDE;
        }
    }
}

void drawSoap() {
    for (int i = 0; i < SOAPCOUNT; i++) {
        if (soap[i].active) {
            shadowOAM[soap[i].index + 15].attr0 = soap[i].row | ATTR0_SQUARE;
            shadowOAM[soap[i].index + 15].attr1 = soap[i].col | ATTR1_MEDIUM;
            shadowOAM[soap[i].index + 15].attr2 = ATTR2_TILEID(0, 8);
        } else {
            shadowOAM[soap[i].index + 15].attr0 = ATTR0_HIDE;
        }
    }

    shadowOAM[50].attr0 = scoreRow | ATTR0_SQUARE;
    shadowOAM[50].attr1 = soapCol | ATTR1_MEDIUM;
    if (soapIndex < 0) {
        soapIndex = 0;
    }
    shadowOAM[50].attr2 = sprite_tile_index[soapIndex];
}


