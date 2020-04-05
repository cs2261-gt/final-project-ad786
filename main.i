# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "start.h" 1
# 22 "start.h"
extern const unsigned short startTiles[976];


extern const unsigned short startMap[1024];


extern const unsigned short startPal[256];
# 3 "main.c" 2



int state;
enum {START, INSTRUCTIONS, GAME, PAUSE, LOSE};

unsigned short buttons;
unsigned short oldButtons;

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
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    goToStart();
}

void start() {

}
void instructions() {

}
void game() {

}
void pause() {

}
void lose() {

}


void goToStart() {
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    DMANow(3, startPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, startTiles, &((charblock *)0x6000000)[0], 1952 / 2);
    DMANow(3, startMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    state = START;
}

void goToInstructions() {

}

void goToGame() {

}

void goToPause() {

}

void goToLose() {

}
