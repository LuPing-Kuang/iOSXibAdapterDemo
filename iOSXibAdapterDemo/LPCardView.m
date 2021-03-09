//
//  LPCardView.m
//  tapDemo
//
//  Created by klp on 2021/3/5.
//  Copyright © 2021 千亿少女的梦. All rights reserved.
//

#import "LPCardView.h"

@implementation LPCardView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpXibFileView];
//        [self setUpGradientLayerWithStartColor:[UIColor orangeColor] endColor:[UIColor redColor] startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
    }
    return self;
}


- (IBAction)onBtnClick:(UIButton *)sender {
    NSLog(@"Hello kugou");
}




@end
