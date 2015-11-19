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
