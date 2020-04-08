#include "myLib.h"
#include "start.h"
#include "gameBackground.h"
#include "instructions.h"
#include "pause.h"
#include "lose.h"
#include "spritesheet.h"
#include "spritesheetNumbers.h"



int state;
enum {START, INSTRUCTIONS, GAME, PAUSE, LOSE};

unsigned short buttons;
unsigned short oldButtons;

unsigned short hOff;
int seed;

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

    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    hideSprites();

    hOff = 0;
    goToStart();
}

void start() {
    seed++;
    REG_BG0HOFF = 0;
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        initGame();
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    }

}
void instructions() {
    REG_BG0HOFF = 0;

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }

}
void game() {
    updateGame();
    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    hOff++;
    REG_BG0HOFF = hOff;

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToLose();
    }

}
void pause() {
    REG_BG0HOFF = 0;

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
    
}
void lose() {
    REG_BG0HOFF = 0;

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }

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
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    DMANow(3, instructionsPal, PALETTE, instructionsPalLen / 2);
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2);
    DMANow(3, instructionsMap, &SCREENBLOCK[28], instructionsMapLen / 2);

    state = INSTRUCTIONS;

}

void goToGame() {
    DMANow(3, gameBackgroundPal, PALETTE, gameBackgroundPalLen / 2);
    DMANow(3, gameBackgroundTiles, &CHARBLOCK[0], gameBackgroundTilesLen / 2);
    DMANow(3, gameBackgroundMap, &SCREENBLOCK[28], gameBackgroundMapLen / 2);

    state = GAME;

}

void goToPause() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    DMANow(3, pausePal, PALETTE, pausePalLen / 2);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[28], pauseMapLen / 2);

    state = PAUSE;
}

void goToLose() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    DMANow(3, losePal, PALETTE, losePalLen / 2);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[28], loseMapLen / 2);

    state = LOSE;

}