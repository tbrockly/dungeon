//
//  Item.h
//  DungeonForever
//
//  Created by Ted on 12/20/12.
//
//

#import <Foundation/Foundation.h>
#import "CCSprite.h"
#define WEAPON 1;
#define SHIELD 2;
#define ARMOR 3;
#define RING 4;
#define AMULET 5;
#define CONSUMABLE 6;
#define KEY 7;

@interface Item : CCSprite{
    int level;
    NSString *myName;
    int type;
}

@property int level, type;
@property (nonatomic) NSString *name;

@end
