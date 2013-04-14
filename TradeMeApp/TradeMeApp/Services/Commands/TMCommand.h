//
//  TMCommand.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import "TMCommandProtocol.h"

static NSString *format = @"json";

@interface TMCommand : NSObject <TMCommandProtocol>

@property (strong, nonatomic) NSString *path;

@property (strong, nonatomic) NSArray *responseDescriptors;

@property (strong, nonatomic) NSURLRequest *request;

@end
