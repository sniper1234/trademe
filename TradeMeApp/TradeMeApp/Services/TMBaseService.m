//
//  TMBaseService.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 13/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMBaseService.h"
#import <RestKit/RestKit.h>
#import "NSDictionary+UrlEncode.h"

@interface TMBaseService ()

@end

@implementation TMBaseService

- (id)init {
    
    if ( (self = [super init]) ) {
        
        self.statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful);
        
        RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    }
    
    return self;
}

- (NSURLRequest *)requestWithPath:(NSString *)path queryStringParameters:(NSDictionary *)queryStringParameters {
    
    static NSString *format = @"json";
    
    NSString *fullPath = [NSString stringWithFormat:@"http://api.tmsandbox.co.nz/%@.%@%@", path, format, [queryStringParameters toQueryStringParameters]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:fullPath]];
    
    return request;
}

- (void)makeRequestWithPath:(NSString *)path
      queryStringParameters:(NSDictionary *)queryStringParameters
                    success:(void (^)(RKMappingResult *mappingResult))success
                    failure:(void (^)(NSError *error))failure {
    
    RKObjectRequestOperation *operation;
    operation = [[RKObjectRequestOperation alloc] initWithRequest:[self requestWithPath:path queryStringParameters:queryStringParameters]
                                              responseDescriptors:self.responseDescriptors];
    
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        success(mappingResult);
    }
                                     failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                         failure(error);
                                     }];
    
    [operation start];
}

@end
