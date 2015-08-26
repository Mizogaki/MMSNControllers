//
//  SwipeViewControllers.h
//  SwipeViewControllers
//
//  Created by Mizogaki Masahito on 11/11/14.
//  Copyright (c) 2014 Mizogaki Masahito. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SwipeViewControllersDelegate <NSObject>

@end

@interface SwipeViewControllers : UINavigationController <UIPageViewControllerDelegate,UIPageViewControllerDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *viewControllerArray;
@property (nonatomic, weak) id <SwipeViewControllersDelegate> swipDelegate;
@property (nonatomic, strong) UIPageViewController *pageController;
@property (nonatomic, strong) UIView *navigationView;
@property (nonatomic, strong) NSArray *buttonText;

@end
