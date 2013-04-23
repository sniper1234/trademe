//
//  TMCategoryViewController.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMCategoryViewController.h"
#import "TMModels.h"
#import "TMGetCategoriesCommand.h"
#import "TMGetCategoryAttributesCommand.h"
#import "TMBaseService.h"
#import "MBProgressHUD.h"
#import "TMCategory.h"

@interface TMCategoryViewController ()

@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;

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
        return;
    }
    
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

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    
//    TMCategory *category = self.categories[indexPath.row];
}

@end
