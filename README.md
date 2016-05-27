
# MMSNControllers
[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-Objective–C-brightgreen.svg?style=flat
)](https://developer.apple.com/jp/documentation/)
[![Swift 2.2](https://img.shields.io/badge/Swift-2.2-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/MMSwitch.svg)](https://img.shields.io/cocoapods/v/MMSwitch.svg)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
            )](http://mit-license.org)


## App Image
![Alt Text](https://github.com/MMasahito/SwipViewControllers/blob/master/image.gif)  
 

## With CocoaPods
 Just add this line to your podfile.
 ```
 pod 'MMSNControllers', '1.0.0'
 ```
## Manual installation
 Swipe and Button transition menu.
 Super simple. Just drag & drop MMSNControllers.h/.m into your project.
 
## Usage
 The simplest way to get up and running with MMSNControllers is to display a default view. Inside of your view controller, write  the following code:
 
 ``` objective-c
 UIPageViewController *pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
 navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
 SwipeNavigationControllers *navigationController = [[SwipeNavigationControllers alloc] initWithRootViewController:pageController];
 
 UIViewController *YVC_1 = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([YouViewController_1 class])];
 UIViewController *YVC_2 = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([YouViewController_2 class])];
 UIViewController *YVC_3 = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([YouViewController_3 class])];
 UIViewController *YVC_4 = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([YouViewController_4 class])];
 
 [navigationController.viewControllerArray addObjectsFromArray:@[YVC_1,YVC_2,YVC_3,YVC_4]];
 AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
 appDelegate.window.backgroundColor = [UIColor whiteColor];
 appDelegate.window.rootViewController = navigationController;
 ``` 
 
 
## Memo
iOS7〜iOS8 correspondence.  
I support that until iPhone4 〜iPhone6Plus.  


## Licence

MIT
Created by MMizogaki on 10/2/15.
Copyright (c) 2015 MMizogaki . All rights reserved.
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
 
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


## Author

[MizogakiMasahito](https://github.com/MMizogaki)
