#include "myLib.h"
#include "sound.h"

void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_TO_BOTH |
                     DSA_TIMER0 |
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 |
                     DSB_OUTPUT_TO_BOTH |
                     DSB_TIMER1 |
                     DSB_FIFO_RESET;

    REG_SOUNDCNT_L = 0;
}

void playSoundA( const signed char* sound, int length, int loops) {
        dma[1].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;

        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM0CNT = 0;

        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;

        // TODO 2.1:  Assign all of soundA’s appropriate struct values
        soundA.data = sound;
        soundA.duration = ((VBLANK_FREQ * length) / SOUND_FREQ);
        soundA.length = length;
        soundA.loops = loops;
        soundA.isPlaying = 1;
        soundA.vBlankCount = 0;
        
}


void playSoundB( const signed char* sound, int length, int loops) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;

        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;

         // TODO 2.2:  Assign all of soundB’s appropriate struct values
        soundB.data = sound;
        soundB.duration = ((VBLANK_FREQ*length) / SOUND_FREQ);
        soundB.length = length;
        soundB.loops = loops;
        soundB.isPlaying = 1;
        soundB.vBlankCount = 0;

}

void setupInterrupts()
{
    REG_IME = 0;

    // TODO 3.1 - Set up the interrupt handler
    void (*interruptHandler_ptr)(void) = &interruptHandler;
    REG_INTERRUPT = interruptHandler_ptr;





    REG_IE |= INT_VBLANK;
    REG_DISPSTAT |= INT_VBLANK_ENABLE;
    REG_IME = 1;
}

void interruptHandler() {

    REG_IME = 0;

    if(REG_IF & INT_VBLANK) {
        if (soundA.isPlaying) {

            //TODO 3.2 - Handle soundA playing in the interruptHandler function
            soundA.vBlankCount++;
            if (soundA.vBlankCount > soundA.duration) {
                if (soundA.loops) {
                    playSoundA(soundA.data, soundA.length, soundA.loops);
                } else {
                    soundA.isPlaying = 0;
                    dma[1].cnt = 0;
                    REG_TM0CNT = TIMER_OFF;
                }
            }
        }



        if (soundB.isPlaying) {

            //TODO 3.3 - Handle soundB playing in the interruptHandler function
            soundB.vBlankCount++;
            if (soundB.vBlankCount > soundB.duration) {
                if (soundB.loops) {
                    //soundB.vBlankCount = 0;
                    playSoundB(soundB.data, soundB.length, soundB.loops);
                } else {
                    soundB.isPlaying = 0;
                    dma[2].cnt = 0;
                    REG_TM1CNT = TIMER_OFF;
                }
            }
        }
        REG_IF = INT_VBLANK;
    }

    REG_IME = 1;
}

void pauseSound() {

    // TODO 4.1 - Complete the pauseSound function
    if (soundA.isPlaying) {
        soundA.isPlaying = 0;
        REG_TM0CNT = TIMER_OFF;;
    }
    if (soundB.isPlaying) {
        soundB.isPlaying = 0;
        REG_TM1CNT = TIMER_OFF;
    }

}

void unpauseSound() {

    // TODO 4.2 - Complete the unpauseSound function
    if (!soundA.isPlaying) {
        REG_TM0CNT = TIMER_ON;
        soundA.isPlaying = 1;
    }

    if (!soundB.isPlaying) {
        REG_TM1CNT = TIMER_ON;
        soundB.isPlaying = 1;
    }

}

void stopSound() {

    // TODO 4.3 - Complete the stopSound function

    if (soundA.isPlaying) {
        soundA.isPlaying = 0;
        REG_TM0CNT = TIMER_OFF;
        dma[1].cnt = 0;
    }
    if (soundB.isPlaying) {
        soundB.isPlaying = 0;
        REG_TM1CNT = TIMER_OFF;
        dma[2].cnt = 0;
    }








}