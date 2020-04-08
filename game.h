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


#define SOAPCOUNT 6
#define BARRIERCOUNT 3
#define CORONAVIRUSCOUNT 3


extern HELICOPTER helicopter;
extern SOAP soap[SOAPCOUNT];
extern BARRIERS barriers[BARRIERCOUNT];
extern CORONAVIRUS coronavirus[CORONAVIRUSCOUNT];

