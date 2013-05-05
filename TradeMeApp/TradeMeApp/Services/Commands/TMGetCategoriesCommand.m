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
#import "TMQueryStringParameters.h"
#import <RestKit/RestKit.h>

static NSString *format = @"json";

@interface TMGetCategoriesCommand ()

@end

@implementation TMGetCategoriesCommand

- (id)init {
    if ( (self = [super init]) ) {
        _depth = @2;
    }
    
    return self;
}

+ (TMGetCategoriesCommand *)allCategories {
    
    TMGetCategoriesCommand *command = [[TMGetCategoriesCommand alloc] init];
    
    return command;
}

+ (TMGetCategoriesCommand *)rootCategory {
    
    TMGetCategoriesCommand *command = [[TMGetCategoriesCommand alloc] init];
    command.number = nil;
    command.depth = @0;
    
    return command;
}

+ (TMGetCategoriesCommand *)motorsCategory {
    
    TMGetCategoriesCommand *command = [[TMGetCategoriesCommand alloc] init];
    command.number = @"0001-";
    
    return command;
}

+ (TMGetCategoriesCommand *)motorbikesCategory {
    
    TMGetCategoriesCommand *command = [[TMGetCategoriesCommand alloc] init];
    command.number = @"0001-0026-1255-";
    
    return command;
}

+ (TMGetCategoriesCommand *)booksCategory {
    
    TMGetCategoriesCommand *command = [[TMGetCategoriesCommand alloc] init];
    command.number = @"0193-";
    command.withCounts = YES;
    
    return command;
}

#pragma mark - TMCommandProtocol

- (NSArray *)responseDescriptors {
    
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
    
    return @[responseDescriptorForCategory, responseDescriptorForCategories];
}

- (NSURLRequest *)requestForRootPath:(NSString *)rootPath {
    
    NSString *path;
    TMQueryStringParameters *params = [[TMQueryStringParameters alloc] init];
    
    if (self.number) {
        path = [NSString stringWithFormat:@"v1/Categories/%@", self.number];
    }
    else {
        path = @"v1/Categories";
    }
    
    if (self.depth) {
        [params addParameterWithName:@"depth" value:self.depth];
    }
    
    if (self.region) {
        [params addParameterWithName:@"region" value:self.region];
    }
    
    if (self.withCounts) {
        [params addParameterWithName:@"with_counts" value:@"true"];
    }
    
    NSString *fullPath = [NSString stringWithFormat:@"%@%@.%@%@", rootPath, path, format, params.urlPairs];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:fullPath]];
    
    return request;
}

@end
