//
//  SecoundViewController.m
//  SwipViewControllers
//
//  Created by voice on 8/26/15.
//  Copyright (c) 2015 Masahito Mizogaki. All rights reserved.
//

#import "SecoundViewController.h"

@interface SecoundViewController ()

@end

@implementation SecoundViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)didReceiveMemoryWarnin {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
