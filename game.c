#include "myLib.h"
#include "game.h"


OBJ_ATTR shadowOAM[128];
HELICOPTER helicopter;
SOAP soap[SOAPCOUNT];
BARRIERS barriers[BARRIERCOUNT];
CORONAVIRUS coronavirus[CORONAVIRUSCOUNT];
//int barrierTimer;
int barrierIndex;
int coronaIndex;
int coronaTimer;



void initGame() {
    barrierIndex = 0;
    coronaTimer = 0;

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

}
void updateGame() {
    coronaTimer++;
    updateCoronavirus();
    updateBarriers();
    updateSoap();
    updateHelicopter();

    
    
}
void updateHelicopter() {
    if (BUTTON_HELD(BUTTON_UP) && helicopter.row > 18) {
        helicopter.row--;
    }
    if (BUTTON_HELD(BUTTON_DOWN) && helicopter.row < 125) {
        helicopter.row++;
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        fireSoap();
    }

    for (int i = 0; i < CORONAVIRUSCOUNT; i++) {
        for (int j = 0; j < SOAPCOUNT; j++) {
            if (coronavirus[i].active && soap[j].active && collision(soap[j].col, soap[j].row, soap[j].width, soap[j].height, 
                        coronavirus[i].col, coronavirus[i].row, coronavirus[i].width, coronavirus[i].height)) {
                
                soap[j].active = 0;
                coronavirus[i].active = 0;
            }
        }
    }
}
void drawHelicopter() {
    shadowOAM[10].attr0 = helicopter.row | ATTR0_SQUARE;
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

void updateBarriers() {
    for (int i = 0; i < BARRIERCOUNT; i++) {
        if (barriers[i].active) {
            barriers[i].col -= barriers[i].cdel;

            if (barriers[i].col == 110) {
                barrierIndex = (i + 1) % 3;
                barriers[barrierIndex].active = 1;
                barriers[barrierIndex].col = 200;
                barriers[barrierIndex].row = (rand() % 100) + 16;
            } 
            if (barriers[i].col < 5) {
                barriers[i].active = 0;
            }
        
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

void updateCoronavirus() {
    for (int i = 0; i < CORONAVIRUSCOUNT; i++) {
        if (coronavirus[i].active) {
            coronavirus[i].col -= coronavirus[i].cdel;
            coronavirus[i].row += coronavirus[i].rdel; // always add the rdel

            // reflect the rdel if coronavirus reaches the green bars
            if (coronavirus[i].row < 16 || coronavirus[i].row > 120) {
                coronavirus[i].rdel *= -1;
            }

            if (coronavirus[i].col < 5) {
                coronavirus[i].active = 0;
            }
        } 
        if (!coronavirus[i].active && coronaTimer == 100) {
            coronavirus[i].active = 1;

            // logic to ensure the spawned coronaviruses never collide with a given barrier
            int var0 = i;
            int var1 = (i + 1) % 3;
            int var2 = (i + 2) % 3;
            int newCol = 0;
            // making sure col > 110 coronavirus doesnt spawn next to helicopter
            if (barriers[var0].active && barriers[var0].col > 110) { 
                newCol = barriers[var0].col + coronavirus[i].width;

            } else if (barriers[var1].active && barriers[var1].col > 110) {
                newCol = barriers[var1].col + coronavirus[i].width;

            } else if (barriers[var2].active && barriers[var2].col > 110) {
                newCol = barriers[var2].col + coronavirus[i].width;
            }

            coronavirus[i].col = newCol; 
            coronavirus[i].row = (rand() % 80) + 16;
            coronaTimer = 0;
        }
    }
}


void updateSoap() {
    for (int i = 0; i < SOAPCOUNT; i++) {
        if (soap[i].active) {
            if (soap[i].col < 205) {
                soap[i].col += soap[i].cdel;
            } else {
                soap[i].active = 0;
            }
        }
    }
}

void fireSoap() {
    for (int i = 0; i < SOAPCOUNT; i++) {
        if (!soap[i].active) {
            soap[i].row = helicopter.row + 2;
            soap[i].col = helicopter.col + helicopter.width;

            soap[i].active = 1;
            break;
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
}

void initHelicopter() {
    helicopter.col = 12;
    helicopter.row = 80;
    helicopter.height = 19;
    helicopter.width = 30;
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

void initSoap() {
    for (int i = 0; i < SOAPCOUNT; i++) {
        soap[i].col = 0;
        soap[i].width = 26;
        soap[i].height = 13;
        soap[i].cdel = 2;
        soap[i].active = 0;
        soap[i].row = 0;
        soap[i].index = i;
    }
}

void initCoronavirus() {
    for (int i = 0; i < CORONAVIRUSCOUNT; i++) {
        coronavirus[i].col = 220;
        coronavirus[i].row = (rand() % 80) + 16;
        coronavirus[i].active = 0;
        coronavirus[i].cdel = 1;
        coronavirus[i].height = 25;
        coronavirus[i].width = 25;
        coronavirus[i].index = i;
        coronavirus[i].rdel = 1;
    }
    coronavirus[0].active = 1;
}
