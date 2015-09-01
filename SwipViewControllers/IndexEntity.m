//
//  IndexEntity.m
//  SwipViewControllers
//
//  Created by voice on 9/1/15.
//  Copyright (c) 2015 Masahito Mizogaki. All rights reserved.
//

#import "IndexEntity.h"

@interface IndexEntity ()

@end

@implementation IndexEntity

int indexEntity;

+ (void)intWithViewIndex {

    indexEntity = 0;
}

+ (void)setViewIndex:(int)viewIndex {
    
   indexEntity = indexEntity + viewIndex;
}

+ (int)getViewIndex {
    
    return indexEntity;
}

@end
