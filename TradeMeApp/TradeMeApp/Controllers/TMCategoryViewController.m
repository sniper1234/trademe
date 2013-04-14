//
//  TMCategoryViewController.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 14/04/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMCategoryViewController.h"
#import "TMCategoryService.h"
#import "TMCategory.h"

@interface TMCategoryViewController ()

@property (strong, nonatomic) TMCategoryService *categoryService;

@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;

@property (strong, nonatomic) NSArray *categories;

@end

@implementation TMCategoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ( (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) ) {
        // Custom initialization
        
        self.categoryService = [[TMCategoryService alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    __weak TMCategoryViewController *weakSelf = self;
    
    [self.categoryService getCategoriesForNumber:@"0001-"
                                           depth:@(1)
                                          region:@(-1)
                                      withCounts:YES
                                         success:^(NSArray *categories) {
                                             NSLog(@"%@", categories);
                                             weakSelf.categories = categories;
                                             [weakSelf.categoryTableView reloadData];
                                         }
                                         failure:^(NSError *error) {
                                             NSLog(@"%@", error.localizedDescription);
                                         }];
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
    
    cell.textLabel.text = subCategory.name;
    cell.detailTextLabel.text = subCategory.number;

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
