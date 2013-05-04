//
//  TMCategory+ViewModel.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMCategory+ViewModel.h"

@implementation TMCategory (ViewModel)

- (NSString *)displayTitle {
    
    if (self.count) {
        return [NSString stringWithFormat:@"%@ (%@)", self.name, self.count];
    }
    else {
        return self.name;
    }
}

@end
