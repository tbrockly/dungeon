//
//  MapLayer.m
//  DungeonForever
//
//  Created by Ted on 12/14/12.
//
//

#import "MapLayer.h"
#import "MapNode.h"
#import "Global.h"

@implementation MapLayer
CGPoint dragPoint;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MapLayer *layer = [MapLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
		self.isTouchEnabled = YES;
		// create and initialize a Label
		//CCLabelTTF *label = [CCLabelTTF labelWithString:@"BUTTS" fontName:@"Marker Felt" fontSize:64];
        
		// ask director the the window size
		//CGSize size = [[CCDirector sharedDirector] winSize];
        NSMutableArray *nodesToDraw=[[NSMutableArray alloc] initWithArray:[[Global vars] map]];
        [self drawMapForNode:[[Global vars] location] withMap:nodesToDraw];
	}
	return self;
}

-(void) drawMapForNode:(MapNode*)baseNode withMap:(NSMutableArray*)map{
    CCSprite *mySprite = [CCSprite spriteWithFile:@"Icon-Small.png"];
    mySprite.scale=.4;
    mySprite.position=ccp([baseNode position]*20,[baseNode level]*-20);
    [self addChild:mySprite];
    [map removeObject:baseNode];
    if([baseNode nw] != nil && [map containsObject:[baseNode nw]]){
        [self drawMapForNode:[baseNode nw] withMap:map];
    }if([baseNode ne] != nil && [map containsObject:[baseNode ne]]){
        [self drawMapForNode:[baseNode ne] withMap:map];
    }if([baseNode sw] != nil && [map containsObject:[baseNode sw]]){
        [self drawMapForNode:[baseNode sw] withMap:map];
    }if([baseNode se] != nil && [map containsObject:[baseNode se]]){
        [self drawMapForNode:[baseNode se] withMap:map];
    }
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    dragPoint = [touch locationInView:[touch view]];
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    self.position=ccp(self.position.x+location.x-dragPoint.x,self.position.y+dragPoint.y-location.y);
    dragPoint = location;
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
