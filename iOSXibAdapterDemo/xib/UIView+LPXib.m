//
//  UIView+LPXib.m
//  tapDemo
//
//  Created by klp on 2021/3/5.
//  Copyright © 2021 千亿少女的梦. All rights reserved.
//

#import "UIView+LPXib.h"
#import <objc/runtime.h>

@interface UIView()
// 渐变Layer
@property(nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation UIView (LPXib)


@dynamic shadowOffset,shadowOpacity,shadowRadius,shadowColor;

- (void)setUpXibFileView {
    UIView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    view.frame = self.bounds;
    [self addSubview:view];
}

- (void)setUpGradientLayerWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    if (startColor && endColor && self.gradientLayer == nil) {
        self.gradientLayer = [CAGradientLayer layer];
        [self.layer addSublayer:self.gradientLayer];
        self.gradientLayer.frame = self.bounds;
        self.gradientLayer.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
        self.gradientLayer.startPoint = startPoint;
        self.gradientLayer.endPoint = endPoint;
        self.gradientLayer.cornerRadius = self.cornerRadius;
    }
}


- (void)setUpViewCircle {
    CGFloat min = MIN(self.frame.size.width, self.frame.size.height);
    self.layer.cornerRadius = min / 2;
}


// 渐变空视图，只在有圆角的时候使用
- (CAGradientLayer *)gradientLayer{
    return objc_getAssociatedObject(self, @selector(gradientLayer));
}

- (void)setGradientLayer:(CAGradientLayer *)gradientLayer{
    objc_setAssociatedObject(self, @selector(gradientLayer), gradientLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


/// 边框
- (CGFloat)cornerRadius {
    return [objc_getAssociatedObject(self, @selector(cornerRadius)) floatValue];
}


- (void)setCornerRadius:(CGFloat)cornerRadius {
    objc_setAssociatedObject(self, @selector(cornerRadius), @(cornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.layer.cornerRadius = cornerRadius;
    if (@available(iOS 11.0, *)) {
        self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMinXMaxYCorner | kCALayerMaxXMinYCorner | kCALayerMaxXMaxYCorner;
    } else {
        self.layer.masksToBounds = true;
    }
}


///边框颜色
- (UIColor *)borderColor {
    return objc_getAssociatedObject(self, @selector(borderColor));
}


- (void)setBorderColor:(UIColor *)borderColor {
    objc_setAssociatedObject(self, @selector(borderColor), borderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.layer.borderColor = borderColor.CGColor;
}


- (CGFloat)borderWidth {
    return [objc_getAssociatedObject(self, @selector(borderWidth)) floatValue];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    objc_setAssociatedObject(self, @selector(borderWidth), @(borderWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.layer.borderWidth = borderWidth;
}


- (UIColor *)shadowColor {
    return objc_getAssociatedObject(self, @selector(shadowColor));
}


- (void)setShadowColor:(UIColor *)shadowColor {
    objc_setAssociatedObject(self, @selector(shadowColor), shadowColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOpacity = 1;
}


- (void)setShadowRadius:(CGFloat)shadowRadius {
    self.layer.shadowRadius = shadowRadius;
}


- (void)setShadowOffset:(CGSize)shadowOffset {
    self.layer.shadowOffset = shadowOffset;
}


- (void)setShadowOpacity:(CGFloat)shadowOpacity {
    self.layer.shadowOpacity = shadowOpacity;
}


@end
