//
//  SwipeViewControllers.m
//  SwipeViewControllers
//
//  Created by Mizogaki Masahito on 11/11/14.
//  Copyright (c) 2014 Mizogaki Masahito. All rights reserved.
//

#import "SwipeViewControllers.h"


static const CGFloat X_BUFFER = 0.0;
static const CGFloat Y_BUFFER = 15.0;
static const CGFloat HEIGHT = 45.0;
static const CGFloat X_OFFSET = 8.0;

@interface SwipeViewControllers ()

@property (nonatomic) UIScrollView *pageScrollView;
@property (nonatomic) NSInteger currentPageIndex;
@property (nonatomic) BOOL isPageScrollingFlag;
@property (nonatomic) BOOL hasAppearedFlag;

@property (nonatomic,strong) UIButton *firstButton;
@property (nonatomic,strong) UIButton *secoundButton;
@property (nonatomic,strong) UIButton *thirdButton;
@property (nonatomic,strong) UIButton *fourButton;

@end

@implementation SwipeViewControllers

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationBar.barTintColor = [UIColor colorWithRed:0.333 green:0.765 blue:0.706 alpha:1.000];
    self.navigationBar.translucent = NO;
    self.viewControllerArray = [[NSMutableArray alloc]init];
    self.currentPageIndex = 0;
    self.isPageScrollingFlag = NO;
    self.hasAppearedFlag = NO;
}

-(void)viewWillAppear:(BOOL)animated {
    
    if (!self.hasAppearedFlag) {
        
        [self setupPageViewController];
        [self setupSegmentButtons];
        self.hasAppearedFlag = YES;
    }
}

#pragma mark Customizables

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


-(void)setupSegmentButtons {
    self.navigationView = [[UIView alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.navigationBar.frame.size.height)];
    
    NSInteger numControllers = [self.viewControllerArray count];
    
    if (!self.buttonText) {
        self.buttonText = [[NSArray alloc]initWithObjects: @"Top",@"Second",@"Third",@"Fourth",nil];
    }
    
    for (int i = 0; i<numControllers; i++) {
        switch (i) {
            case 0:
                self.firstButton = [[UIButton alloc]initWithFrame:CGRectMake(X_BUFFER+i*(self.view.frame.size.width-2*X_BUFFER)/numControllers-X_OFFSET, Y_BUFFER, (self.view.frame.size.width-2*X_BUFFER)/numControllers, HEIGHT)];
                [self.navigationView addSubview:self.firstButton];
                self.firstButton.tag = i;
                self.firstButton.exclusiveTouch = YES;
                [self.firstButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
                [self.firstButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                self.firstButton.backgroundColor = [UIColor colorWithRed:0.333 green:0.765 blue:0.706 alpha:1.000];
                [self.firstButton addTarget:self action:@selector(tapSegmentButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                [self.firstButton setTitle:[self.buttonText objectAtIndex:i] forState:UIControlStateNormal];
                break;
            case 1:
                self.secoundButton = [[UIButton alloc]initWithFrame:CGRectMake(X_BUFFER+i*(self.view.frame.size.width-2*X_BUFFER)/numControllers-X_OFFSET, Y_BUFFER, (self.view.frame.size.width-2*X_BUFFER)/numControllers, HEIGHT)];
                [self.navigationView addSubview:self.secoundButton];
                self.secoundButton.tag = i;
                self.secoundButton.exclusiveTouch = YES;
                [self.secoundButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
                [self.secoundButton setTitleColor:[UIColor colorWithRed:0.110 green:0.224 blue:0.212 alpha:1.000] forState:UIControlStateNormal];
                self.secoundButton.backgroundColor = [UIColor colorWithRed:0.333 green:0.765 blue:0.706 alpha:1.000];
                [self.secoundButton addTarget:self action:@selector(tapSegmentButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                [self.secoundButton setTitle:[self.buttonText objectAtIndex:i] forState:UIControlStateNormal];
                break;
            case 2:
                self.thirdButton = [[UIButton alloc]initWithFrame:CGRectMake(X_BUFFER+i*(self.view.frame.size.width-2*X_BUFFER)/numControllers-X_OFFSET, Y_BUFFER, (self.view.frame.size.width-2*X_BUFFER)/numControllers, HEIGHT)];
                [self.navigationView addSubview:self.thirdButton];
                self.thirdButton.tag = i;
                self.thirdButton.exclusiveTouch = YES;
                [self.thirdButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
                [self.thirdButton setTitleColor:[UIColor colorWithRed:0.110 green:0.224 blue:0.212 alpha:1.000] forState:UIControlStateNormal];
                self.thirdButton.backgroundColor = [UIColor colorWithRed:0.333 green:0.765 blue:0.706 alpha:1.000];
                [self.thirdButton addTarget:self action:@selector(tapSegmentButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                [self.thirdButton setTitle:[self.buttonText objectAtIndex:i] forState:UIControlStateNormal];
                break;
            case 3:
                self.fourButton = [[UIButton alloc]initWithFrame:CGRectMake(X_BUFFER+i*(self.view.frame.size.width-2*X_BUFFER)/numControllers-X_OFFSET, Y_BUFFER, (self.view.frame.size.width-2*X_BUFFER)/numControllers, HEIGHT)];
                [self.navigationView addSubview:self.fourButton];
                self.fourButton.tag = i;
                self.fourButton.exclusiveTouch = YES;
                [self.fourButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
                [self.fourButton setTitleColor:[UIColor colorWithRed:0.110 green:0.224 blue:0.212 alpha:1.000] forState:UIControlStateNormal];
                self.fourButton.backgroundColor = [UIColor colorWithRed:0.333 green:0.765 blue:0.706 alpha:1.000];
                [self.fourButton addTarget:self action:@selector(tapSegmentButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                [self.fourButton setTitle:[self.buttonText objectAtIndex:i] forState:UIControlStateNormal];
                break;
        }
    }
    self.pageController.navigationController.navigationBar.topItem.titleView = self.navigationView;
}




#pragma mark Setup

-(void)setupPageViewController {
    
    self.pageController = (UIPageViewController*)self.topViewController;
    self.pageController.delegate = self;
    self.pageController.dataSource = self;
    [self.pageController setViewControllers:@[[self.viewControllerArray objectAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [self syncScrollView];
}


-(void)syncScrollView {
    
    for (UIView* view in self.pageController.view.subviews){
        
        if([view isKindOfClass:[UIScrollView class]]) {
            self.pageScrollView = (UIScrollView *)view;
            self.pageScrollView.delegate = self;
        }
    }
}

#pragma mark Movement

-(void)tapSegmentButtonAction:(UIButton *)button {
    
    [self changeButton:button.tag];
    
    if (!self.isPageScrollingFlag) {
        
        NSInteger tempIndex = self.currentPageIndex;
        
        __weak typeof(self) weakSelf = self;
        if (button.tag > tempIndex) {
            
            for (int i = (int)tempIndex+1; i<=button.tag; i++) {
                [self.pageController setViewControllers:@[[self.viewControllerArray objectAtIndex:i]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL complete) {
                    if (complete) {
                        [weakSelf updateCurrentPageIndex:i];
                    }
                }];
            }
        }else if (button.tag < tempIndex) {
            for (int i = (int)tempIndex-1; i >= button.tag; i--) {
                [self.pageController setViewControllers:@[[self.viewControllerArray objectAtIndex:i]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:^(BOOL complete) {
                    if (complete) {
                        [weakSelf updateCurrentPageIndex:i];
                    }
                }];
            }
        }
    }
}


-(void)updateCurrentPageIndex:(int)newPageIndex {
    self.currentPageIndex = newPageIndex;
}

- (void)changeButton:(NSInteger)index {
 
    switch (index) {
        case 0:
            [self.firstButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.fourButton setTitleColor:[UIColor colorWithRed:0.110 green:0.224 blue:0.212 alpha:1.000] forState:UIControlStateNormal];
            [self.secoundButton setTitleColor:[UIColor colorWithRed:0.110 green:0.224 blue:0.212 alpha:1.000] forState:UIControlStateNormal];
            [self.thirdButton setTitleColor:[UIColor colorWithRed:0.110 green:0.224 blue:0.212 alpha:1.000] forState:UIControlStateNormal];
            break;
        case 1:
            [self.secoundButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.firstButton setTitleColor:[UIColor colorWithRed:0.110 green:0.224 blue:0.212 alpha:1.000] forState:UIControlStateNormal];
            [self.thirdButton setTitleColor:[UIColor colorWithRed:0.110 green:0.224 blue:0.212 alpha:1.000] forState:UIControlStateNormal];
            [self.fourButton setTitleColor:[UIColor colorWithRed:0.110 green:0.224 blue:0.212 alpha:1.000] forState:UIControlStateNormal];
            break;
        case 2:
            [self.thirdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.firstButton setTitleColor:[UIColor colorWithRed:0.110 green:0.224 blue:0.212 alpha:1.000] forState:UIControlStateNormal];
            [self.secoundButton setTitleColor:[UIColor colorWithRed:0.110 green:0.224 blue:0.212 alpha:1.000] forState:UIControlStateNormal];
            [self.fourButton setTitleColor:[UIColor colorWithRed:0.110 green:0.224 blue:0.212 alpha:1.000] forState:UIControlStateNormal];
            break;
        case 3:
            [self.fourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.firstButton setTitleColor:[UIColor colorWithRed:0.110 green:0.224 blue:0.212 alpha:1.000] forState:UIControlStateNormal];
            [self.secoundButton setTitleColor:[UIColor colorWithRed:0.110 green:0.224 blue:0.212 alpha:1.000] forState:UIControlStateNormal];
            [self.thirdButton setTitleColor:[UIColor colorWithRed:0.110 green:0.224 blue:0.212 alpha:1.000] forState:UIControlStateNormal];
            break;
    }
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self changeButton:self.currentPageIndex];
}


#pragma mark UIPageViewController Delegate Functions

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [self.viewControllerArray indexOfObject:viewController];
    
    if ((index == NSNotFound) || (index == 0)) {
        return nil;
    }
    index--;
    return [self.viewControllerArray objectAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = [self.viewControllerArray indexOfObject:viewController];
    
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    
    if (index == [self.viewControllerArray count]) {
        return nil;
    }
    return [self.viewControllerArray objectAtIndex:index];
}

-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    
    if (completed) {
        self.currentPageIndex = [self.viewControllerArray indexOfObject:[pageViewController.viewControllers lastObject]];
    }
}

#pragma mark - Scroll View Delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.isPageScrollingFlag = YES;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.isPageScrollingFlag = NO;
}

@end
