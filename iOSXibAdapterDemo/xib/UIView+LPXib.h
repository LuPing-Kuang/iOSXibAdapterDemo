//
//  UIView+LPXib.h
//  tapDemo
//
//  Created by klp on 2021/3/5.
//  Copyright © 2021 千亿少女的梦. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LPXib)

- (void)setUpXibFileView;
- (void)setUpGradientLayerWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

///圆角
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
///边框宽度
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
///边框颜色
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

///阴影颜色
@property (nonatomic, strong) IBInspectable UIColor *shadowColor;
///阴影半径 默认1
@property (nonatomic, assign) IBInspectable CGFloat shadowRadius;
///阴影透明度 默认1
@property (nonatomic, assign) IBInspectable CGFloat shadowOpacity;
///阴影偏移
@property (nonatomic, assign) IBInspectable CGSize shadowOffset;

@end

NS_ASSUME_NONNULL_END
