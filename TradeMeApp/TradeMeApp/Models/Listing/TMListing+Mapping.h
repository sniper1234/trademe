//
//  TMListing+Mapping.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 3/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMListing.h"

@class RKMapping;

@interface TMListing (Mapping)

/**
 * The RestKit mapping.
 */
+ (RKMapping *)mapping;

@end
