//
//  TMListings.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 3/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMListings : NSObject

/**
 * The total number of results in the collection. Can be larger than the number of returned results.
 */
@property (strong, nonatomic) NSNumber *totalCount;

/**
 * The index of the current page of results (starts at 1).
 */
@property (strong, nonatomic) NSNumber *page;

/**
 * The number of results in the current page.
 */
@property (strong, nonatomic) NSNumber *pageSize;

/**
 * A list of the results in the current page.
 */
@property (strong, nonatomic) NSArray *list;

@end
