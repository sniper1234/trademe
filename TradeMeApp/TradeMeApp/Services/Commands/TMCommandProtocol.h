//
//  TMCommandProtocol.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TMCommandProtocol <NSObject>

@property (strong, nonatomic) NSURLRequest *request;

@property (strong, nonatomic) NSArray *responseDescriptors;

@end
