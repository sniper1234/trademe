//
//  TMQueryStringParameter.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 5/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMQueryStringParameter : NSObject

/**
 * @param name Name of the query string.
 * @param value Value of the query string.
 */
- (id)initWithName:(NSString *)name value:(id)value;

/**
 * The name of the query string parameter.
 */
@property (strong, nonatomic) NSString *name;

/**
 * The value of the query string parameter.
 */
@property (strong, nonatomic) id value;

/**
 * Return the paramater as pair for a URL.
 */
@property (readonly) NSString *pair;

@end
