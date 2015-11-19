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

#import "AppDelegate.h"
#import "SwipeNavigationControllers.h"
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
    SwipeNavigationControllers *navigationController = [[SwipeNavigationControllers alloc] initWithRootViewController:pageController];
    
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
