
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


#define CORONAVIRUSCOUNT 3

extern CORONAVIRUS coronavirus[CORONAVIRUSCOUNT];
extern int coronaIndex;
extern int coronaTimer;