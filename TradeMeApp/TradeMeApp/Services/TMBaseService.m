//
//  TMBaseService.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 13/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMBaseService.h"
#import <RestKit/RestKit.h>
#import "TMCommandProtocol.h"

@interface TMBaseService ()

@property (strong, nonatomic) NSString *rootPath;

@end

@implementation TMBaseService

- (id)init {
    
    if ( (self = [super init]) ) {
        
        self.rootPath = @"http://api.tmsandbox.co.nz/";
        
        RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    }
    
    return self;
}

- (void)makeRequestWithCommand:(id<TMCommandProtocol>)command
                       success:(void (^)(RKMappingResult *mappingResult))success
                       failure:(void (^)(NSError *error))failure {
    
    RKObjectRequestOperation *operation;
    operation = [[RKObjectRequestOperation alloc] initWithRequest:[command requestForRootPath:self.rootPath]
                                              responseDescriptors:command.responseDescriptors];
    
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        success(mappingResult);
    }
                                     failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                         failure(error);
                                     }];
    
    [operation start];
}

@end
