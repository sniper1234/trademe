//
//  TMGetCategoriesCommand.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMGetCategoriesCommand.h"
#import "TMCategory.h"
#import "TMCategory+Mapping.h"
#import "NSDictionary+UrlEncode.h"

@interface TMGetCategoriesCommand ()

- (void)addResponseDescriptors;

@end

@implementation TMGetCategoriesCommand

- (id)init {
    
    if ( (self = [super init]) ) {
        
        [self addResponseDescriptors];
    }
    
    return self;
}

- (NSURLRequest *)request {
    
    NSString *path;
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    if (self.number) {
        path = [NSString stringWithFormat:@"v1/Categories/%@", self.number];
    }
    else {
        path = @"v1/Categories";
    }
    
    if (self.depth) {
        [parameters setValue:self.depth forKey:@"depth"];
    }
    
    if (self.region) {
        [parameters setValue:self.region forKey:@"region"];
    }
    
    if (self.withCounts) {
        [parameters setValue:@"YES" forKey:@"with_count"];
    }

    NSString *fullPath = [NSString stringWithFormat:@"http://api.tmsandbox.co.nz/%@.%@%@", path, format, [parameters toQueryStringParameters]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:fullPath]];
    
    return request;
}

#pragma mark - TMGetCategoriesCommand

- (void)addResponseDescriptors {
    
    RKResponseDescriptor *responseDescriptorForCategory;
    responseDescriptorForCategory = [RKResponseDescriptor responseDescriptorWithMapping:[[TMCategory class] mapping]
                                                                            pathPattern:@"/v1/Categories/:categoryID.json"
                                                                                keyPath:@""
                                                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    RKResponseDescriptor *responseDescriptorForCategories;
    responseDescriptorForCategories = [RKResponseDescriptor responseDescriptorWithMapping:[[TMCategory class] mapping]
                                                                              pathPattern:@"/v1/Categories.json"
                                                                                  keyPath:@""
                                                                              statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    self.responseDescriptors = @[responseDescriptorForCategory, responseDescriptorForCategories];
}

@end
