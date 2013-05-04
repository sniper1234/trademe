//
//  TMListingsViewController.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 3/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMListingsViewController.h"
#import "TMBaseService.h"
#import "TMGetGeneralSearchCommand.h"
#import "TMModels.h"
#import "MBProgressHUD.h"

@interface TMListingsViewController ()

@property (weak, nonatomic) IBOutlet UIView *tableHeaderView;
@property (weak, nonatomic) IBOutlet UITableView *listingTableView;
@property (weak, nonatomic) IBOutlet UILabel *totalCountLabel;

@end

@implementation TMListingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ( (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) ) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.listingTableView.tableHeaderView = self.tableHeaderView;
    self.totalCountLabel.text = [NSString stringWithFormat:@"%@ listings found", self.listings.totalCount];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.listings.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"listingCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    TMListing *listing = self.listings.list[indexPath.row];
    
    cell.textLabel.text = listing.title;
    
    return cell;
}

#pragma mark - UITableViewDelegate


@end
