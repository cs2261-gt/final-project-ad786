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
} SOAP;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int active;
    int tileCol;
    int index;
} BARRIERS;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int active;
} CORONAVIRUS;


#define SOAPCOUNT 6
#define BARRIERCOUNT 3


extern HELICOPTER helicopter;
extern SOAP soap[SOAPCOUNT];
extern BARRIERS barriers[BARRIERCOUNT];
extern CORONAVIRUS coronavirus;

