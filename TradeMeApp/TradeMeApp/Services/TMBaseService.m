//
//  TMBaseService.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 13/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMBaseService.h"
#import <RestKit/RestKit.h>

@interface TMBaseService ()

@property (strong, nonatomic) NSIndexSet *statusCodes;

@end

@implementation TMBaseService

- (id)init {
    
    if ( (self = [super init]) ) {
        
        self.statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful);
    }
    
    return self;
}

- (NSURLRequest *)requestWithPath:(NSString *)path {
    
    NSString *fullPath = [NSString stringWithFormat:@"http://api.tmsandbox.co.nz/%@.json", path]; // TODO Move to config.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:fullPath]];
    
    return request;
}

@end
