//Soap Struct
typedef struct {
    int row;
    int col;
    int width;
    int height;
    int cdel;
    int active;
    int index;
} SOAP;
//Constants
#define SOAPCOUNT 6
//External Variables
extern SOAP soap[SOAPCOUNT];
extern int soapIndex;
extern int soapCol;
extern int cheat;

//prototypes
void cheatSoap();
void updateSoap();
void fireSoap();
void initSoap();

