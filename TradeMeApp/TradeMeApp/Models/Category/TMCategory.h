//
//  TMCategory.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 13/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMCategory : NSObject

/**
 * A unique identifier for the category.
 */
@property (readonly) NSString *number;

/**
 * The name of the category.
 */
@property (readonly) NSString *name;

/**
 * The full URL path of this category e.g. “/Home-living/Beds-bedroom-furniture/Bedside-tables”.
 */
@property (readonly) NSString *path;

/**
 * The number of items for sale in this category.
 */
@property (readonly) NSNumber *count;

/**
 * Indicates whether the category is restricted to adults only (i.e. the category is R18).
 */
@property () BOOL isRestricted;

/**
 * Indicates whether the category has legal requirements. You should ask the user to accept the legal notice before listing in this category.
 * @remarks There is an API to get the text of the legal notice.
 */
@property () BOOL hasLegalNotice;

/**
 * Indicates whether classifieds are allowed in this category.
 */
@property () BOOL hasClassifieds;

/**
 * The list of subcategories belonging to this category.
 */
@property (readonly) NSMutableArray *subcategories;

@end
