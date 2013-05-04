//
//  TMListingsViewController.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 3/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMListings;

@interface TMListingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) TMListings *listings;

@end
