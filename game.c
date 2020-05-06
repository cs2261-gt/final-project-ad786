
#include "myLib.h"
#include "game.h"
#include "helicopter.h"
#include "soap.h"
#include "barriers.h"
#include "coronavirus.h"
//Global Variables
OBJ_ATTR shadowOAM[128];
int sprite_tile_index[] = {384, 388, 392, 396, 400, 512, 516, 520, 524, 528, 260};

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
int helicopterTimer;
int barrierTimer;
int coronavirusTimer;

//Init game
void initGame() {
    endGame = 0;
    end = 0;
    barrierIndex = 0;
    coronaTimer = 0;
    topBoundary = 17;
    bottomBoundary = 125;

    soapIndex = 8;
    soapCol = 217;

    onesCol = 66;
    scoreRow = 146;
    tensCol = 57;
    hundCol = 48;
    onesIndex = 0;
    tensIndex = 0;
    hundIndex = 0;

    scoreTimer = 0;
    scoreTimer2 = 0;
    scoreTimer3 = 0;
    helicopterTimer = 0;
    barrierTimer = 0;
    coronavirusTimer = 0;

    cheat = 0;

    initHelicopter();
    initBarriers();
    initSoap();
    initCoronavirus();
}

//Draw helicopter, barriers, soap, virus and score
void drawGame() {
    drawHelicopter();
    drawBarriers();
    drawSoap();
    drawCoronavirus();
    drawScore();

}
//Update all sprites
void updateGame() {
    coronaTimer++;
    scoreTimer++;
    scoreTimer2++;
    scoreTimer3++;
    helicopterTimer++;
    barrierTimer++;
    coronavirusTimer++;
    
    updateCoronavirus();
    updateBarriers();
    updateSoap();
    updateHelicopter();
    updateScore();
}
//updating the score
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
//drawing the score in bottom left
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
//Function to display score on lose screen
void displayScore() {
    onesIndex = onesIndex % 10;
    tensIndex = tensIndex % 10;
    hundIndex = hundIndex % 10;

    shadowOAM[40].attr0 = 68 | ATTR0_SQUARE;
    shadowOAM[40].attr1 = 166 | ATTR1_MEDIUM;
    shadowOAM[40].attr2 = sprite_tile_index[onesIndex];

    shadowOAM[41].attr0 = 68 | ATTR0_SQUARE;
    shadowOAM[41].attr1 = 157 | ATTR1_MEDIUM;
    shadowOAM[41].attr2 = sprite_tile_index[tensIndex];

    shadowOAM[42].attr0 = 68 | ATTR0_SQUARE;
    shadowOAM[42].attr1 = 148 | ATTR1_MEDIUM;
    shadowOAM[42].attr2 = sprite_tile_index[hundIndex];
}

//Drawing the helicopter sprite and animation
void drawHelicopter() {
    shadowOAM[10].attr0 = SHIFTDOWN(helicopter.row) | ATTR0_SQUARE;
    shadowOAM[10].attr1 = helicopter.col | ATTR1_MEDIUM;
    shadowOAM[10].attr2 = ATTR2_TILEID(helicopter.tileCol, 20);

    if (helicopterTimer == 15) {
        helicopterTimer = 0;
        if (helicopter.tileCol < 8) {
            helicopter.tileCol = helicopter.tileCol + 4;
        } else {
            helicopter.tileCol = 0;
        }
    }
}
//Drawing the barriers and animation
void drawBarriers() {
    for (int i = 0; i < BARRIERCOUNT; i++) {
        if (barriers[i].active) {
            shadowOAM[barriers[i].index].attr0 = barriers[i].row | ATTR0_SQUARE;
            shadowOAM[barriers[i].index].attr1 = barriers[i].col | ATTR1_MEDIUM;
            shadowOAM[barriers[i].index].attr2 = ATTR2_TILEID(barriers[i].tileCol, 4);

        } else {
            shadowOAM[barriers[i].index].attr0 = ATTR0_HIDE;
        }
    }
    if (barrierTimer == 20) {
        barrierTimer = 0;
        for (int i = 0; i < BARRIERCOUNT; i++) {
            if (barriers[i].tileCol < 16) {
                barriers[i].tileCol = barriers[i].tileCol + 4;
            } else {
                barriers[i].tileCol = 0;
            }
        }
    }
}
//Drawing the coronavirus and animation
void drawCoronavirus() {
    for (int i = 0; i < CORONAVIRUSCOUNT; i++) {
        if (coronavirus[i].active) {
            shadowOAM[coronavirus[i].index + 25].attr0 = (ROWMASK & coronavirus[i].row) | ATTR0_SQUARE;
            shadowOAM[coronavirus[i].index + 25].attr1 = (COLMASK & coronavirus[i].col) | ATTR1_MEDIUM;
            shadowOAM[coronavirus[i].index + 25].attr2 = ATTR2_TILEID(coronavirus[i].tileCol, 0);
        } else {
            shadowOAM[coronavirus[i].index + 25].attr0 = ATTR0_HIDE;
        }
    }

    if (coronavirusTimer == 20) {
        coronavirusTimer = 0;
        for (int i = 0; i < CORONAVIRUSCOUNT; i++) {
            if (coronavirus[i].tileCol < 16) {
                coronavirus[i].tileCol = coronavirus[i].tileCol + 4;
            } else {
                coronavirus[i].tileCol = 4;
            }
        }
    }
}
//drawing the soap sprite and number for soaps left
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
//Drawing the sprites on pause screen
void drawPauseScreen() {
    //Helicopter
    shadowOAM[60].attr0 = 120 | ATTR0_SQUARE;
    shadowOAM[60].attr1 = 90 | ATTR1_MEDIUM;
    shadowOAM[60].attr2 = ATTR2_TILEID(0, 20);

    //chair
    shadowOAM[61].attr0 = 130 | ATTR0_SQUARE;
    shadowOAM[61].attr1 = 190 | ATTR1_MEDIUM;
    shadowOAM[61].attr2 = ATTR2_TILEID(8, 8);


    //person
    shadowOAM[62].attr0 = 120 | ATTR0_SQUARE;
    shadowOAM[62].attr1 = 165 | ATTR1_MEDIUM;
    shadowOAM[62].attr2 = ATTR2_TILEID(16, 8);

    //Tree
    shadowOAM[63].attr0 = 110 | ATTR0_SQUARE;
    shadowOAM[63].attr1 = 200 | ATTR1_MEDIUM;
    shadowOAM[63].attr2 = ATTR2_TILEID(12, 8);
}

