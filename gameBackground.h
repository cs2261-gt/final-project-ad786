
//{{BLOCK(gameBackground)

//======================================================================
//
//	gameBackground, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 26 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 832 + 2048 = 3392
//
//	Time-stamp: 2020-04-12, 16:49:46
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBACKGROUND_H
#define GRIT_GAMEBACKGROUND_H

#define gameBackgroundTilesLen 832
extern const unsigned short gameBackgroundTiles[416];

#define gameBackgroundMapLen 2048
extern const unsigned short gameBackgroundMap[1024];

#define gameBackgroundPalLen 512
extern const unsigned short gameBackgroundPal[256];

#endif // GRIT_GAMEBACKGROUND_H

//}}BLOCK(gameBackground)
