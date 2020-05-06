# 1 "helicopter.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "helicopter.c"
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
# 2 "helicopter.c" 2
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
# 3 "helicopter.c" 2
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
# 4 "helicopter.c" 2
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
# 5 "helicopter.c" 2
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
# 6 "helicopter.c" 2
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


void updateCoronavirus();
void initCoronavirus();
# 7 "helicopter.c" 2
# 1 "shoot.h" 1




extern const signed char shoot[1998];
# 8 "helicopter.c" 2
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
# 9 "helicopter.c" 2
# 1 "loseSong.h" 1




extern const signed char loseSong[140883];
# 10 "helicopter.c" 2

HELICOPTER helicopter;
int topBoundary;
int bottomBoundary;
int endGame;
int end;


void updateHelicopter() {

    if (((helicopter.row + helicopter.rdel) >> 8) < bottomBoundary) {
        helicopter.row += helicopter.rdel;
        if (((helicopter.row) >> 8) < topBoundary) {
            helicopter.row = ((topBoundary) << 8);
            helicopter.rdel = 0;
        }
    } else {
        helicopter.rdel = 0;
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        helicopter.rdel -= 46;
    }

    helicopter.rdel += 22;

    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && soapIndex > 0 && !cheat) {
        playSoundB(shoot, 1998, 0);
        fireSoap();
        soapIndex--;
    }
    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && cheat) {
        playSoundB(shoot, 1998, 0);
        fireSoap();
    }




    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 6; j++) {
            if (coronavirus[i].active && soap[j].active && collision(soap[j].col, soap[j].row, soap[j].width, soap[j].height,
                        coronavirus[i].col, coronavirus[i].row, coronavirus[i].width, coronavirus[i].height)) {

                soap[j].active = 0;
                coronavirus[i].active = 0;
            }
        }
    }


    for (int c = 0; c < 3; c++) {
        if (coronavirus[c].active && collision(helicopter.col, ((helicopter.row) >> 8), helicopter.width, helicopter.height,
                coronavirus[c].col, coronavirus[c].row, coronavirus[c].width, coronavirus[c].height)) {


                    end = 1;
                    helicopter.rdel = 0;
                    stopSound();
                    playSoundA(loseSong, 140883, 0);


        }
    }

    for (int b = 0; b < 3; b++) {
        if (barriers[b].active && collision(helicopter.col, ((helicopter.row) >> 8), helicopter.width, helicopter.height,
                barriers[b].col, barriers[b].row, barriers[b].width, barriers[b].height)) {


                    end = 1;
                    helicopter.rdel = 0;
                    stopSound();
                    playSoundA(loseSong, 140883, 0);


        }
    }
}

void endScene() {
    helicopter.row += helicopter.rdel;
    helicopter.rdel += 15;


    if (((helicopter.row + helicopter.rdel) >> 8) > 145) {
        endGame = 1;
    }

}


void initHelicopter() {
    helicopter.col = 12;
    helicopter.row = ((60) << 8);
    helicopter.height = 19;
    helicopter.width = 30;
    helicopter.rdel = 1;
    helicopter.tileCol = 0;
}
