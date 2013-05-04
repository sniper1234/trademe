//
//  TMStyles.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 4/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMStyles.h"

@implementation TMStyles

- (void)awakeFromNib {
    
    for (UILabel *label in listingTitleStyle) {
        label.font = [UIFont fontWithName:@"Helvetica-Neue" size:10];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
    }
}

@end
