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


#define BARRIERCOUNT 3

extern BARRIERS barriers[BARRIERCOUNT];
extern int barrierIndex;

