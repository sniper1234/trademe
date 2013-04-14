//
//  TMCommandProtocol.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TMCommandProtocol <NSObject>

@property (readonly, nonatomic) NSArray *responseDescriptors;

- (NSURLRequest *)requestForRootPath:(NSString *)rootPath;

@end
