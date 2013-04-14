//
//  TMBaseService.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 13/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface TMBaseService : NSObject

/**
 * Successful status codes.
 */
@property (strong, nonatomic) NSIndexSet *statusCodes;

/**
 * Response descriptors.
 */
@property (strong, nonatomic) NSArray *responseDescriptors;

- (NSURLRequest *)requestWithPath:(NSString *)path queryStringParameters:(NSDictionary *)queryStringParameters;

- (void)makeRequestWithPath:(NSString *)path
      queryStringParameters:(NSDictionary *)queryStringParameters
                    success:(void (^)(RKMappingResult *mappingResult))success
                    failure:(void (^)(NSError *error))failure;

@end
