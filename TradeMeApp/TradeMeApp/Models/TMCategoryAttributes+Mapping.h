//
//  TMCategoryAttributes+Mapping.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMCategoryAttributes.h"

@class RKMapping;

@interface TMCategoryAttributes (Mapping)

/**
 * The RestKit mapping.
 */
+ (RKMapping *)mapping;

@end
