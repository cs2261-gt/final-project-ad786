#include "myLib.h"
#include "game.h"
#include "soap.h"
#include "helicopter.h"


SOAP soap[SOAPCOUNT];
int soapIndex;
int soapCol;
int scoreRow;


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
            soap[i].row = SHIFTDOWN(helicopter.row) + 2;
            soap[i].col = helicopter.col + helicopter.width;

            soap[i].active = 1;
            break;
        }
    }
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