//
//  TMListingDetailsViewController.m
//  TradeMeApp
//
//  Created by Scott McKenzie on 5/05/13.
//  Copyright (c) 2013 TrustyFrog. All rights reserved.
//

#import "TMListingDetailsViewController.h"
#import "TMModels.h"

@interface TMListingDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)updateView;

@end

@implementation TMListingDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    if ( (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) ) {
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TMListingDetailsViewController ()

- (IBAction)dismissAction:(id)sender {
    
    [self dismissModalViewControllerAnimated:YES];
}

- (void)updateView {
    
    self.titleLabel.text = self.listing.title;
}

@end
