//External constants
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
//Constants
#define GRAVITY 22
#define JUMPPOWER 46
#define ENDGRAVITY 15
#define SHIFTUP(num)  ((num) << 8)
#define SHIFTDOWN(num)  ((num) >> 8)
//Prototypes
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





