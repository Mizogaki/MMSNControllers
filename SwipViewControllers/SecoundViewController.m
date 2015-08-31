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

- (id)initWithCoder:(NSCoder*)decoder
{
    self = [super initWithCoder:decoder];
    if (!self) {
        return nil;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)didReceiveMemoryWarnin {
    [super didReceiveMemoryWarning];
}

- (IBAction)backButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
