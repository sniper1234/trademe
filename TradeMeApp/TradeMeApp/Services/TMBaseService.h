//
//  TMBaseService.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 13/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@protocol TMCommandProtocol;

@interface TMBaseService : NSObject

/**
 * Make a request with the command
 *
 * @param command The command to process, e.g. get categories.
 * @param success The success callback.
 * @param failure The failure callback.
 */
- (void)makeRequestWithCommand:(id<TMCommandProtocol>)command
                       success:(void (^)(RKMappingResult *mappingResult))success
                       failure:(void (^)(NSError *error))failure;

@end
