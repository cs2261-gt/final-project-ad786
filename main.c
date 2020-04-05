#include "myLib.h"
#include "start.h"



int state;
enum {START, INSTRUCTIONS, GAME, PAUSE, LOSE};

unsigned short buttons;
unsigned short oldButtons;

int main() {
    initialize();
    while (1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        switch(state) {
            case (START):
                start();
                break;
            case (INSTRUCTIONS):
                instructions();
                break;
            case (GAME):
                game();
                break;
            case (PAUSE):
                pause();
                break;
            case (LOSE):
                lose();
                break;
        }
    }
}

void initialize() {
    REG_BG0CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    goToStart();
}

void start() {

}
void instructions() {

}
void game() {

}
void pause() {

}
void lose() {

}


void goToStart() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    DMANow(3, startPal, PALETTE, startPalLen / 2);
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2);
    DMANow(3, startMap, &SCREENBLOCK[28], startMapLen / 2);

    state = START;
}

void goToInstructions() {

}

void goToGame() {

}

void goToPause() {

}

void goToLose() {

}