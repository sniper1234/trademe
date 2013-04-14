//
//  TMCategoryService.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 13/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMBaseService.h"

@class RKResponseDescriptor;

typedef void (^CategoriesResult)(NSArray *categories);
typedef void (^ErrorResult)(NSError *error);

@interface TMCategoryService : TMBaseService

/*
 * Retrieves the categories for root number.
 *
 * @param number The category number of the root of the returned tree.
 * @param success The success callback.
 * @param failure The failure callback
 */
- (void)getCategoriesForNumber:(NSString *)number success:(CategoriesResult)success failure:(ErrorResult)failure;

/*
 * Retrieves the categories for root number.
 *
 * @param number The category number of the root of the returned tree.
 * @param depth The depth of the category tree to return. 0 = a single category. 1 = the specified category plus any subcategories. The default is to return all subcategories.
 * @param region The ID of the region used to filter listing counts. Only applicable if with_counts is true.
 * @param withCounts Indicates whether to include the number of listings in each category. Defaults to false.
 * @param success The success callback.
 * @param failure The failure callback
 */
- (void)getCategoriesForNumber:(NSString *)number
                         depth:(NSNumber *)depth
                        region:(NSNumber *)region
                    withCounts:(BOOL)withCounts
                       success:(CategoriesResult)success
                       failure:(ErrorResult)failure;

@end
