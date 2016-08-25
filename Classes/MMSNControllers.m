/*
 * SwipeViewController
 *
 * Created by MMizogaki on 10/2/15.
 * Copyright (c) 2015 MMizogaki . All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

#import "MMSNControllers.h"


#define Background_Color   [UIColor colorWithRed:0.333 green:0.765 blue:0.706 alpha:1.000]
#define Button_Title_Color [UIColor colorWithRed:0.110 green:0.224 blue:0.212 alpha:1.000]

@interface MMSNControllers ()

@property (nonatomic, strong) UIScrollView *pageScrollView;
@property (nonatomic, assign) NSInteger currentPageIndex;
@property (nonatomic, assign) BOOL isPageScrollingFlag;
@property (nonatomic, assign) BOOL hasAppearedFlag;

@property (nonatomic, strong) UIButton *firstButton;
@property (nonatomic, strong) UIButton *secoundButton;
@property (nonatomic, strong) UIButton *thirdButton;
@property (nonatomic, strong) UIButton *fourButton;

@end

@implementation MMSNControllers

static const CGFloat HEIGHT = 65.0;
static const CGFloat X_OFFSET = 12.0;
static const NSInteger FONT_SIZE = 19;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationBar.barTintColor = Background_Color;
    self.navigationBar.translucent = NO;
    self.viewControllerArray = [[NSMutableArray alloc]init];
    self.currentPageIndex = 0;
    self.isPageScrollingFlag = NO;
    self.hasAppearedFlag = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    
    if (!self.hasAppearedFlag) {
        
        [self setupPageViewController];
        [self setupSegmentButtons];
        self.hasAppearedFlag = YES;
    }
}

#pragma mark Customizables

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


- (void)setupSegmentButtons {
    
    self.navigationView = [[UIView alloc]initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,self.navigationBar.bounds.size.height)];
    
    NSInteger numControllers = [self.viewControllerArray count];
    
    if (!self.buttonText) {
        self.buttonText = [[NSArray alloc]initWithObjects: @"Top",@"Secound",@"Third",@"Forth",nil];
    }
    
    for (int i = 0; i<numControllers; i++) {
        switch (i) {
            case 0:
                self.firstButton = [[UIButton alloc]initWithFrame:CGRectMake(i*(self.view.frame.size.width)/numControllers-X_OFFSET,0,self.view.frame.size.width/numControllers, HEIGHT)];
                self.firstButton.tag = i;
                self.firstButton.exclusiveTouch = YES;
                [self.firstButton.titleLabel setFont:[UIFont systemFontOfSize:FONT_SIZE]];
                [self.firstButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [self.firstButton setBackgroundColor:Background_Color];
                [self.firstButton addTarget:self action:@selector(tapSegmentButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                [self.firstButton setTitle:[self.buttonText objectAtIndex:i] forState:UIControlStateNormal];
                [self.navigationView addSubview:self.firstButton];
                break;
            case 1:
                self.secoundButton = [[UIButton alloc]initWithFrame:CGRectMake(i*(self.view.frame.size.width)/numControllers-X_OFFSET,0,self.view.frame.size.width/numControllers, HEIGHT)];
                self.secoundButton.tag = i;
                self.secoundButton.exclusiveTouch = YES;
                [self.secoundButton.titleLabel setFont:[UIFont systemFontOfSize:FONT_SIZE]];
                [self.secoundButton setTitleColor:Button_Title_Color forState:UIControlStateNormal];
                [self.secoundButton setBackgroundColor:Background_Color];
                [self.secoundButton addTarget:self action:@selector(tapSegmentButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                [self.secoundButton setTitle:[self.buttonText objectAtIndex:i] forState:UIControlStateNormal];
                [self.navigationView addSubview:self.secoundButton];
                break;
            case 2:
                self.thirdButton = [[UIButton alloc]initWithFrame:CGRectMake(i*(self.view.frame.size.width)/numControllers-X_OFFSET,0,self.view.frame.size.width/numControllers, HEIGHT)];
                self.thirdButton.tag = i;
                self.thirdButton.exclusiveTouch = YES;
                [self.thirdButton.titleLabel setFont:[UIFont systemFontOfSize:FONT_SIZE]];
                [self.thirdButton setTitleColor:Button_Title_Color forState:UIControlStateNormal];
                [self.thirdButton setBackgroundColor:Background_Color];
                [self.thirdButton addTarget:self action:@selector(tapSegmentButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                [self.thirdButton setTitle:[self.buttonText objectAtIndex:i] forState:UIControlStateNormal];
                [self.navigationView addSubview:self.thirdButton];
                break;
            case 3:
                self.fourButton = [[UIButton alloc]initWithFrame:CGRectMake(i*(self.view.frame.size.width)/numControllers-X_OFFSET,0,self.view.frame.size.width/numControllers, HEIGHT)];
                [self.navigationView addSubview:self.fourButton];
                self.fourButton.tag = i;
                self.fourButton.exclusiveTouch = YES;
                [self.fourButton.titleLabel setFont:[UIFont systemFontOfSize:FONT_SIZE]];
                [self.fourButton setTitleColor:Button_Title_Color forState:UIControlStateNormal];
                [self.fourButton setBackgroundColor:Background_Color];
                [self.fourButton addTarget:self action:@selector(tapSegmentButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                [self.fourButton setTitle:[self.buttonText objectAtIndex:i] forState:UIControlStateNormal];
                [self.navigationView addSubview:self.fourButton];
                break;
        }
    }
    self.pageController.navigationController.navigationBar.topItem.titleView = self.navigationView;
}




#pragma mark Setup

- (void)setupPageViewController {
    
    self.pageController = (UIPageViewController*)self.topViewController;
    self.pageController.delegate = self;
    self.pageController.dataSource = self;
    [self.pageController setViewControllers:@[[self.viewControllerArray objectAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [self syncScrollView];
}


- (void)syncScrollView {
    
    for (UIView* view in self.pageController.view.subviews){
        
        if([view isKindOfClass:[UIScrollView class]]) {
            self.pageScrollView = (UIScrollView *)view;
            self.pageScrollView.delegate = self;
        }
    }
}

#pragma mark Movement

- (void)tapSegmentButtonAction:(UIButton *)button {
    
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


- (void)updateCurrentPageIndex:(int)newPageIndex {
    self.currentPageIndex = newPageIndex;
}

- (void)changeButton:(NSInteger)index {
    
    switch (index) {
        case 0:
            [self.firstButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.fourButton setTitleColor:Button_Title_Color forState:UIControlStateNormal];
            [self.secoundButton setTitleColor:Button_Title_Color forState:UIControlStateNormal];
            [self.thirdButton setTitleColor:Button_Title_Color forState:UIControlStateNormal];
            break;
        case 1:
            [self.secoundButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.firstButton setTitleColor:Button_Title_Color forState:UIControlStateNormal];
            [self.thirdButton setTitleColor:Button_Title_Color forState:UIControlStateNormal];
            [self.fourButton setTitleColor:Button_Title_Color forState:UIControlStateNormal];
            break;
        case 2:
            [self.thirdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.firstButton setTitleColor:Button_Title_Color forState:UIControlStateNormal];
            [self.secoundButton setTitleColor:Button_Title_Color forState:UIControlStateNormal];
            [self.fourButton setTitleColor:Button_Title_Color forState:UIControlStateNormal];
            break;
        case 3:
            [self.fourButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.firstButton setTitleColor:Button_Title_Color forState:UIControlStateNormal];
            [self.secoundButton setTitleColor:Button_Title_Color forState:UIControlStateNormal];
            [self.thirdButton setTitleColor:Button_Title_Color forState:UIControlStateNormal];
            break;
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
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

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    
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
