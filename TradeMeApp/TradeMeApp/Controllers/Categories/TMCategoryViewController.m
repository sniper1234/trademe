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
        [self didSelectForListings:category];
    }
    else if (category.subcategories.count > 0) {
        [self didSelectForCategories:category];
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    
//    TMCategory *category = self.categories[indexPath.row];
}   

#pragma mark - TMCategoryViewController ()

- (void)didSelectForCategories:(TMCategory *)category {
    
    TMGetCategoriesCommand *command = [[TMGetCategoriesCommand alloc] init];
    command.number = category.number;
    
    __weak TMCategoryViewController *weakSelf = self;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    TMBaseService *service = [[TMBaseService alloc] init];
    [service makeRequestWithCommand:command
                            success:^(RKMappingResult *mappingResult) {
                                
                                TMCategory *category = mappingResult.firstObject;
                                
                                TMCategoryViewController *subCategoryViewController;
                                subCategoryViewController = [[TMCategoryViewController alloc] initWithNibName:@"TMCategoryViewController"
                                                                                                       bundle:nil];
                                subCategoryViewController.rootCategory = category;
                                
                                [weakSelf.navigationController pushViewController:subCategoryViewController animated:YES];
                                [MBProgressHUD hideHUDForView:self.view animated:YES];
                                
                            }
                            failure:^(NSError *error) {
                                
                                NSLog(@"%@", error.localizedDescription);
                                [MBProgressHUD hideHUDForView:self.view animated:YES];
                            }];
}

- (void)didSelectForListings:(TMCategory *)category {
    
    TMGetGeneralSearchCommand *command = [[TMGetGeneralSearchCommand alloc] init];
    command.category = category.number;
    
    __weak TMCategoryViewController *weakSelf = self;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    TMBaseService *service = [[TMBaseService alloc] init];
    [service makeRequestWithCommand:command
                            success:^(RKMappingResult *mappingResult) {
                                
                                TMListings *listings = mappingResult.firstObject;
                                TMListingsViewController *listingsViewController;
                                listingsViewController = [[TMListingsViewController alloc] init];
                                listingsViewController.listings = listings;
                                
                                [weakSelf.navigationController pushViewController:listingsViewController animated:YES];
                                [MBProgressHUD hideHUDForView:self.view animated:YES];
                            }
                            failure:^(NSError *error) {
                                
                                NSLog(@"%@", error.localizedDescription);
                                [MBProgressHUD hideHUDForView:self.view animated:YES];
                            }];
}

@end
