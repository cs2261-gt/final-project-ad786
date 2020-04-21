//Coronavirus Struct
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

//Constants
#define CORONAVIRUSCOUNT 3
//External Variables
extern CORONAVIRUS coronavirus[CORONAVIRUSCOUNT];
extern int coronaIndex;
extern int coronaTimer;

//Prototypes
void updateCoronavirus();
void initCoronavirus();