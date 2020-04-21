#include "myLib.h"
#include "game.h"
#include "soap.h"
#include "helicopter.h"

//Global Variables
SOAP soap[SOAPCOUNT];
int soapIndex;
int soapCol;
int cheat;

//Creating the cheat after L and R are pressed
void cheatSoap() {
    soapIndex = 10;
    cheat = 1;
}
//updating the soap to move across screen
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
//Fire soap method to fire upon button pressed
void fireSoap() {
    for (int i = 0; i < SOAPCOUNT; i++) {
        if (!soap[i].active) {
            soap[i].row = SHIFTDOWN(helicopter.row) + 2;
            soap[i].col = helicopter.col + helicopter.width;

            soap[i].active = 1;
            break;
        }
    }
}

//initialize pool of soap
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