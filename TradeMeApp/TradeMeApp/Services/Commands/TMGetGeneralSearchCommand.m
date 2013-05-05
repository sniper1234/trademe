//
//  TMGetGeneralSearchCommand.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 3/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMGetGeneralSearchCommand.h"
#import "TMListings.h"
#import "TMListings+Mapping.h"
#import "TMQueryStringParameters.h"
#import <RestKit/RestKit.h>

static NSString *format = @"json";

@implementation TMGetGeneralSearchCommand

- (id)init {
    
    if ( (self = [super init]) ) {
        
    }
    
    return self;
}

#pragma mark - TMCommandProtocol

- (NSArray *)responseDescriptors {
    
    RKResponseDescriptor *responseDescriptorForListings;
    responseDescriptorForListings = [RKResponseDescriptor responseDescriptorWithMapping:[TMListings mapping]
                                                                            pathPattern:@"/v1/Search/General.json"
                                                                                keyPath:@""
                                                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return @[responseDescriptorForListings];
}

- (NSURLRequest *)requestForRootPath:(NSString *)rootPath {
    
    NSString *path = @"v1/Search/General";
    TMQueryStringParameters *params = [[TMQueryStringParameters alloc] init];
    
    if (self.category) {
        [params addParameterWithName:@"category" value:self.category];
    }
    
    NSString *fullPath = [NSString stringWithFormat:@"%@%@.%@%@", rootPath, path, format, params.urlPairs];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:fullPath]];
    
    return request;
}

@end
