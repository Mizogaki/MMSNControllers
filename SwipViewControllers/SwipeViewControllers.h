//
//  SwipeViewControllers.h
//  SwipeViewControllers
//
//  Created by Mizogaki Masahito on 11/11/14.
//  Copyright (c) 2014 Mizogaki Masahito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeViewControllers : UINavigationController <UIPageViewControllerDelegate,UIPageViewControllerDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *viewControllerArray;
@property (nonatomic, strong) UIPageViewController *pageController;
@property (nonatomic, strong) UIView *navigationView;
@property (nonatomic, strong) NSArray *buttonText;

@property (nonatomic, strong) UIButton *firstButton;
@property (nonatomic, strong) UIButton *secoundButton;
@property (nonatomic, strong) UIButton *thirdButton;
@property (nonatomic, strong) UIButton *fourButton;

@end
