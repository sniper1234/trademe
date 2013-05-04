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

/**
 * The RestKit mapping.
 */
+ (RKMapping *)mapping;

/**
 * Map the isRestricted object to isRestricted value type.
 *
 * @remarks This is used to bridge the requirement that RestKit needs to map to an object.
 */
@property (nonatomic) NSNumber *mapIsRestricted;

/**
 * Map the hasLegalNotice object to hasLegalNotice value type.
 *
 * @remarks This is used to bridge the requirement that RestKit needs to map to an object.
 */
@property (nonatomic) NSNumber *mapHasLegalNotice;

/**
 * Map the hasClassifieds object to hasClassifieds value type.
 *
 * @remarks This is used to bridge the requirement that RestKit needs to map to an object.
 */
@property (nonatomic) NSNumber *mapHasClassifieds;

@end
