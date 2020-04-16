typedef struct {
    int row;
    int col;
    int width;
    int height;
    int cdel;
    int active;
    int index;
} SOAP;

#define SOAPCOUNT 6

extern SOAP soap[SOAPCOUNT];
extern int soapIndex;
extern int soapCol;

