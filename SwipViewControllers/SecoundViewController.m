//
//  SecoundViewController.m
//  SwipViewControllers
//
//  Created by voice on 8/26/15.
//  Copyright (c) 2015 Masahito Mizogaki. All rights reserved.
//

#import "SecoundViewController.h"
#import "SecoundTableViewController.h"

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
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.978 green:1.000 blue:0.976 alpha:1.000]];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = @[
                        (__bridge id)[[UIColor colorWithWhite:0.867 alpha:1.000] CGColor],
                        (__bridge id)[[UIColor colorWithRed:0.955 green:0.967 blue:1.000 alpha:0.970] CGColor],
                        (__bridge id)[[UIColor whiteColor] CGColor],
                        (__bridge id)[[UIColor colorWithRed:0.955 green:0.967 blue:1.000 alpha:0.970] CGColor],
                        (__bridge id)[[UIColor colorWithWhite:0.668 alpha:1.000] CGColor]
                        ];
    [self.view.layer insertSublayer: gradient atIndex: 0];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
}


- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarnin {
    
    [super didReceiveMemoryWarning];
}

- (IBAction)rootBackButton:(id)sender {
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)pushButton:(id)sender {
    
    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([SecoundViewController class])] animated:YES];
}
- (IBAction)backButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
