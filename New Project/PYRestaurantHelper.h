//
//  PYRestaurantHelper.h
//  FiveTips
//
//  Created by fpmi on 10.10.15.
//  Copyright (c) 2015 fpmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PYRestaurantHelper : NSObject
@property unsigned int foodQuality;
@property int foodPriority;
@property unsigned int serviceQuality;
@property int servicePriority;
@property unsigned int atmosphereQuality;
@property int atmospherePriority;
@property unsigned int speed;
@property int speedPriority;
@property double checkCount;
-(id)init;
-(double)receiveTipsCount;
@end
