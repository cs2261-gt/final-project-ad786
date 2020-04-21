# 1 "barriers.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "barriers.c"
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


void updateBarriers();
void initBarriers();
# 2 "barriers.c" 2
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
# 3 "barriers.c" 2
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
# 4 "barriers.c" 2


BARRIERS barriers[3];
int barrierIndex;



void updateBarriers() {
    for (int i = 0; i < 3; i++) {
        if (barriers[i].active) {
            barriers[i].col -= barriers[i].cdel;

            if (barriers[i].col == 90) {
                barrierIndex = (i + 1) % 3;
                barriers[barrierIndex].active = 1;
                barriers[barrierIndex].col = 200;
                barriers[barrierIndex].row = (rand() % 100) + 18;
            }
            if (barriers[i].col < 5) {
                barriers[i].active = 0;
            }

        }
    }
}

void initBarriers() {
    for (int i = 0; i < 3; i++) {
        barriers[i].col = 200;
        barriers[i].row = (rand() % 80) + 16;
        barriers[i].height = 25;
        barriers[i].width = 8;
        barriers[i].active = 0;
        barriers[i].tileCol = 0;
        barriers[i].index = i;
        barriers[i].cdel = 1;
    }
    barriers[0].active = 1;
}
