//
//  TMLandingViewController.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 22/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMLandingViewController.h"
#import "TMCategoryViewController.h"
#import "TMListingsViewController.h"
#import "TMCommands.h"
#import "MBProgressHUD.h"
#import "TMBaseService.h"
#import "TMModels.h"

@interface TMLandingViewController ()

@property (strong, nonatomic) MBProgressHUD *hud;

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

- (void)search;
- (IBAction)searchAction:(id)sender;

- (void)browseCategories;
- (IBAction)browseCategoriesAction:(id)sender;

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
    
    self.title = @"Home";
    
    self.hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:self.hud];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TMLandingViewController ()

- (IBAction)browseCategoriesAction:(id)sender {
    
    dispatch_queue_t backgroundQueue = dispatch_queue_create("trademeapp.background_queue", NULL);
    dispatch_async(backgroundQueue, ^{
        [self browseCategories];
    });
}

- (void)browseCategories {

    self.hud.labelText = @"Loading...";
    [self.hud show:YES];
    
    __weak TMLandingViewController *weakSelf = self;
    
    TMBaseService *service = [[TMBaseService alloc] init];
    
    [service makeRequestWithCommand:[TMGetCategoriesCommand rootCategory]
                            success:^(RKMappingResult *mappingResult) {
                                
                                TMCategory *category = mappingResult.firstObject;
                                
                                TMCategoryViewController *categoryViewController;
                                categoryViewController = [[TMCategoryViewController alloc] initWithNibName:@"TMCategoryViewController" bundle:nil];
                                categoryViewController.rootCategory = category;
                                
                                [weakSelf.navigationController pushViewController:categoryViewController
                                                                         animated:YES];
                                
                                [self.hud hide:YES afterDelay:0.6];
                            }
                            failure:^(NSError *error) {
                                [self.hud hide:YES afterDelay:0.6];
                            }];
}

- (IBAction)searchAction:(id)sender {
    
    dispatch_queue_t backgroundQueue = dispatch_queue_create("trademeapp.background_queue", NULL);
    dispatch_async(backgroundQueue, ^{
        [self resignFirstResponder];
        [self search];
    });
}

- (void)search {

    self.hud.labelText = @"Loading...";
    [self.hud show:YES];
    
    __weak TMLandingViewController *weakSelf = self;
    
    TMBaseService *service = [[TMBaseService alloc] init];
    
    TMGetGeneralSearchCommand *command = [[TMGetGeneralSearchCommand alloc] init];
    command.category = @"0193-0463-0194-";
    command.searchString = self.searchTextField.text;
    
    [service makeRequestWithCommand:command
                            success:^(RKMappingResult *mappingResult) {
                                
                                TMListings *listings = mappingResult.firstObject;
                                TMListingsViewController *listingsViewController;
                                listingsViewController = [[TMListingsViewController alloc] init];
                                listingsViewController.listings = listings;
                                
                                [weakSelf.navigationController pushViewController:listingsViewController animated:YES];
                                [self.hud hide:YES afterDelay:0.6];
                            }
                            failure:^(NSError *error) {
                                [self.hud hide:YES afterDelay:0.6];
                            }];
}

@end
