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

@property (strong, nonatomic) NSArray *responseDescriptors;

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

    RKObjectRequestOperation *operation;
    operation = [[RKObjectRequestOperation alloc] initWithRequest:[self requestWithPath:path]
                                              responseDescriptors:self.responseDescriptors];
    
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        success(mappingResult.array);
    }
                                     failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                         failure(error);
                                     }];
    
    [operation start];
}

@end
