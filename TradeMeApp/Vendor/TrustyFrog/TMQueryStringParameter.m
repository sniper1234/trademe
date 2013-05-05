//
//  TMQueryStringParameter.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 5/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMQueryStringParameter.h"

@implementation TMQueryStringParameter

- (id)initWithName:(NSString *)name value:(id)value {
    
    if ( (self = [super init]) ) {
        
        _name = name;
        _value = value;
    }
    
    return self;
}

- (NSString *)urlPair {

    return [NSString stringWithFormat:@"%@=%@", self.name, self.value]; // TODO URL encode.
}

- (NSString *)debugDescription {
    
    return [NSString stringWithFormat:@"QueryStringParameter [%@] [%@]", self.name, self.value];
}

@end
