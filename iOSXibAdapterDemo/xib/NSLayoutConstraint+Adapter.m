//
//  NSLayoutConstraint+Adapter.m
//  tapDemo
//
//  Created by klp on 2021/3/9.
//  Copyright © 2021 千亿少女的梦. All rights reserved.
//

#import "NSLayoutConstraint+Adapter.h"
#import <objc/runtime.h>

// 基准屏幕宽度
#define kRefereWidth 375.0
#define AdaptW(floatValue) (floatValue*[[UIScreen mainScreen] bounds].size.width / kRefereWidth)

@implementation NSLayoutConstraint (Adapter)

+ (void)load{
    NSArray *arr = @[@"awakeFromNib" ];
    for (NSString *str in arr) {
        NSString *new_str = [@"lp_" stringByAppendingString:str];
        
        SEL orignsel = NSSelectorFromString(str);
        SEL exchgesel = NSSelectorFromString(new_str);
        
        Method originalM = class_getInstanceMethod([self class], orignsel);
        Method exchangeM = class_getInstanceMethod([self class], exchgesel);
        
        BOOL didAddMethod = class_addMethod([self class], orignsel, method_getImplementation(exchangeM), method_getTypeEncoding(exchangeM));
        if (didAddMethod) {
            class_replaceMethod([self class], exchgesel, method_getImplementation(originalM), method_getTypeEncoding(originalM));
        } else {
            method_exchangeImplementations(originalM, exchangeM);
        }
    }
}


- (void)lp_awakeFromNib {
    [self lp_awakeFromNib];
    self.constant = AdaptW(self.constant);
}


@end
