//
//  UIButton+LPButton.m
//  tapDemo
//
//  Created by klp on 2021/3/9.
//  Copyright © 2021 千亿少女的梦. All rights reserved.
//

#import "UIButton+LPButton.h"
#import <objc/runtime.h>

@implementation UIButton (LPButton)

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    //获取bounds 实际大小
    CGRect bounds = self.bounds;
    if (self.clickArea) {
        CGFloat area = self.clickArea;
        CGFloat widthDelta = MAX(area * bounds.size.width - bounds.size.width, 0);
        CGFloat heightDelta = MAX(area * bounds.size.height - bounds.size.height, 0);
        //扩大bounds
        bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    }
    //点击的点在新的bounds 中 就会返回YES
    return CGRectContainsPoint(bounds, point);
}


- (void)setClickArea:(CGFloat)clickArea{
    objc_setAssociatedObject(self, @selector(clickArea), @(clickArea), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (CGFloat)clickArea{
    return [objc_getAssociatedObject(self, @selector(clickArea)) integerValue];
}


@end
