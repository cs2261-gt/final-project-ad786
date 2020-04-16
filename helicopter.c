#include "myLib.h"
#include "game.h"
#include "helicopter.h"
#include "soap.h"
#include "barriers.h"
#include "coronavirus.h"

HELICOPTER helicopter;
int topBoundary;
int bottomBoundary;
int endGame;


void updateHelicopter() {
    //Implementing Gravity
    if (SHIFTDOWN(helicopter.row + helicopter.rdel) < bottomBoundary) {
        helicopter.row += helicopter.rdel;
        if (SHIFTDOWN(helicopter.row) < topBoundary) {
            helicopter.row = SHIFTUP(topBoundary);
            helicopter.rdel = 0;
        }
    } else {
        helicopter.rdel = 0;
    }

    if (BUTTON_HELD(BUTTON_UP)) {
        helicopter.rdel -= JUMPPOWER;
    }
    
    helicopter.rdel += GRAVITY;

    if (BUTTON_PRESSED(BUTTON_A) && soapIndex > 0) {
        fireSoap();
        soapIndex--;
    }


    //Collision between soap and coronavirus
    for (int i = 0; i < CORONAVIRUSCOUNT; i++) {
        for (int j = 0; j < SOAPCOUNT; j++) {
            if (coronavirus[i].active && soap[j].active && collision(soap[j].col, soap[j].row, soap[j].width, soap[j].height, 
                        coronavirus[i].col, coronavirus[i].row, coronavirus[i].width, coronavirus[i].height)) {
                
                soap[j].active = 0;
                coronavirus[i].active = 0;
            }
        }
    }

    //Collision between helicopter and coronavirus
    for (int c = 0; c < CORONAVIRUSCOUNT; c++) {
        if (coronavirus[c].active && collision(helicopter.col, SHIFTDOWN(helicopter.row), helicopter.width, helicopter.height, 
                coronavirus[c].col, coronavirus[c].row, coronavirus[c].width, coronavirus[c].height)) {

                    
                    endGame = 1;
                    

        }
    }
    //Collision between helicopter and barrier
    for (int b = 0; b < BARRIERCOUNT; b++) {
        if (barriers[b].active && collision(helicopter.col, SHIFTDOWN(helicopter.row), helicopter.width, helicopter.height, 
                barriers[b].col, barriers[b].row, barriers[b].width, barriers[b].height)) {
                    
                    
                    endGame = 1;

        }
    }
}


void initHelicopter() {
    helicopter.col = 12;
    helicopter.row = SHIFTUP(60);
    helicopter.height = 19;
    helicopter.width = 30;
    helicopter.rdel = 1;
}