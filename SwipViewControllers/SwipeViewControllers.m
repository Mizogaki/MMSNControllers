//
//  SwipeViewControllers.m
//  SwipeViewControllers
//
//  Created by Mizogaki Masahito on 11/11/14.
//  Copyright (c) 2014 Mizogaki Masahito. All rights reserved.
//

#import "SwipeViewControllers.h"


static const CGFloat X_BUFFER = 0.0;
static const CGFloat Y_BUFFER = 14.0;
static const CGFloat HEIGHT = 30.0;
static const CGFloat BOUNCE_BUFFER = 10.0;
static const CGFloat ANIMATION_SPEED = 0.2;
static const CGFloat SELECTOR_Y_BUFFER = 40.0;
static const CGFloat SELECTOR_HEIGHT = 4.0;
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
@synthesize viewControllerArray;
@synthesize pageController;
@synthesize navigationView;
@synthesize buttonText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationBar.barTintColor = [UIColor colorWithRed:0.141 green:0.937 blue:0.678 alpha:1.000];
    self.navigationBar.translucent = NO;
    viewControllerArray = [[NSMutableArray alloc]init];
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
    navigationView = [[UIView alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.navigationBar.frame.size.height)];
    
    NSInteger numControllers = [viewControllerArray count];
    
    if (!buttonText) {
        buttonText = [[NSArray alloc]initWithObjects: @"TopVC",@"SecondVC",@"ThirdVC",@"FourthVC",nil];
    }
    
    for (int i = 0; i<numControllers; i++) {
        switch (i) {
            case 0:
                self.firstButton = [[UIButton alloc]initWithFrame:CGRectMake(X_BUFFER+i*(self.view.frame.size.width-2*X_BUFFER)/numControllers-X_OFFSET, Y_BUFFER, (self.view.frame.size.width-2*X_BUFFER)/numControllers, HEIGHT)];
                [navigationView addSubview:self.firstButton];
                self.firstButton.tag = i;
                [self.firstButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
                [self.firstButton setTitleColor:[UIColor colorWithWhite:0.795 alpha:1.000] forState:UIControlStateNormal];
                self.firstButton.backgroundColor = [UIColor colorWithRed:0.141 green:0.937 blue:0.678 alpha:1.000];
                [self.firstButton addTarget:self action:@selector(tapSegmentButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                [self.firstButton setTitle:[buttonText objectAtIndex:i] forState:UIControlStateNormal];
                break;
            case 1:
                self.secoundButton = [[UIButton alloc]initWithFrame:CGRectMake(X_BUFFER+i*(self.view.frame.size.width-2*X_BUFFER)/numControllers-X_OFFSET, Y_BUFFER, (self.view.frame.size.width-2*X_BUFFER)/numControllers, HEIGHT)];
                [navigationView addSubview:self.secoundButton];
                self.secoundButton.tag = i;
                [self.secoundButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
                self.secoundButton.backgroundColor = [UIColor colorWithRed:0.141 green:0.937 blue:0.678 alpha:1.000];
                [self.secoundButton addTarget:self action:@selector(tapSegmentButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                [self.secoundButton setTitle:[buttonText objectAtIndex:i] forState:UIControlStateNormal];
                break;
            case 2:
                self.thirdButton = [[UIButton alloc]initWithFrame:CGRectMake(X_BUFFER+i*(self.view.frame.size.width-2*X_BUFFER)/numControllers-X_OFFSET, Y_BUFFER, (self.view.frame.size.width-2*X_BUFFER)/numControllers, HEIGHT)];
                [navigationView addSubview:self.thirdButton];
                self.thirdButton.tag = i;
                [self.thirdButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
                self.thirdButton.backgroundColor = [UIColor colorWithRed:0.141 green:0.937 blue:0.678 alpha:1.000];
                [self.thirdButton addTarget:self action:@selector(tapSegmentButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                [self.thirdButton setTitle:[buttonText objectAtIndex:i] forState:UIControlStateNormal];
                break;
            case 3:
                self.fourButton = [[UIButton alloc]initWithFrame:CGRectMake(X_BUFFER+i*(self.view.frame.size.width-2*X_BUFFER)/numControllers-X_OFFSET, Y_BUFFER, (self.view.frame.size.width-2*X_BUFFER)/numControllers, HEIGHT)];
                [navigationView addSubview:self.fourButton];
                self.fourButton.tag = i;
                [self.fourButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
                self.fourButton.backgroundColor = [UIColor colorWithRed:0.141 green:0.937 blue:0.678 alpha:1.000];
                [self.fourButton addTarget:self action:@selector(tapSegmentButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                [self.fourButton setTitle:[buttonText objectAtIndex:i] forState:UIControlStateNormal];
                break;
        }
    }
    pageController.navigationController.navigationBar.topItem.titleView = navigationView;
}




#pragma mark Setup

-(void)setupPageViewController {
    
    pageController = (UIPageViewController*)self.topViewController;
    pageController.delegate = self;
    pageController.dataSource = self;
    [pageController setViewControllers:@[[viewControllerArray objectAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [self syncScrollView];
}


-(void)syncScrollView {
    
    for (UIView* view in pageController.view.subviews){
        
        if([view isKindOfClass:[UIScrollView class]]) {
            self.pageScrollView = (UIScrollView *)view;
            self.pageScrollView.delegate = self;
        }
    }
}

#pragma mark Movement

-(void)tapSegmentButtonAction:(UIButton *)button {
    
    switch (button.tag) {
        case 0:
            [self.firstButton setTitleColor:[UIColor colorWithWhite:0.795 alpha:1.000] forState:UIControlStateNormal];
            [self.fourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.secoundButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.thirdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case 1:
            [self.secoundButton setTitleColor:[UIColor colorWithWhite:0.795 alpha:1.000] forState:UIControlStateNormal];
            [self.firstButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.thirdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.fourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case 2:
            [self.thirdButton setTitleColor:[UIColor colorWithWhite:0.795 alpha:1.000] forState:UIControlStateNormal];
            [self.firstButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.secoundButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.fourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case 3:
            [self.fourButton setTitleColor:[UIColor colorWithWhite:0.795 alpha:1.000] forState:UIControlStateNormal];
            [self.firstButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.secoundButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.thirdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
    }
    if (!self.isPageScrollingFlag) {
        
        NSInteger tempIndex = self.currentPageIndex;
        
        __weak typeof(self) weakSelf = self;
        if (button.tag > tempIndex) {
            
            for (int i = (int)tempIndex+1; i<=button.tag; i++) {
                [pageController setViewControllers:@[[viewControllerArray objectAtIndex:i]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL complete){
                    if (complete) {
                        [weakSelf updateCurrentPageIndex:i];
                    }
                }];
            }
        }else if (button.tag < tempIndex) {
            for (int i = (int)tempIndex-1; i >= button.tag; i--) {
                [pageController setViewControllers:@[[viewControllerArray objectAtIndex:i]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:^(BOOL complete){
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


-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    switch (self.currentPageIndex) {
        case 0:
            [self.firstButton setTitleColor:[UIColor colorWithWhite:0.795 alpha:1.000] forState:UIControlStateNormal];
            [self.fourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.secoundButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.thirdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case 1:
            [self.secoundButton setTitleColor:[UIColor colorWithWhite:0.795 alpha:1.000] forState:UIControlStateNormal];
            [self.firstButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.thirdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.fourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case 2:
            [self.thirdButton setTitleColor:[UIColor colorWithWhite:0.795 alpha:1.000] forState:UIControlStateNormal];
            [self.firstButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.secoundButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.fourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case 3:
            [self.fourButton setTitleColor:[UIColor colorWithWhite:0.795 alpha:1.000] forState:UIControlStateNormal];
            [self.firstButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.secoundButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.thirdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
    }
}


#pragma mark UIPageViewController Delegate Functions

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [viewControllerArray indexOfObject:viewController];
    
    if ((index == NSNotFound) || (index == 0)) {
        return nil;
    }
    index--;
    return [viewControllerArray objectAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = [viewControllerArray indexOfObject:viewController];
    
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    
    if (index == [viewControllerArray count]) {
        return nil;
    }
    return [viewControllerArray objectAtIndex:index];
}

-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    
    if (completed) {
        self.currentPageIndex = [viewControllerArray indexOfObject:[pageViewController.viewControllers lastObject]];
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
