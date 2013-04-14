//
//  TMCategoryAttributes+Mapping.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMCategoryAttributes+Mapping.h"
#import <RestKit/RestKit.h>

@implementation TMCategoryAttributes (Mapping)

+ (RKMapping *)mapping {
    
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[TMCategoryAttributes class]];
    
    [mapping addAttributeMappingsFromDictionary:@{
     @"Name": @"name",
     @"DisplayName": @"displayName"
     }];
    
    return mapping;
}

@end
