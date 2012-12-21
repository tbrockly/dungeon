//
//  MapNode.h
//  DungeonForever
//
//  Created by Ted on 12/15/12.
//
//

#import <Foundation/Foundation.h>

@interface MapNode : NSObject{
    MapNode* nw;
    MapNode* ne;
    MapNode* sw;
    MapNode* se;
    int type;
    int level;
    int position;
    bool explored;
}
@property int type, level, position;
@property bool explored;
@property (nonatomic) MapNode* nw,*ne,* sw,* se;

@end
