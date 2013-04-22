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
    
    self.title = NSLocalizedString(@"Categories", @"Categories");
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
    
    TMCategory *category = self.categories[0];
    return category.subcategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *const kCellIdentifier = @"TMCategoryCellIdentifier";
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier];
	}
    
    TMCategory *category = self.categories[0];
    TMCategory *subCategory = category.subcategories[indexPath.row];
    
    cell.textLabel.text = subCategory.displayTitle;
    cell.detailTextLabel.text = subCategory.number;

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TMCategory *category = self.categories[0];
    TMCategory *subCategory = category.subcategories[indexPath.row];

    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    TMGetCategoriesCommand *command = [[TMGetCategoriesCommand alloc] init];
    command.number = subCategory.number;
    
    __weak TMCategoryViewController *weakSelf = self;
    
    TMBaseService *service = [[TMBaseService alloc] init];
    [service makeRequestWithCommand:command
                            success:^(RKMappingResult *mappingResult) {
                                
                                NSLog(@"%@", mappingResult.array[0]);
                                [MBProgressHUD hideHUDForView:self.view animated:YES];
                                TMCategoryViewController *subCategoryViewController;
                                subCategoryViewController = [[TMCategoryViewController alloc] initWithNibName:@"TMCategoryViewController"
                                                                                                       bundle:nil];
                                subCategoryViewController.categories = mappingResult.array; 
                                [weakSelf.navigationController pushViewController:subCategoryViewController animated:YES];
                            }
                            failure:^(NSError *error) {
                                
                                NSLog(@"%@", error.localizedDescription);
                                [MBProgressHUD hideHUDForView:self.view animated:YES];
                            }];
}

@end
