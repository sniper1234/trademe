//
//  NSDictionary+UrlEncode.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "NSDictionary+UrlEncode.h"

@implementation NSDictionary (UrlEncode)

- (NSString *)toQueryStringParameters {
    
    if (self.count == 0) {
        return @"";
    }
    
    NSMutableArray *components = [NSMutableArray array];
    
    for (id key in self) {
        NSString *component = [NSString stringWithFormat:@"%@=%@", key, [self valueForKey:key]]; // TODO URL encode.
        [components addObject:component];
    }
    
    return [NSString stringWithFormat:@"?%@", [components componentsJoinedByString:@"&"]];
}

@end
