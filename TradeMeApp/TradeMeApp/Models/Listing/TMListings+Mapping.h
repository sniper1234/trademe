//
//  TMListings+Mapping.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 3/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMListings.h"

@class RKMapping;

@interface TMListings (Mapping)

/**
 * The RestKit mapping.
 */
+ (RKMapping *)mapping;

@end
