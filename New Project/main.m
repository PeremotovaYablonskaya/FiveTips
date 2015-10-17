//
//  main.m
//  FiveTips
//
//  Created by fpmi on 10.10.15.
//  Copyright (c) 2015 fpmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PYRestaurantHelper.h"
#import "PYXMLHelper.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        PYRestaurantHelper *helper = [[PYRestaurantHelper alloc] init];
        helper.checkCount = 200.0;
        helper.foodPriority = 4;
        helper.speedPriority = 3;
        helper.atmospherePriority = 2;
        helper.servicePriority = 1;
        helper.foodQuality = 5;
        helper.speed = 5;
        helper.atmosphereQuality = 2;
        helper.serviceQuality = 1;
        NSLog(@"Tips: %f", [helper receiveTipsCount]);
        [helper release];
       
        
        NSMutableDictionary *rootObj = [NSMutableDictionary dictionaryWithCapacity:10];
        NSDictionary *innerDict;
        NSString *restaurantName;
        NSDate *dateOfVisit;
        NSNumber *tips;
        NSString *error;
        NSPropertyListFormat format;
        NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)
                              objectAtIndex:0];
        NSString *plistPath = [rootPath stringByAppendingPathComponent:@"PYRestaurantsVisit.plist"];

        
        restaurantName = @"Tapas";
        dateOfVisit = [NSDate dateWithString:@"2015-08-04 11:32:00 +0300"];
        tips = [NSNumber numberWithDouble:20.0];
        innerDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:restaurantName,dateOfVisit, tips, nil]
                    forKeys:[NSArray arrayWithObjects:@"Restaurant", @"Date", @"Tips", nil]];
        [rootObj setObject:innerDict forKey:@"1"];
        restaurantName = @"Malt and Hops";
        dateOfVisit = [NSDate dateWithString:@"2015-08-09 19:00:00 +0300"];
        tips = [NSNumber numberWithDouble:30.0];
        innerDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:restaurantName, dateOfVisit, tips, nil]
                    forKeys:[NSArray arrayWithObjects:@"Restaurant", @"Date", @"Tips", nil]];
        [rootObj setObject:innerDict forKey:@"2"];
        id plist = [NSPropertyListSerialization dataFromPropertyList:(id)rootObj format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
        if(plist)
        {
            [plist writeToFile:plistPath atomically:YES];
        }
        else
        {
            NSLog(error);
            [error release];
        }
    
        
        PYXMLHelper *xmlHelp = [[PYXMLHelper alloc]init];
        NSDictionary *temp = [xmlHelp receiveInfoFromXML:plistPath];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"hh:mm, dd.MM.yyyy"];
        for(NSInteger i = 1; i <= [temp count]; i++)
        {
            NSString *tmp = [[NSString alloc] initWithFormat:@"%ld", (long)i];
            NSLog([[temp objectForKey:tmp]objectForKey:@"Restaurant"]);
            NSLog([formatter stringFromDate:[[temp objectForKey:tmp]objectForKey:@"Date"]]);
            NSLog([[[temp objectForKey:tmp]objectForKey:@"Tips"] stringValue]);
        }
        restaurantName = @"Kontrabas";
        dateOfVisit = [NSDate dateWithString:@"2015-08-10 19:35:00 +0300"];
        tips = [NSNumber numberWithDouble:15.0];
        innerDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects:restaurantName,dateOfVisit, tips, nil]
                                                forKeys:[NSArray arrayWithObjects:@"Restaurant", @"Date", @"Tips", nil]];
        
        [xmlHelp writeInfo:innerDict toXML:plistPath];
        //[rootObj setObject:innerDict forKey:@"3"];
        //plist = [NSPropertyListSerialization dataFromPropertyList:(id)rootObj format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
        //if(plist)
       // {
        //    [plist writeToFile:plistPath atomically:YES];
        //}
       // else
       // {
        //    NSLog(error);
        //    [error release];
        //}
        
    }
    return 0;
}
