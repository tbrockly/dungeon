//
//  Global.m
//  DungeonForever
//
//  Created by Ted on 12/15/12.
//
//

#import "Global.h"
#import "MapNode.h"

@implementation Global
@synthesize name,location, map;

+ (Global *)vars
{
    // the instance of this class is stored here
    static Global *myInstance = nil;
    
    // check to see if an instance already exists
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
        myInstance.name=@"BUTT";
    }
    // return the instance of this class
    return myInstance;
}
@end

