//
//  TMListings+Mapping.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 3/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMListings+Mapping.h"
#import "TMListing+Mapping.h"
#import <RestKit/RestKit.h>

@implementation TMListings (Mapping)

+ (RKMapping *)mapping {
    
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[TMListings class]];
    
    [mapping addAttributeMappingsFromDictionary:@{
        @"TotalCount": @"totalCount",
        @"Page": @"page",
        @"PageSize": @"pageSize"
    }];
    
    RKRelationshipMapping *listMapping;
    listMapping = [RKRelationshipMapping relationshipMappingFromKeyPath:@"List"
                                                              toKeyPath:@"list"
                                                            withMapping:[TMListing mapping]];
    [mapping addPropertyMapping:listMapping];
    
    return mapping;
}

@end
