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
    int index;
} SOAP;

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







extern HELICOPTER helicopter;
extern SOAP soap[6];
extern BARRIERS barriers[3];
extern CORONAVIRUS coronavirus[3];
# 3 "game.c" 2


OBJ_ATTR shadowOAM[128];
HELICOPTER helicopter;
SOAP soap[6];
BARRIERS barriers[3];
CORONAVIRUS coronavirus[3];

int barrierIndex;
int coronaIndex;
int coronaTimer;



void initGame() {
    barrierIndex = 0;
    coronaTimer = 0;

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

}
void updateGame() {
    coronaTimer++;
    updateCoronavirus();
    updateBarriers();
    updateSoap();
    updateHelicopter();



}
void updateHelicopter() {
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6))) && helicopter.row > 18) {
        helicopter.row--;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7))) && helicopter.row < 125) {
        helicopter.row++;
    }
    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
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
}
void drawHelicopter() {
    shadowOAM[10].attr0 = helicopter.row | (0<<14);
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

void updateBarriers() {
    for (int i = 0; i < 3; i++) {
        if (barriers[i].active) {
            barriers[i].col -= barriers[i].cdel;

            if (barriers[i].col == 110) {
                barrierIndex = (i + 1) % 3;
                barriers[barrierIndex].active = 1;
                barriers[barrierIndex].col = 200;
                barriers[barrierIndex].row = (rand() % 100) + 16;
            }
            if (barriers[i].col < 5) {
                barriers[i].active = 0;
            }

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
            int newCol = 0;

            if (barriers[var0].active && barriers[var0].col > 110) {
                newCol = barriers[var0].col + coronavirus[i].width;

            } else if (barriers[var1].active && barriers[var1].col > 110) {
                newCol = barriers[var1].col + coronavirus[i].width;

            } else if (barriers[var2].active && barriers[var2].col > 110) {
                newCol = barriers[var2].col + coronavirus[i].width;
            }

            coronavirus[i].col = newCol;
            coronavirus[i].row = (rand() % 80) + 16;
            coronaTimer = 0;
        }
    }
}


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
            soap[i].row = helicopter.row + 2;
            soap[i].col = helicopter.col + helicopter.width;

            soap[i].active = 1;
            break;
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
}

void initHelicopter() {
    helicopter.col = 12;
    helicopter.row = 80;
    helicopter.height = 19;
    helicopter.width = 30;
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
