# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"

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
# 3 "game.c" 2
# 1 "game.h" 1
# 4 "game.c" 2
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
# 5 "game.c" 2
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
# 6 "game.c" 2
# 1 "barriers.h" 1
typedef struct {
    int col;
    int row;
    int width;
    int height;
    int active;
    int tileCol;
    int index;
    int cdel;
} BARRIERS;




extern BARRIERS barriers[3];
extern int barrierIndex;
# 7 "game.c" 2
# 1 "coronavirus.h" 1

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int active;
    int tileCol;
    int index;
    int cdel;
    int rdel;
} CORONAVIRUS;




extern CORONAVIRUS coronavirus[3];
extern int coronaIndex;
extern int coronaTimer;
# 8 "game.c" 2

OBJ_ATTR shadowOAM[128];
int sprite_tile_index[] = {384, 388, 392, 396, 400, 512, 516, 520, 524, 528};


int scoreRow;
int onesCol;
int tensCol;
int hundCol;
int onesIndex;
int tensIndex;
int hundIndex;


int scoreTimer;
int scoreTimer2;
int scoreTimer3;


void initGame() {
    endGame = 0;
    barrierIndex = 0;
    coronaTimer = 0;
    topBoundary = 17;
    bottomBoundary = 125;

    soapIndex = 6;
    soapCol = 217;


    onesCol = 66;
    scoreRow = 146;
    tensCol = 56;
    hundCol = 46;
    onesIndex = 0;
    tensIndex = 0;
    hundIndex = 0;


    scoreTimer = 0;
    scoreTimer2 = 0;
    scoreTimer3 = 0;

    initHelicopter();
    initBarriers();
    initSoap();
    initCoronavirus();
}



void drawGame() {
    drawHelicopter();
    drawBarriers();
    drawSoap();
    drawCoronavirus();
    drawScore();

}



void updateGame() {
    coronaTimer++;
    scoreTimer++;
    scoreTimer2++;
    scoreTimer3++;
    updateCoronavirus();
    updateBarriers();
    updateSoap();
    updateHelicopter();
    updateScore();
}

void updateScore() {
    if (scoreTimer == 70) {
        onesIndex = onesIndex % 10;
        onesIndex++;
        scoreTimer = 0;
    }
    if (scoreTimer2 == 700) {
        tensIndex = tensIndex % 10;
        tensIndex++;
        scoreTimer2 = 0;
    }
    if (scoreTimer3 == 7000) {
        hundIndex = hundIndex % 10;
        hundIndex++;
        scoreTimer3 = 0;

    }
}

void drawScore() {
    shadowOAM[40].attr0 = scoreRow | (0<<14);
    shadowOAM[40].attr1 = onesCol | (2<<14);
    if (onesIndex == 10) {
        onesIndex = 0;
    }
    shadowOAM[40].attr2 = sprite_tile_index[onesIndex];

    shadowOAM[41].attr0 = scoreRow | (0<<14);
    shadowOAM[41].attr1 = tensCol | (2<<14);
    if (tensIndex == 10) {
        tensIndex = 0;
    }
    shadowOAM[41].attr2 = sprite_tile_index[tensIndex];

    shadowOAM[42].attr0 = scoreRow | (0<<14);
    shadowOAM[42].attr1 = hundCol | (2<<14);
    if (hundIndex == 10) {
        hundIndex = 0;
        tensIndex = 0;
        onesIndex = 0;
    }
    shadowOAM[42].attr2 = sprite_tile_index[hundIndex];

}


void drawHelicopter() {
    shadowOAM[10].attr0 = ((helicopter.row) >> 8) | (0<<14);
    shadowOAM[10].attr1 = helicopter.col | (2<<14);
    shadowOAM[10].attr2 = ((0)*32+(0));

}



void drawBarriers() {
    for (int i = 0; i < 3; i++) {
        if (barriers[i].active) {
            shadowOAM[barriers[i].index].attr0 = barriers[i].row | (0<<14);
            shadowOAM[barriers[i].index].attr1 = barriers[i].col | (2<<14);
            shadowOAM[barriers[i].index].attr2 = ((4)*32+(0));
        } else {
            shadowOAM[barriers[i].index].attr0 = (2<<8);
        }
    }
}

void drawCoronavirus() {
    for (int i = 0; i < 3; i++) {
        if (coronavirus[i].active) {
            shadowOAM[coronavirus[i].index + 25].attr0 = (0xFF & coronavirus[i].row) | (0<<14);
            shadowOAM[coronavirus[i].index + 25].attr1 = (0x1FF & coronavirus[i].col) | (2<<14);
            shadowOAM[coronavirus[i].index + 25].attr2 = ((0)*32+(4));
        } else {
            shadowOAM[coronavirus[i].index + 25].attr0 = (2<<8);
        }
    }
}

void drawSoap() {
    for (int i = 0; i < 6; i++) {
        if (soap[i].active) {
            shadowOAM[soap[i].index + 15].attr0 = soap[i].row | (0<<14);
            shadowOAM[soap[i].index + 15].attr1 = soap[i].col | (2<<14);
            shadowOAM[soap[i].index + 15].attr2 = ((8)*32+(0));
        } else {
            shadowOAM[soap[i].index + 15].attr0 = (2<<8);
        }
    }

    shadowOAM[50].attr0 = scoreRow | (0<<14);
    shadowOAM[50].attr1 = soapCol | (2<<14);
    if (soapIndex < 0) {
        soapIndex = 0;
    }
    shadowOAM[50].attr2 = sprite_tile_index[soapIndex];
}
