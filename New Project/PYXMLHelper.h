//
//  PYXMLHelper.h
//  FiveTips
//
//  Created by fpmi on 16.10.15.
//  Copyright (c) 2015 fpmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PYXMLHelper : NSObject
@property NSMutableDictionary* rootDictionary;
@property int size;
-(NSDictionary*) receiveInfoFromXML: (NSString*) path;
-(void)writeInfo:(NSDictionary*) dictionary toXML: (NSString*) path;
@end
