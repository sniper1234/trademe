//
//  TMLandingViewController.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 22/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMLandingViewController.h"
#import "TMCategoryViewController.h"
#import "TMGetCategoriesCommand.h"
#import "MBProgressHUD.h"
#import "TMBaseService.h"
#import "TMModels.h"

@interface TMLandingViewController ()

@end

@implementation TMLandingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)categoriesAction:(id)sender {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    __weak TMLandingViewController *weakSelf = self;
    
    TMBaseService *service = [[TMBaseService alloc] init];
    
    [service makeRequestWithCommand:[TMGetCategoriesCommand rootCategory]
                            success:^(RKMappingResult *mappingResult) {
                                
                                TMCategory *category = mappingResult.firstObject;

                                TMCategoryViewController *categoryViewController;
                                categoryViewController = [[TMCategoryViewController alloc] initWithNibName:@"TMCategoryViewController" bundle:nil];
                                categoryViewController.categories = category.subcategories;
                                
                                [self.navigationController pushViewController:categoryViewController animated:YES];
                                
                                [MBProgressHUD hideHUDForView:self.view animated:YES];
                            }
                            failure:^(NSError *error) {
                                [MBProgressHUD hideHUDForView:self.view animated:YES];
                            }];
}

@end
