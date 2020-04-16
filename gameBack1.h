
//{{BLOCK(gameBack1)

//======================================================================
//
//	gameBack1, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32 + 2048 = 2592
//
//	Time-stamp: 2020-04-12, 16:52:28
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBACK1_H
#define GRIT_GAMEBACK1_H

#define gameBack1TilesLen 32
extern const unsigned short gameBack1Tiles[16];

#define gameBack1MapLen 2048
extern const unsigned short gameBack1Map[1024];

#define gameBack1PalLen 512
extern const unsigned short gameBack1Pal[256];

#endif // GRIT_GAMEBACK1_H

//}}BLOCK(gameBack1)
