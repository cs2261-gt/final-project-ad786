# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"


# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 73 "myLib.h"
extern unsigned short *videoBuffer;
# 94 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 166 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 209 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 220 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 260 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 351 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 4 "main.c" 2
# 1 "game.h" 1

extern int onesCol;
extern int scoreRow;
extern int tensCol;
extern int hundCol;
extern int onesIndex;
extern int tensIndex;
extern int hundIndex;

extern int scoreTimer;
extern int scoreTimer2;
extern int scoreTimer3;
extern int helicopterTimer;







void initGame();
void drawGame();
void updateGame();
void updateScore();
void drawScore();
void displayScore();
void drawHelicopter();
void drawBarriers();
void drawCoronavirus();
void drawSoap();
void drawPauseScreen();
# 5 "main.c" 2
# 1 "start.h" 1
# 22 "start.h"
extern const unsigned short startTiles[3344];


extern const unsigned short startMap[1024];


extern const unsigned short startPal[256];
# 6 "main.c" 2
# 1 "gameBackground.h" 1
# 22 "gameBackground.h"
extern const unsigned short gameBackgroundTiles[416];


extern const unsigned short gameBackgroundMap[1024];


extern const unsigned short gameBackgroundPal[256];
# 7 "main.c" 2
# 1 "instructions.h" 1
# 22 "instructions.h"
extern const unsigned short instructionsTiles[6928];


extern const unsigned short instructionsMap[1024];


extern const unsigned short instructionsPal[256];
# 8 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[5456];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 9 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[2256];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 10 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 11 "main.c" 2
# 1 "spritesheetNumbers.h" 1
# 21 "spritesheetNumbers.h"
extern const unsigned short spritesheetNumbersTiles[16384];


extern const unsigned short spritesheetNumbersPal[256];
# 12 "main.c" 2
# 1 "gameBack1.h" 1
# 22 "gameBack1.h"
extern const unsigned short gameBack1Tiles[16];


extern const unsigned short gameBack1Map[1024];


extern const unsigned short gameBack1Pal[256];
# 13 "main.c" 2
# 1 "helicopter.h" 1

typedef struct {
    int row;
    int col;
    int width;
    int height;
    int rdel;
    int tileCol;
} HELICOPTER;


extern HELICOPTER helicopter;
extern int topBoundary;
extern int bottomBoundary;
extern int endGame;
extern int end;



void updateHelicopter();
void endScene();
void initHelicopter();
# 14 "main.c" 2
# 1 "pausebg1.h" 1
# 22 "pausebg1.h"
extern const unsigned short pausebg1Tiles[3920];


extern const unsigned short pausebg1Map[1024];


extern const unsigned short pausebg1Pal[256];
# 15 "main.c" 2
# 1 "soap.h" 1

typedef struct {
    int row;
    int col;
    int width;
    int height;
    int cdel;
    int active;
    int index;
} SOAP;



extern SOAP soap[6];
extern int soapIndex;
extern int soapCol;
extern int cheat;


void cheatSoap();
void updateSoap();
void fireSoap();
void initSoap();
# 16 "main.c" 2
# 1 "startSong.h" 1




extern const signed char startSong[354264];
# 17 "main.c" 2
# 1 "gameSong.h" 1




extern const signed char gameSong[738104];
# 18 "main.c" 2
# 1 "loseSong.h" 1




extern const signed char loseSong[140883];
# 19 "main.c" 2
# 1 "shoot.h" 1




extern const signed char shoot[1998];
# 20 "main.c" 2
# 1 "pauseSong.h" 1




extern const signed char pauseSong[617656];
# 21 "main.c" 2
# 1 "sound.h" 1
SOUND soundA;
SOUND soundB;



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 22 "main.c" 2

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
        buttons = (*(volatile unsigned short *)0x04000130);

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
    (*(volatile unsigned short*)0x4000008) = (0<<14) | (0<<7) | ((0)<<2) | ((28)<<8);
    (*(volatile unsigned short*)0x400000A) = (0<<14) | (0<<7) | ((1)<<2) | ((30)<<8);
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);
    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);
    hideSprites();

    setupInterrupts();
    setupSounds();

    hOff = 0;
    goToStart();
}

void start() {
    seed++;
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        stopSound();
        playSoundA(gameSong, 738104, 1);

        srand(seed);
        initGame();
        goToGame();
    }
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        pauseSound();

        srand(seed);
        initGame();
        goToInstructions();
    }

}

void instructions() {
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;

    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        unpauseSound();

        goToStart();
    }
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        stopSound();
        playSoundA(gameSong, 738104, 1);

        goToGame();
    }

}


void game() {
    if (end == 0) {
        updateGame();
        (*(volatile unsigned short *)0x04000010) = 0;
        hOff++;
        (*(volatile unsigned short *)0x04000014) = hOff;
    } else {
        endScene();
    }

    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);



    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        pauseSound();
        playSoundB(pauseSong, 617656 - 50, 1);

        goToPause();
    }
    if (endGame == 1) {
        pauseSound();


        goToLose();
    }
    if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9)))) && (!(~(oldButtons)&((1<<8))) && (~buttons & ((1<<8))))) {
        cheatSoap();
    }
}


void pause() {




    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        stopSound();
        unpauseSound();

        goToGame();
    }
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        stopSound();

        playSoundA(startSong, 354264 - 225, 1);

        goToStart();
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        hOff--;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        hOff++;
    }

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000014) = hOff / 2;
    waitForVBlank();


}

void lose() {
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;


    displayScore();

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        stopSound();
        playSoundA(startSong, 354264 - 225, 1);

        goToStart();
    }

}
# 223 "main.c"
void goToStart() {
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    DMANow(3, startPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, startTiles, &((charblock *)0x6000000)[0], 6688 / 2);
    DMANow(3, startMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    playSoundA(startSong, 354264 - 225, 1);

    state = START;
}

void goToInstructions() {
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    DMANow(3, instructionsPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, instructionsTiles, &((charblock *)0x6000000)[0], 13856 / 2);
    DMANow(3, instructionsMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    state = INSTRUCTIONS;


}

void goToGame() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9) | (1<<12);

    DMANow(3, gameBack1Pal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gameBack1Tiles, &((charblock *)0x6000000)[1], 32 / 2);
    DMANow(3, gameBack1Map, &((screenblock *)0x6000000)[30], 2048 / 2);


    DMANow(3, gameBackgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gameBackgroundTiles, &((charblock *)0x6000000)[0], 832 / 2);
    DMANow(3, gameBackgroundMap, &((screenblock *)0x6000000)[28], 2048 / 2);



    state = GAME;

}


void goToPause() {
    hideSprites();

    drawPauseScreen();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    hideSprites();

    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9) | (1<<12);

    DMANow(3, pausebg1Tiles, &((charblock *)0x6000000)[1], 7840 / 2);
    DMANow(3, pausebg1Map, &((screenblock *)0x6000000)[30], 2048 / 2);

    DMANow(3, pausePal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, pauseTiles, &((charblock *)0x6000000)[0], 10912 / 2);
    DMANow(3, pauseMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    hOff = 0;
    state = PAUSE;
}

void goToLose() {

    unpauseSound();

    hideSprites();
    displayScore();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);


    DMANow(3, losePal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 4512 / 2);
    DMANow(3, loseMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    state = LOSE;

}
