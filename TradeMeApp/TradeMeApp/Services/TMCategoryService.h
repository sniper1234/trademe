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
 * @param results The resusts of the request.
 */
- (void)getCategoriesForNumber:(NSString *)number success:(CategoriesResult)success failure:(ErrorResult)failure;

@end
