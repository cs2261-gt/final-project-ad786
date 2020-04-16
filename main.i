# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 14 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
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
# 157 "myLib.h"
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
# 200 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 211 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 251 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 342 "myLib.h"
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
# 15 "main.c" 2
# 1 "game.h" 1
# 16 "main.c" 2
# 1 "start.h" 1
# 22 "start.h"
extern const unsigned short startTiles[768];


extern const unsigned short startMap[1024];


extern const unsigned short startPal[256];
# 17 "main.c" 2
# 1 "gameBackground.h" 1
# 22 "gameBackground.h"
extern const unsigned short gameBackgroundTiles[416];


extern const unsigned short gameBackgroundMap[1024];


extern const unsigned short gameBackgroundPal[256];
# 18 "main.c" 2
# 1 "instructions.h" 1
# 22 "instructions.h"
extern const unsigned short instructionsTiles[1440];


extern const unsigned short instructionsMap[1024];


extern const unsigned short instructionsPal[256];
# 19 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[944];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 20 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[880];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 21 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 22 "main.c" 2
# 1 "spritesheetNumbers.h" 1
# 21 "spritesheetNumbers.h"
extern const unsigned short spritesheetNumbersTiles[16384];


extern const unsigned short spritesheetNumbersPal[256];
# 23 "main.c" 2
# 1 "gameBack1.h" 1
# 22 "gameBack1.h"
extern const unsigned short gameBack1Tiles[16];


extern const unsigned short gameBack1Map[1024];


extern const unsigned short gameBack1Pal[256];
# 24 "main.c" 2
# 1 "helicopter.h" 1
typedef struct {
    int row;
    int col;
    int width;
    int height;
    int rdel;
} HELICOPTER;

extern HELICOPTER helicopter;
extern int topBoundary;
extern int bottomBoundary;
extern int endGame;
# 25 "main.c" 2



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

    hOff = 0;
    goToStart();
}

void start() {
    seed++;
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        srand(seed);
        initGame();
        goToGame();
    }
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        srand(seed);
        initGame();
        goToInstructions();
    }

}
void instructions() {
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;

    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goToStart();
    }
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
    }

}


void game() {
# 120 "main.c"
    updateGame();
    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short *)0x04000010) = 0;
    hOff++;
    (*(volatile unsigned short *)0x04000014) = hOff;

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }
    if (endGame == 1) {
        goToLose();
    }
}


void pause() {
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
    }
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goToStart();
    }

}
void lose() {
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }

}





void goToStart() {
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    DMANow(3, startPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, startTiles, &((charblock *)0x6000000)[0], 1536 / 2);
    DMANow(3, startMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    state = START;
}

void goToInstructions() {
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    DMANow(3, instructionsPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, instructionsTiles, &((charblock *)0x6000000)[0], 2880 / 2);
    DMANow(3, instructionsMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    state = INSTRUCTIONS;

}

void goToGame() {
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
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    DMANow(3, pausePal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, pauseTiles, &((charblock *)0x6000000)[0], 1888 / 2);
    DMANow(3, pauseMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    state = PAUSE;
}

void goToLose() {
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    DMANow(3, losePal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 1760 / 2);
    DMANow(3, loseMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    state = LOSE;

}
