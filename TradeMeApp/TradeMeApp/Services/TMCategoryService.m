//
//  TMCategoryService.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 13/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMCategoryService.h"
#import <RestKit/RestKit.h>
#import "TMCategory.h"
#import "TMCategory+Mapping.h"

@interface TMCategoryService ()

@end

@implementation TMCategoryService

- (id)init {
    
    if ( (self = [super init]) ) {
        
        RKResponseDescriptor *responseDescriptorForCategory;
        responseDescriptorForCategory = [RKResponseDescriptor responseDescriptorWithMapping:[[TMCategory class] mapping]
                                                                                pathPattern:@"/v1/Categories/:categoryID.json"
                                                                                    keyPath:@""
                                                                                statusCodes:self.statusCodes];
        
        RKResponseDescriptor *responseDescriptorForCategories;
        responseDescriptorForCategories = [RKResponseDescriptor responseDescriptorWithMapping:[[TMCategory class] mapping]
                                                                                  pathPattern:@"/v1/Categories.json"
                                                                                      keyPath:@""
                                                                                  statusCodes:self.statusCodes];
        
        self.responseDescriptors = @[responseDescriptorForCategory, responseDescriptorForCategories];
    }
    
    return self;
}

- (void)getCategoriesForNumber:(NSString *)number success:(CategoriesResult)success failure:(ErrorResult)failure {
    
    NSString *path;
    
    if (number) {
        path = [NSString stringWithFormat:@"v1/Categories/%@", number];
    }
    else {
        path = @"v1/Categories";
    }
    
    [self makeRequestWithPath:path
        queryStringParameters:nil
                      success:^(RKMappingResult *mappingResult) {
                          success(mappingResult.array);
                      }
                      failure:^(NSError *error) {
                          failure(error);
                      }];
}

- (void)getCategoriesForNumber:(NSString *)number
                         depth:(NSNumber *)depth
                        region:(NSNumber *)region
                    withCounts:(BOOL)withCounts
                       success:(CategoriesResult)success
                       failure:(ErrorResult)failure {
    
    NSString *path;
    NSString *queryString;
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    if (number) {
        path = [NSString stringWithFormat:@"v1/Categories/%@", number];
    }
    else {
        path = @"v1/Categories";
    }
    
    if (depth) {
        [parameters setValue:depth forKey:@"depth"];
    }
    
    if (region) {
        [parameters setValue:region forKey:@"region"];
    }
    
    if (withCounts) {
        [parameters setValue:@"YES" forKey:@"with_count"];
    }
    
    [self makeRequestWithPath:path
        queryStringParameters:parameters
                      success:^(RKMappingResult *mappingResult) {
                          success(mappingResult.array);
                      }
                      failure:^(NSError *error) {
                          failure(error);
                      }];
}

@end
