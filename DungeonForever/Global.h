//
//  Global.h
//  DungeonForever
//
//  Created by Ted on 12/15/12.
//
//

#import <Foundation/Foundation.h>
#import "MapNode.h"

@interface Global : NSObject
{
    MapNode * location;
    NSString* name;
    NSMutableArray *map;
}

@property(nonatomic) NSString* name;
@property(nonatomic) MapNode * location;
@property(nonatomic) NSMutableArray * map;

+ (Global *)vars;



@end
