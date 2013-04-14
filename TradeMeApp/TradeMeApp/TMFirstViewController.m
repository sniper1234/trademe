//
//  TMFirstViewController.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 13/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMFirstViewController.h"
#import <RestKit/RestKit.h>
#import "TMModels.h"
#import "TMServices.h"

@interface TMFirstViewController ()

@property (strong, nonatomic) TMCategoryService *categoryService;

@end

@implementation TMFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        self.categoryService = [[TMCategoryService alloc] init];
    }
    return self;
}
							
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.categoryService getCategoriesForNumber:@"0001-"
                                           depth:@(1)
                                          region:@(-1)
                                      withCounts:YES
                                         success:^(NSArray *categories) {
                                             NSLog(@"%@", categories);
                                         }
                                         failure:^(NSError *error) {
                                             NSLog(@"%@", error.localizedDescription);
                                         }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
