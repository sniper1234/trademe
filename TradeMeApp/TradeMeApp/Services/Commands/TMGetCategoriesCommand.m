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
#import <RestKit/RestKit.h>

static NSString *format = @"json";

@interface TMGetCategoriesCommand ()

@end

@implementation TMGetCategoriesCommand

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
        [parameters setValue:@"true" forKey:@"with_counts"];
    }
    
    NSString *fullPath = [NSString stringWithFormat:@"%@%@.%@%@", rootPath, path, format, [parameters toQueryStringParameters]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:fullPath]];
    
    return request;
}

@end
