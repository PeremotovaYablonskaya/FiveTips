//
//  PYRestaurantHelper.m
//  FiveTips
//
//  Created by fpmi on 10.10.15.
//  Copyright (c) 2015 fpmi. All rights reserved.
//

#import "PYRestaurantHelper.h"
static const double COEFFICIENT=0.002;
@implementation PYRestaurantHelper
-(double)receiveTipsCount{
    double tips = 0;
    if(self.foodPriority!=-1)
    {
        tips+=self.foodPriority*self.foodQuality*COEFFICIENT*self.checkCount;
    }
    if(self.servicePriority!=-1)
    {
        tips+=self.servicePriority*self.serviceQuality*COEFFICIENT*self.checkCount;
    }
    if(self.atmospherePriority!=-1)
    {
        tips+=self.atmospherePriority*self.atmosphereQuality*COEFFICIENT*self.checkCount;
    }
    if(self.speedPriority!=-1)
    {
        tips+=self.speedPriority*self.speed*COEFFICIENT*self.checkCount;
    }
    return tips;
}
-(id)init{
    self = [super init];
    if(self){
        _foodPriority = -1;
        _servicePriority = -1;
        _atmospherePriority = -1;
        _speedPriority = -1;
    }
    return self;
}
@end
