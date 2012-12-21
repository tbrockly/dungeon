//
//  MapNode.m
//  DungeonForever
//
//  Created by Ted on 12/15/12.
//
//

#import "MapNode.h"

@implementation MapNode
@synthesize nw,ne,sw,se,position,level,explored,type;

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        explored=FALSE;
    }
    return self;
}

@end
