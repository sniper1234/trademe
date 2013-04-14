//
//  TMCategory+Mapping.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 13/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMCategory+Mapping.h"
#import <RestKit/RestKit.h>

@implementation TMCategory (Mapping)

+ (RKMapping *)mapping {
    
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[TMCategory class]];
    
    [mapping addAttributeMappingsFromDictionary:@{
        @"Number": @"number",
        @"Name": @"name",
        @"Path": @"path",
        @"Count": @"count",
        @"isRestricted": @"mapIsRestricted",
        @"hasLegalNotice": @"mapHasLegalNotice",
        @"hasClassifieds": @"mapHasClassifieds"
     }];
    
    RKRelationshipMapping *subCategoriesMapping = [RKRelationshipMapping relationshipMappingFromKeyPath:@"Subcategories"
                                                                                              toKeyPath:@"subcategories"
                                                                                            withMapping:mapping];
    [mapping addPropertyMapping:subCategoriesMapping];
    
    return mapping;
}

- (NSNumber *)mapHasLegalNotice {
    
    return @(self.hasLegalNotice);
}

- (NSNumber *)mapHasClassifieds {
    
    return @(self.hasClassifieds);
}

- (NSNumber *)mapIsRestricted {
    
    return @(self.isRestricted);
}

- (void)setMapIsRestricted:(NSNumber *)mapIsRestricted {
    
    self.isRestricted = mapIsRestricted.boolValue;
}

- (void)setMapHasClassifieds:(NSNumber *)mapHasClassifieds {
    
    self.hasClassifieds = mapHasClassifieds.boolValue;
}

- (void)setMapHasLegalNotice:(NSNumber *)mapHasLegalNotice {
    
    self.hasLegalNotice = mapHasLegalNotice.boolValue;
}

@end
