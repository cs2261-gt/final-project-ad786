//Barrier Struct
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

//Constants
#define BARRIERCOUNT 3
//External variables
extern BARRIERS barriers[BARRIERCOUNT];
extern int barrierIndex;

//Prototypes
void updateBarriers();
void initBarriers();

