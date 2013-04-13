//
//  TMBaseService.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 13/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMBaseService : NSObject

/*
 * Successful status codes.
 */
@property (readonly, nonatomic) NSIndexSet *statusCodes;

- (NSURLRequest *)requestWithPath:(NSString *)path;

@end
