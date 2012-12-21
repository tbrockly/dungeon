//
//  Character.h
//  DungeonForever
//
//  Created by Ted on 12/20/12.
//
//

#import "CCSprite.h"
#import "Job.h"
#import "Ability.h"

@interface Character : CCSprite{
    int str,intel,agi,wis,con,lvl,mp,hp,xp;
    Job *job;
    Ability *special;
    NSString *name;
}

@property int str,intel,agi,wis,con,lvl,mp,hp,xp;
@property (nonatomic) Job *job;
@property (nonatomic) Ability *special;
@property (nonatomic) NSString *name;

@end
