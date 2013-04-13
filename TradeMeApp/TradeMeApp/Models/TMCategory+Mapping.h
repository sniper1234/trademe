//
//  TMCategory+Mapping.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 13/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMCategory.h"

@class RKMapping;

@interface TMCategory (Mapping)

+ (RKMapping *)mapping;

/**
 * Map the isRestricted object to isRestricted value type.
 */
@property (nonatomic) NSNumber *mapIsRestricted;

/**
 * Map the hasLegalNotice object to hasLegalNotice value type.
 */
@property (nonatomic) NSNumber *mapHasLegalNotice;

/**
 * Map the hasClassifieds object to hasClassifieds value type.
 */
@property (nonatomic) NSNumber *mapHasClassifieds;

@end
