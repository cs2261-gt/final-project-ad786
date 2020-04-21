/* CHEAT: Press L and R together to get unlimited soap, you will see infinity sign in bottom right when activated
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
#include "pausebg1.h"
#include "soap.h"
#include "startSong.h"
#include "gameSong.h"
#include "loseSong.h"
#include "shoot.h"
#include "pauseSong.h"
#include "sound.h"
//Prototypes
void initialize();
void start();
void instructions();
void game();
void pause();
void lose();
void goToStart();
void goToInstructions();
void goToGame();
void goToPause();
void goToLose();


//States
int state;
enum {START, INSTRUCTIONS, GAME, PAUSE, LOSE};
//Button Variables
unsigned short buttons;
unsigned short oldButtons;
//Random seed and hoff
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
//Set up mode 0, two backgrounds, and spritesheet, and sound
void initialize() {
    REG_BG0CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_BG1CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    hideSprites();

    setupInterrupts();
    setupSounds();

    hOff = 0;
    goToStart();
}
//Start state, initializes seed and game
void start() {
    seed++;
    REG_BG0HOFF = 0;
    REG_BG1HOFF = 0;
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        playSoundA(gameSong, GAMESONGLEN, 1);

        srand(seed);
        initGame();
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        pauseSound();

        srand(seed);
        initGame();
        goToInstructions();
    }

}
//Instructions state, takes you back to start or game
void instructions() {
    REG_BG0HOFF = 0;
    REG_BG1HOFF = 0;

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        unpauseSound();

        goToStart();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        playSoundA(gameSong, GAMESONGLEN, 1);

        goToGame();
    }

}

//Game state, update, draw, wait, DMA
void game() {
    if (end == 0) {
        updateGame();
        REG_BG0HOFF = 0;
        hOff++;
        REG_BG1HOFF = hOff;
    } else {
        endScene();
    }
    //updateGame();
    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);



    if (BUTTON_PRESSED(BUTTON_START)) {
        pauseSound();
        playSoundB(pauseSong, PAUSESONGLEN - 50, 1);

        goToPause();
    }
    if (endGame == 1) {
        pauseSound();


        goToLose();
    }
    if (BUTTON_PRESSED(BUTTON_L) && BUTTON_PRESSED(BUTTON_R)) {
        cheatSoap();
    }
}

// Pause state to go from game and pause screen
void pause() {
    //REG_BG0HOFF = 0;
    //REG_BG1HOFF = 0;


    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        unpauseSound();
        
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        stopSound();

        playSoundA(startSong, STARTSONGLEN - 225, 1);

        goToStart();
    }

    if (BUTTON_HELD(BUTTON_LEFT)) {
        hOff--;
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        hOff++;
    }
    
    REG_BG0HOFF = hOff;
    REG_BG1HOFF = hOff / 2;
    waitForVBlank();

    
}
//Lose state to go back to beginning
void lose() {
    REG_BG0HOFF = 0;
    REG_BG1HOFF = 0;

    
    displayScore();

    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        playSoundA(startSong, STARTSONGLEN - 225, 1);

        goToStart();
    }

}







//State-transition States
//Sets up start page and function
void goToStart() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    DMANow(3, startPal, PALETTE, startPalLen / 2);
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2);
    DMANow(3, startMap, &SCREENBLOCK[28], startMapLen / 2);

    playSoundA(startSong, STARTSONGLEN - 225, 1);

    state = START;
}
//Sets up instructions page and function
void goToInstructions() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    DMANow(3, instructionsPal, PALETTE, instructionsPalLen / 2);
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2);
    DMANow(3, instructionsMap, &SCREENBLOCK[28], instructionsMapLen / 2);

    state = INSTRUCTIONS;


}
//sets up game page w multiple background and function
void goToGame() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE  | SPRITE_ENABLE;

    DMANow(3, gameBack1Pal, PALETTE, gameBack1PalLen / 2);
    DMANow(3, gameBack1Tiles, &CHARBLOCK[1], gameBack1TilesLen / 2);
    DMANow(3, gameBack1Map, &SCREENBLOCK[30], gameBack1MapLen / 2);


    DMANow(3, gameBackgroundPal, PALETTE, gameBackgroundPalLen / 2);
    DMANow(3, gameBackgroundTiles, &CHARBLOCK[0], gameBackgroundTilesLen / 2);
    DMANow(3, gameBackgroundMap, &SCREENBLOCK[28], gameBackgroundMapLen / 2);



    state = GAME;

}

//sets up pause screen and function
void goToPause() {
    hideSprites();

    drawPauseScreen();
    DMANow(3, shadowOAM, OAM, 512);
    hideSprites();

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    DMANow(3, pausebg1Tiles, &CHARBLOCK[1], pausebg1TilesLen / 2);
    DMANow(3, pausebg1Map, &SCREENBLOCK[30], pausebg1MapLen / 2);

    DMANow(3, pausePal, PALETTE, pausePalLen / 2);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[28], pauseMapLen / 2);

    hOff = 0;
    state = PAUSE;
}
//Sets up lose screen and function
void goToLose() {

    unpauseSound();

    hideSprites();
    displayScore();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);


    DMANow(3, losePal, PALETTE, losePalLen / 2);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[28], loseMapLen / 2);

    state = LOSE;

}