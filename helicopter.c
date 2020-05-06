#include "myLib.h"
#include "game.h"
#include "helicopter.h"
#include "soap.h"
#include "barriers.h"
#include "coronavirus.h"
#include "shoot.h"
#include "sound.h"
#include "loseSong.h"
//Global Variables
HELICOPTER helicopter;
int topBoundary;
int bottomBoundary;
int endGame;
int end;

//updating movement of helicopter w gravity and collisions
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

    if (BUTTON_PRESSED(BUTTON_A) && soapIndex > 0 && !cheat) {
        playSoundB(shoot, SHOOTLEN, 0);
        fireSoap();
        soapIndex--;
    }
    if (BUTTON_PRESSED(BUTTON_A) && cheat) {
        playSoundB(shoot, SHOOTLEN, 0);
        fireSoap();
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

                    
                    end = 1;
                    helicopter.rdel = 0;
                    stopSound();
                    playSoundA(loseSong, LOSESONGLEN, 0);
                    

        }
    }
    //Collision between helicopter and barrier
    for (int b = 0; b < BARRIERCOUNT; b++) {
        if (barriers[b].active && collision(helicopter.col, SHIFTDOWN(helicopter.row), helicopter.width, helicopter.height, 
                barriers[b].col, barriers[b].row, barriers[b].width, barriers[b].height)) {
                    
                    
                    end = 1;
                    helicopter.rdel = 0;
                    stopSound();
                    playSoundA(loseSong, LOSESONGLEN, 0);


        }
    }
}
//helicopter dropping after colliding
void endScene() {
    helicopter.row += helicopter.rdel;
    helicopter.rdel += ENDGRAVITY;


    if (SHIFTDOWN(helicopter.row + helicopter.rdel) > 145) {
        endGame = 1;
    }

}

//initializing helicopter
void initHelicopter() {
    helicopter.col = 12;
    helicopter.row = SHIFTUP(60);
    helicopter.height = 19;
    helicopter.width = 30;
    helicopter.rdel = 1;
    helicopter.tileCol = 0;
}