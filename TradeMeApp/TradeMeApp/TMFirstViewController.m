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
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.categoryService = [[TMCategoryService alloc] init];
    
    [self.categoryService getCategoriesForNumber:nil
                                         success:^(NSArray *categories) {
                                             NSLog(@"%@", categories);
                                         }
                                         failure:^(NSError *error) {
                                             NSLog(@"%@", error);
                                         }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
