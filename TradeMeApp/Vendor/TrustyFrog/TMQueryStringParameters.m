//
//  TMQueryStringParameters.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 5/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMQueryStringParameters.h"
#import "TMQueryStringParameter.h"

@interface TMQueryStringParameters ()

@property (strong, nonatomic) NSMutableArray *parameters;

@end

@implementation TMQueryStringParameters

- (id)init {
    
    if ( (self = [super init]) ) {
        _parameters = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addParameter:(TMQueryStringParameter *)parameter {
    
    [self.parameters addObject:parameter];
}

- (void)addParameterWithName:(NSString *)name value:(id)value {
    
    TMQueryStringParameter *parameter = [[TMQueryStringParameter alloc] initWithName:name value:value];
    [self.parameters addObject:parameter];
}

- (NSString *)urlPairs {
    
    if (self.parameters.count == 0) {
        return @"";
    }
    
    return [NSString stringWithFormat:@"?%@", [[self.parameters valueForKeyPath:@"urlPair" ] componentsJoinedByString:@"&"]];
}

@end
