//
//  NSDictionary+UrlEncode.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (UrlEncode)

- (NSString *)toQueryStringParameters;

@end
