//
//  TMGetCategoriesCommand.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMCommand.h"

@interface TMGetCategoriesCommand : TMCommand

@property (strong, nonatomic) NSString *number;

@property (strong, nonatomic) NSNumber *depth;

@property (strong, nonatomic) NSNumber *region;

@property (nonatomic) BOOL withCounts;

@end
