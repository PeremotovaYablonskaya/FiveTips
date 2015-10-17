//
//  PYXMLHelper.m
//  FiveTips
//
//  Created by fpmi on 16.10.15.
//  Copyright (c) 2015 fpmi. All rights reserved.
//

#import "PYXMLHelper.h"

@implementation PYXMLHelper

-(NSDictionary*) receiveInfoFromXML: (NSString*) path
{
    NSString *error;
    NSPropertyListFormat format;
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:path];
    NSDictionary *dictionary = (NSDictionary *)[NSPropertyListSerialization
                                          propertyListFromData:plistXML
                                          mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                          format:&format
                                          errorDescription:&error];
    if (!dictionary) {
	   for(int i = 0; i < [dictionary count]; i++)
	   {
		[self.rootDictionary setObject:dictionary forKey:[[NSString alloc] initWithFormat:@"%d", i]]; ]
	   }
	self.size = [dictionary count];
        return nil;
    }
    else
        return dictionary;
 
}
-(void)writeInfo:(NSDictionary*) dictionary toXML: (NSString*) path
{
    
    NSString *error;  
   [rootObj setObject:dictionary forKey:[[NSString alloc] initWithFormat:@"%d", self.size+1]];
    plist = [NSPropertyListSerialization dataFromPropertyList:(id)rootObj format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    if(plist)
    {
        [plist writeToFile:path atomically:YES];
    }
    else
    {
        NSLog(error);
        [error release];
    }
    
}

@end
