//
//  TransparentToolbar.m
//  SwipViewControllers
//
//  Created by voice on 8/26/15.
//  Copyright (c) 2015 Masahito Mizogaki. All rights reserved.
//

#import "TransparentToolbar.h"

@implementation TransparentToolbar




- (void)applyTranslucentBackground
{
    self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;
    self.translucent = YES;
}

- (id) init
{
    self = [super init];
    [self applyTranslucentBackground];
    return self;
}

@end
