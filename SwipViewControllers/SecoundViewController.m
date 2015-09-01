//
//  SecoundViewController.m
//  SwipViewControllers
//
//  Created by voice on 8/26/15.
//  Copyright (c) 2015 Masahito Mizogaki. All rights reserved.
//

#import "SecoundViewController.h"
#import "SecoundTableViewController.h"
#import "IndexEntity.h"

@interface SecoundViewController ()

@property (nonatomic, assign) BOOL headerFlag;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

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
    
    self.countLabel.text = [NSString stringWithFormat:@"%d",[IndexEntity getViewIndex]];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
}


- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    if (self.headerFlag == YES) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }else {
        [self.navigationController setNavigationBarHidden:NO animated:NO];
    }
}

- (void)didReceiveMemoryWarnin {
    
    [super didReceiveMemoryWarning];
}

- (IBAction)rootBackButton:(id)sender {
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [IndexEntity intWithViewIndex];
    self.headerFlag = NO;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)pushButton:(id)sender {
    
    [IndexEntity setViewIndex:+1];
    NSLog(@"%d",[IndexEntity getViewIndex]);
    self.headerFlag = YES;
    [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([SecoundViewController class])] animated:YES];
}

- (IBAction)backButton:(id)sender {
    
    if ([IndexEntity getViewIndex] == 0) {
        [IndexEntity intWithViewIndex];
        self.headerFlag = NO;
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }else{
        
        [IndexEntity setViewIndex:-1];
        self.headerFlag = YES;
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
