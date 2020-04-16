# 1 "soap.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "soap.c"
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
# 2 "soap.c" 2
# 1 "game.h" 1
# 3 "soap.c" 2
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
# 4 "soap.c" 2
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
# 5 "soap.c" 2


SOAP soap[6];
int soapIndex;
int soapCol;
int scoreRow;


void updateSoap() {
    for (int i = 0; i < 6; i++) {
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
    for (int i = 0; i < 6; i++) {
        if (!soap[i].active) {
            soap[i].row = ((helicopter.row) >> 8) + 2;
            soap[i].col = helicopter.col + helicopter.width;

            soap[i].active = 1;
            break;
        }
    }
}



void initSoap() {
    for (int i = 0; i < 6; i++) {
        soap[i].col = 0;
        soap[i].width = 26;
        soap[i].height = 13;
        soap[i].cdel = 2;
        soap[i].active = 0;
        soap[i].row = 0;
        soap[i].index = i;
    }
}
