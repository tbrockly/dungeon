//
//  MainMenu.h
//  DungeonForever
//
//  Created by Ted on 12/10/12.
//
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "MapNode.h"

@interface MainMenu : CCLayer{
    
}
// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(id) initNewGame;
-(void) generateMap;
-(void) generateNode:(MapNode*)parentNode odds:(int)odds level:(int)level west:(bool)isWest others:(NSMutableArray*)nextNodes;

@end
