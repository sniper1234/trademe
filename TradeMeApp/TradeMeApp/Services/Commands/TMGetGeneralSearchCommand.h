//
//  TMGetGeneralSearchCommand.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 3/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMCommandProtocol.h"

@interface TMGetGeneralSearchCommand : NSObject <TMCommandProtocol>

/**
 * Specifies the category in which you want to perform the search.
 */
@property (strong, nonatomic) NSString *category;

/**
 * One or more keywords to use in a search query.
 */
@property (strong, nonatomic) NSString *searchString;

@end
