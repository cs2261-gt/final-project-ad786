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
# 2 "game.c" 2
# 1 "game.h" 1
typedef struct {
    int row;
    int col;
    int width;
    int height;

} HELICOPTER;

typedef struct {
    int row;
    int col;
    int width;
    int height;
    int cdel;
    int active;
} SOAP;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int active;
    int tileCol;
    int index;
} BARRIERS;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int active;
} CORONAVIRUS;






extern HELICOPTER helicopter;
extern SOAP soap[6];
extern BARRIERS barriers[3];
extern CORONAVIRUS coronavirus;
# 3 "game.c" 2


OBJ_ATTR shadowOAM[128];
HELICOPTER helicopter;
SOAP soap[6];
BARRIERS barriers[3];
CORONAVIRUS coronavirus;
int barrierTimer;
int barrierIndex;
int hOff;
int screenBlock;
int playerHOff;

void initGame() {
    hOff = 0;
    screenBlock = 28;
    playerHOff = 0;
    initHelicopter();
    initBarriers();
}

void drawGame() {
    drawHelicopter();
    drawBarriers();

}
void updateGame() {
# 40 "game.c"
    updateHelicopter();
    updateBarriers();
    barrierTimer++;

    (*(volatile unsigned short *)0x04000010) = hOff;

}
void updateHelicopter() {
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        helicopter.row--;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        helicopter.row++;
    }




}
void drawHelicopter() {
    shadowOAM[10].attr0 = helicopter.row | (0<<14);
    shadowOAM[10].attr1 = helicopter.col | (2<<14);
    shadowOAM[10].attr2 = ((0)*32+(0));
}

void drawBarriers() {
    for (int i = 0; i < 3; i++) {
        if (barriers[i].active) {
            shadowOAM[barriers[i].index].attr0 = barriers[barriers[i].index].row | (0<<14);
            shadowOAM[barriers[i].index].attr1 = barriers[barriers[i].index].col | (2<<14);
            shadowOAM[barriers[i].index].attr2 = ((4)*32+(0));
        } else {
            shadowOAM[barriers[i].index].attr0 = (2<<8);
        }
    }
}
void updateBarriers() {
    for (int i = 0; i < 3; i++) {
        if (barriers[i].active) {
            barriers[i].col--;
        }
        if (barriers[i].col < 50) {
            barriers[i].active = 0;
            barrierIndex++;


        }

    }







}

void initHelicopter() {
    helicopter.col = 30;
    helicopter.row = 80;
    helicopter.height = 32;
    helicopter.width = 32;
}

void initBarriers() {
    for (int i = 0; i < 3; i++) {
        barriers[i].col = 200;
        barriers[i].row = (rand() % 105) + 20;
        barriers[i].height = 32;
        barriers[i].width = 32;
        barriers[i].active = 0;
        barriers[i].tileCol = 0;
        barriers[i].index = i;
    }
    barriers[0].active = 1;
}
