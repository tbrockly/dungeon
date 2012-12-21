//
//  MapLayer.h
//  DungeonForever
//
//  Created by Ted on 12/14/12.
//
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "MapNode.h"

@interface MapLayer : CCLayer{
    
}
// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(void) drawMapForNode:(MapNode*)baseNode withMap:(NSMutableArray*)map;

@end
