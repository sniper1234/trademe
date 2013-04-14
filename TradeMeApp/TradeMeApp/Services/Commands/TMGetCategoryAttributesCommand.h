//
//  TMGetCategoryAttributesCommand.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMCommandProtocol.h"

@interface TMGetCategoryAttributesCommand : NSObject <TMCommandProtocol>

@property (strong, nonatomic) NSString *category;

@end
