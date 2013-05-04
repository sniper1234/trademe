//
//  TMListing+Mapping.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 3/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMListing+Mapping.h"
#import <RestKit/RestKit.h>

@implementation TMListing (Mapping)

+ (RKMapping *)mapping {
    
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[TMListing class]];
    
    [mapping addAttributeMappingsFromDictionary:@{
     @"ListingId": @"listingId",
     @"Title": @"title"
     }];
    
    return mapping;
}

@end
