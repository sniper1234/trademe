//
//  TMGetCategoriesCommand.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMCommandProtocol.h"

@interface TMGetCategoriesCommand : NSObject <TMCommandProtocol>

/**
 * The category number of the root of the returned tree.
 */
@property (strong, nonatomic) NSString *number;

/**
 * The depth of the category tree to return. 0 = a single category. 1 = the specified category plus any subcategories. The default is to return all subcategories.
 */
@property (strong, nonatomic) NSNumber *depth;

/**
 * The ID of the region used to filter listing counts. Only applicable if with_counts is true.
 */
@property (strong, nonatomic) NSNumber *region;

/**
 * Indicates whether to include the number of listings in each category. Defaults to false.
 */
@property (nonatomic) BOOL withCounts;

/**
 * Get the motors category.
 */
+ (TMGetCategoriesCommand *)motorsCategory;

/**
 * Get the motorbikes category.
 */
+ (TMGetCategoriesCommand *)motorbikesCategory;

@end
