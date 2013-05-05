//
//  TMQueryStringParameter.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 5/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMQueryStringParameter.h"

@interface TMQueryStringParameter ()

- (NSString *)encodedString:(NSString *)string;

@end

@implementation TMQueryStringParameter

- (id)initWithName:(NSString *)name value:(id)value {
    
    if ( (self = [super init]) ) {
        
        _name = name;
        _value = value;
    }
    
    return self;
}

- (NSString *)urlPair {

    return [NSString stringWithFormat:@"%@=%@", self.name, [self encodedString:self.value]];
}

- (NSString *)debugDescription {
    
    return [NSString stringWithFormat:@"QueryStringParameter [%@] [%@]", self.name, self.value];
}

#pragma mark - TMQueryStringParameter ()

- (NSString *)encodedString:(id)value {
    
    if (![value isKindOfClass:[NSString class]]) {
        return [NSString stringWithFormat:@"%@", value];
    }
    
    NSString *escapedString;
    escapedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
        NULL,
        (__bridge CFStringRef)value,
        NULL,
        (__bridge CFStringRef)@" +=!*'();:@&$,/?%#[]",
        kCFStringEncodingUTF8)
    );
    
    return escapedString;
}

@end
