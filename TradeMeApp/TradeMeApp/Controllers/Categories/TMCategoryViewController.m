//
//  TMCategoryViewController.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMCategoryViewController.h"
#import "TMModels.h"
#import "TMCommands.h"
#import "TMBaseService.h"
#import "MBProgressHUD.h"
#import "TMListingsViewController.h"

@interface TMCategoryViewController ()

@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;

- (void)didSelectForCategories:(TMCategory *)category;
- (void)didSelectForListings:(TMCategory *)category;

@property (strong, nonatomic) MBProgressHUD *hud;

@end

@implementation TMCategoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    if ( (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) ) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = self.rootCategory.name;
    
    self.hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:self.hud];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.rootCategory.subcategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *const kCellIdentifier = @"TMCategoryCellIdentifier";
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier];
	}
    
    TMCategory *category = self.rootCategory.subcategories[indexPath.row];
    
    cell.textLabel.text = category.displayTitle;
    cell.detailTextLabel.text = category.number;
    
    if (category.subcategories.count == 0) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TMCategory *category = self.rootCategory.subcategories[indexPath.row];
    
    if (category.subcategories.count == 0) {
        dispatch_queue_t backgroundQueue = dispatch_queue_create("trademeapp.background_queue", NULL);
        dispatch_async(backgroundQueue, ^{
            [self didSelectForListings:category];
        });
    }
    else if (category.subcategories.count > 0) {
        [self didSelectForCategories:category];
    }
}

#pragma mark - TMCategoryViewController ()

- (void)didSelectForCategories:(TMCategory *)category {
    
    TMCategoryViewController *subCategoryViewController;
    subCategoryViewController = [[TMCategoryViewController alloc] initWithNibName:@"TMCategoryViewController"
                                                                           bundle:nil];
    subCategoryViewController.rootCategory = category;

    [self.navigationController pushViewController:subCategoryViewController
                                         animated:YES];
}

- (void)didSelectForListings:(TMCategory *)category {
    
    self.hud.labelText = @"Loading...";
    [self.hud show:YES];
    
    TMGetGeneralSearchCommand *command = [[TMGetGeneralSearchCommand alloc] init];
    command.category = category.number;
    
    __weak TMCategoryViewController *weakSelf = self;
    
    TMBaseService *service = [[TMBaseService alloc] init];
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
                                
                                NSLog(@"%@", error.localizedDescription);
                                [self.hud hide:YES afterDelay:0.6];
                            }];
}

@end
