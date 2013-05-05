//
//  TMGetCategoriesCommandTests.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 5/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "TMCommands.h"

@interface TMCommandTests : SenTestCase

@end

@implementation TMCommandTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testMotorbikeCategoriesRequestPath {
    
    TMGetCategoriesCommand *command = [[TMGetCategoriesCommand alloc] init];
    command.number = @"0001-0026-1255-";
    command.withCounts = YES;
    command.depth = @2;
    command.region = @1;
    
    NSString *actualURL = [command requestForRootPath:@"https://api.tmsandbox.co.nz/"].URL.absoluteString;
    NSString *expectedURL = @"https://api.tmsandbox.co.nz/v1/Categories/0001-0026-1255-.json?depth=2&region=1&with_counts=true";
    
    STAssertTrue([expectedURL isEqualToString:actualURL], @"Expected URL does not match. Actual: %@", actualURL);
}

- (void)testGeneralSearchForMotorbikesRequestPath {
    
    TMGetGeneralSearchCommand *command = [[TMGetGeneralSearchCommand alloc] init];
    command.category = @"0001-0026-1255-";
    
    NSString *actualURL = [command requestForRootPath:@"https://api.tmsandbox.co.nz/"].URL.absoluteString;
    NSString *expectedURL = @"https://api.tmsandbox.co.nz/v1/Search/General.json?category=0001-0026-1255-";
    
    STAssertTrue([expectedURL isEqualToString:actualURL], @"Expected URL does not match. Actual: %@", actualURL);
}

- (void)testGeneralSearchForBixaInSciFiBooksRequestPath {
    
    TMGetGeneralSearchCommand *command = [[TMGetGeneralSearchCommand alloc] init];
    command.category = @"0193-0463-0194-";
    command.searchString = @"bixa product";
    
    NSString *actualURL = [command requestForRootPath:@"https://api.tmsandbox.co.nz/"].URL.absoluteString;
    NSString *expectedURL = @"https://api.tmsandbox.co.nz/v1/Search/General.json?category=0193-0463-0194-&search_string=bixa%20product";
    
    STAssertTrue([expectedURL isEqualToString:actualURL], @"Expected URL does not match. Actual: %@", actualURL);
}

@end
