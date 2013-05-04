//
//  TMCategory.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 13/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMCategory.h"

@implementation TMCategory

- (id)init {
    
    if ( (self = [super init]) ) {
        _subcategories = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark - NSObject

- (NSString *)description {
    
    return [NSString stringWithFormat:@"%@ %@ Path:[%@]", self.number, self.name, self.path];
}

@end
