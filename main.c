/* Finished So Far: All details/gameplay of the game, all barriers, virus, helicopter things are done
Needs to be Added: All backgrounds, Pause state needs paralax, Sound, Cheat - unlimited Soap, animations
Also want to add: pause when hitting something, and have copter fall downwards
Want to add: final score on the game over page
Small Bug: on the left side of screen, very small, you can see the virus lining

How to Play: after starting, press and hold up button to accelerate copter to go up, let go for gravity to push copter down
Survive as long as possible, can shoot soap with A to kill virus, but only have 6!

Questions for TA: 1. Any idea how to fix the small lining bug on the left side of screen when starting and throughout game?
2. I like the two viruses that come up together occasionally, which will act as "boss" barrier. Will Aaron count that as a bug?
*/

#include "myLib.h"
#include "game.h"
#include "start.h"
#include "gameBackground.h"
#include "instructions.h"
#include "pause.h"
#include "lose.h"
#include "spritesheet.h"
#include "spritesheetNumbers.h"
#include "gameBack1.h"
#include "helicopter.h"



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
    REG_BG1CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);
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
    REG_BG1HOFF = 0;
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        initGame();
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        srand(seed);
        initGame();
        goToInstructions();
    }

}
void instructions() {
    REG_BG0HOFF = 0;
    REG_BG1HOFF = 0;

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }

}


void game() {
    // if (end == 0) {
    //     updateGame();
    //     REG_BG0HOFF = 0;
    //     hOff++;
    //     REG_BG1HOFF = hOff;
    // } else {
    //     helicopter.row++;
    //     if (helicopter.row == 140) {
    //         endGame = 1;
    //     }
    // }
    updateGame();
    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0HOFF = 0;
    hOff++;
    REG_BG1HOFF = hOff;

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (endGame == 1) {
        goToLose();
    }
}


void pause() {
    REG_BG0HOFF = 0;
    REG_BG1HOFF = 0;

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
    
}
void lose() {
    REG_BG0HOFF = 0;
    REG_BG1HOFF = 0;

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
    DMANow(3, gameBack1Pal, PALETTE, gameBack1PalLen / 2);
    DMANow(3, gameBack1Tiles, &CHARBLOCK[1], gameBack1TilesLen / 2);
    DMANow(3, gameBack1Map, &SCREENBLOCK[30], gameBack1MapLen / 2);


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