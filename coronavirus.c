#include "myLib.h"
#include "coronavirus.h"
#include "barriers.h"

//Global variables
CORONAVIRUS coronavirus[CORONAVIRUSCOUNT];
int coronaIndex;
int coronaTimer;


//Updating movement of coronavirus
void updateCoronavirus() {
    for (int i = 0; i < CORONAVIRUSCOUNT; i++) {
        if (coronavirus[i].active) {
            coronavirus[i].col -= coronavirus[i].cdel;
            coronavirus[i].row += coronavirus[i].rdel; // always add the rdel

            // reflect the rdel if coronavirus reaches the green bars
            if (coronavirus[i].row < 16 || coronavirus[i].row > 120) {
                coronavirus[i].rdel *= -1;
            }

            if (coronavirus[i].col < 5) {
                coronavirus[i].active = 0;
            }
        }
        if (!coronavirus[i].active && coronaTimer == 100) {
            coronavirus[i].active = 1;


            // logic to ensure the spawned coronaviruses never collide with a given barrier
            int var0 = i;
            int var1 = (i + 1) % 3;
            int var2 = (i + 2) % 3;
            int newCol = 240; // set it to be 240 to start and update - 
            // making sure col > 110 coronavirus doesnt spawn next to helicopter
            if (barriers[var0].active && barriers[var0].col > 110 && barriers[var0].col < 220) { 
                newCol = barriers[var0].col + coronavirus[i].width;

            } else if (barriers[var1].active && barriers[var1].col > 110 && barriers[var1].col < 220) {
                newCol = barriers[var1].col + coronavirus[i].width;

            } else if (barriers[var2].active && barriers[var2].col > 110 && barriers[var2].col < 220) {
                newCol = barriers[var2].col + coronavirus[i].width;
        
            }

            coronavirus[i].col = newCol; 
            coronavirus[i].row = (rand() % 85) + 16;
            //coronavirus[i].active = 1;
            coronaTimer = 0;
        }
    }
}

//Initializing Coronavirus
void initCoronavirus() {
    for (int i = 0; i < CORONAVIRUSCOUNT; i++) {
        coronavirus[i].col = 220;
        coronavirus[i].row = (rand() % 80) + 16;
        coronavirus[i].active = 0;
        coronavirus[i].cdel = 1;
        coronavirus[i].height = 25;
        coronavirus[i].width = 25;
        coronavirus[i].index = i;
        coronavirus[i].rdel = 1;
        coronavirus[i].tileCol = 4;
    }
    coronavirus[0].active = 1;
}