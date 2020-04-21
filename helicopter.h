//Helicopter Struct
typedef struct {
    int row;
    int col;
    int width;
    int height;
    int rdel;
    int tileCol;
} HELICOPTER;

//External Variables
extern HELICOPTER helicopter;
extern int topBoundary;
extern int bottomBoundary;
extern int endGame;
extern int end;


//Prototypes
void updateHelicopter();
void endScene();
void initHelicopter();