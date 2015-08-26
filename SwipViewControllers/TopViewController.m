//
//  TopViewController.h
//  SwipeViewControllers
//
//  Created by Mizogaki Masahito on 11/11/14.
//  Copyright (c) 2014 Mizogaki Masahito. All rights reserved.
//

#import "TopViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TopViewController ()

@end

@implementation TopViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.978 green:1.000 blue:0.976 alpha:1.000]];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = @[
                        (id)[[UIColor colorWithRed:0.955 green:0.967 blue:1.000 alpha:0.970] CGColor],
                        (id)[[UIColor colorWithRed:0.955 green:0.967 blue:1.000 alpha:0.970] CGColor],
                        (id)[[UIColor colorWithWhite:0.400 alpha:1.000] CGColor]
                        ];
    [self.view.layer insertSublayer: gradient atIndex: 0];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}



@end
