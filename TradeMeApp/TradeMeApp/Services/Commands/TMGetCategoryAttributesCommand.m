//
//  TMGetCategoryAttributesCommand.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMGetCategoryAttributesCommand.h"
#import <RestKit/RestKit.h>
#import "TMCategoryAttributes.h"
#import "TMCategoryAttributes+Mapping.h"

static NSString *format = @"json";

@implementation TMGetCategoryAttributesCommand

#pragma mark - TMCommandProtocol

- (NSArray *)responseDescriptors {
    
    RKResponseDescriptor *responseDescriptorForCategory;
    responseDescriptorForCategory = [RKResponseDescriptor responseDescriptorWithMapping:[[TMCategoryAttributes class] mapping]
                                                                            pathPattern:@"/v1/Categories/:category/Attributes.json"
                                                                                keyPath:@""
                                                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return @[responseDescriptorForCategory];
}

- (NSURLRequest *)requestForRootPath:(NSString *)rootPath {
    
    NSString *path = [NSString stringWithFormat:@"v1/Categories/%@/Attributes", self.category];
    
    NSString *fullPath = [NSString stringWithFormat:@"%@%@.%@", rootPath, path, format];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:fullPath]];
    
    return request;
}

@end
