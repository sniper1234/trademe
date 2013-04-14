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

- (void)makeRequestWithCommand:(id<TMCommandProtocol>)command
                       success:(void (^)(RKMappingResult *mappingResult))success
                       failure:(void (^)(NSError *error))failure;

@end
