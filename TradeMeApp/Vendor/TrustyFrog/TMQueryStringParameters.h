//
//  TMQueryStringParameters.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 5/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TMQueryStringParameter;

@interface TMQueryStringParameters : NSObject

/**
 * Add a parameter to be included in the query string output
 */
- (void)addParameter:(TMQueryStringParameter *)parameter;

/**
 * Add a parameter name and value to be included in the query string output
 *
 * @param name Name of parameter
 * @param value Value of parameter
 */
- (void)addParameterWithName:(NSString *)name value:(id)value;

/**
 * Query string names and values for a URL.
 */
@property (readonly) NSString *urlPairs;

@end
