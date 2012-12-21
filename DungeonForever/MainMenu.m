//
//  MainMenu.m
//  DungeonForever
//
//  Created by Ted on 12/10/12.
//
//

#import "MainMenu.h"
#import "Global.h"
#import "MapNode.h"
#import "MapLayer.h"

@implementation MainMenu

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainMenu *layer = [[[MainMenu alloc]initNewGame] autorelease];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) initNewGame
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		self.isTouchEnabled = YES;
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:[[Global vars] name] fontName:@"Marker Felt" fontSize:64];
        [self generateMap];
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
	}
	return self;
}

-(void) generateMap{
    srand(2);
    [[Global vars] setMap:[[NSMutableArray alloc] init]];
    int level=1;
    NSMutableArray* currNodes=[[[NSMutableArray alloc] init] autorelease];
    NSMutableArray* nextNodes=[[[NSMutableArray alloc] init] autorelease];
    MapNode* firstNode=[[MapNode alloc]init];
    [firstNode setLevel:level];
    [firstNode setPosition:20+rand() % 11];
    [[Global vars] setLocation:firstNode];
    [currNodes addObject:firstNode];
    [[[Global vars] map] addObject:firstNode];
    while(level<100){
        level=level+1;
        int randPath=rand()% [currNodes count];
        MapNode* parentNode=[currNodes objectAtIndex:randPath];
        if((rand() % 2 || [parentNode position]==0) && [parentNode position]!=50){
            [self generateNode:parentNode odds:-20 level:level west:true others:nextNodes];
        }else{
            [self generateNode:parentNode odds:-20 level:level west:false others:nextNodes];
        }
        for(MapNode *currNode in currNodes){
            if([currNode position]!=0){
                [self generateNode:currNode odds:[currNodes count] level:level west:true others:nextNodes];
            }
            if([currNode position]!=50){
                [self generateNode:currNode odds:[currNodes count] level:level west:false others:nextNodes];
            }
        }
        [currNodes removeAllObjects];
        [currNodes addObjectsFromArray:nextNodes];
        [[[Global vars] map] addObjectsFromArray:nextNodes];
        [nextNodes removeAllObjects];
    }
    level=level+1;
    int randPath=rand()% [currNodes count];
    MapNode* parentNode=[currNodes objectAtIndex:randPath];
    if((rand() % 2 || [parentNode position]==0) && [parentNode position]!=50){
        [self generateNode:parentNode odds:-20 level:level west:true others:nextNodes];
    }else{
        [self generateNode:parentNode odds:-20 level:level west:false others:nextNodes];
    }
    [[[Global vars] map] addObjectsFromArray:nextNodes];
}

-(void) generateNode:(MapNode*)parentNode odds:(int)odds level:(int)level west:(bool)isWest others:(NSMutableArray*)nextNodes{
    for(MapNode *myNode in nextNodes){
        if(isWest && [myNode position] ==[parentNode position]-1){
            [parentNode setSw:myNode];
            [myNode setNe:parentNode];
            return;
        }else if(!isWest && [myNode position] ==[parentNode position]+1){
            [parentNode setSe:myNode];
            [myNode setNw:parentNode];
            return;
        }
    }
    if(rand() % (8+odds+(level/10))>odds+(level/10)){
        MapNode* genNode=[[MapNode alloc]init];
        [genNode setLevel:level];
        if(isWest){
            [parentNode setSw:genNode];
            [genNode setNe:parentNode];
            [genNode setPosition:[parentNode position]-1];
        }else{
            [parentNode setSe:genNode];
            [genNode setNw:parentNode];
            [genNode setPosition:[parentNode position]+1];
        }
        [nextNodes addObject:genNode];
    }
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    // Choose one of the touches to work with
    //gameState.rocketTime=10;
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    [[CCDirector sharedDirector] pushScene:[[MapLayer scene] retain]];
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
