//
//  MainViewController.m
//  SwipeViewControllers
//
//  Created by Mizogaki Masahito on 11/11/14.
//  Copyright (c) 2014 Mizogaki Masahito. All rights reserved.

#import "AppDelegate.h"
#import "SwipeViewControllers.h"
#import "MainViewController.h"
#import "TopViewController.h"
#import "SecoundTableViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIPageViewController *pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                                           navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    SwipeViewControllers *navigationController = [[SwipeViewControllers alloc]initWithRootViewController:pageController];
    
    UIViewController *topVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([TopViewController class])];
    UIViewController *secoundVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([SecoundTableViewController class])];
    UIViewController *thirdVC= [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([ThirdViewController class])];
    UIViewController *fourthVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([FourthViewController class])];
    
    [navigationController.viewControllerArray addObjectsFromArray:@[topVC,secoundVC,thirdVC,fourthVC]];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.window.backgroundColor = [UIColor whiteColor];
    appDelegate.window.rootViewController = navigationController;
    
}

@end
;