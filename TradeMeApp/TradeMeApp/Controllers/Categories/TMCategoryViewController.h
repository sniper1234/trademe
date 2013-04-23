//
//  TMCategoryViewController.h
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMCategory;

@interface TMCategoryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) TMCategory *rootCategory;

@end
