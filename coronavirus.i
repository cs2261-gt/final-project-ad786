# 1 "coronavirus.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "coronavirus.c"
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
# 2 "coronavirus.c" 2
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
# 3 "coronavirus.c" 2
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
# 4 "coronavirus.c" 2


CORONAVIRUS coronavirus[3];
int coronaIndex;
int coronaTimer;



void updateCoronavirus() {
    for (int i = 0; i < 3; i++) {
        if (coronavirus[i].active) {
            coronavirus[i].col -= coronavirus[i].cdel;
            coronavirus[i].row += coronavirus[i].rdel;


            if (coronavirus[i].row < 16 || coronavirus[i].row > 120) {
                coronavirus[i].rdel *= -1;
            }

            if (coronavirus[i].col < 5) {
                coronavirus[i].active = 0;
            }
        }
        if (!coronavirus[i].active && coronaTimer == 100) {
            coronavirus[i].active = 1;



            int var0 = i;
            int var1 = (i + 1) % 3;
            int var2 = (i + 2) % 3;
            int newCol = 240;

            if (barriers[var0].active && barriers[var0].col > 110 && barriers[var0].col < 220) {
                newCol = barriers[var0].col + coronavirus[i].width;

            } else if (barriers[var1].active && barriers[var1].col > 110 && barriers[var1].col < 220) {
                newCol = barriers[var1].col + coronavirus[i].width;

            } else if (barriers[var2].active && barriers[var2].col > 110 && barriers[var2].col < 220) {
                newCol = barriers[var2].col + coronavirus[i].width;

            }

            coronavirus[i].col = newCol;
            coronavirus[i].row = (rand() % 85) + 16;
            coronaTimer = 0;
        }
    }
}


void initCoronavirus() {
    for (int i = 0; i < 3; i++) {
        coronavirus[i].col = 220;
        coronavirus[i].row = (rand() % 80) + 16;
        coronavirus[i].active = 0;
        coronavirus[i].cdel = 1;
        coronavirus[i].height = 25;
        coronavirus[i].width = 25;
        coronavirus[i].index = i;
        coronavirus[i].rdel = 1;
    }
    coronavirus[0].active = 1;
}
