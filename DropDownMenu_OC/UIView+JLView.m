//
//  UIView+JLView.m
//  DropDownMenu_OC
//
//  Created by Jimmy on 2017/9/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "UIView+JLView.h"

@implementation UIView (JLView)

- (void) setOriginY:(CGFloat) newY {
    CGPoint origin = CGPointMake(self.frame.origin.x, newY);
    CGSize size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    [self setFrame:CGRectMake(origin.x, origin.y, size.width, size.height)];
}

@end
