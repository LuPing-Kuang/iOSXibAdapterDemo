//
//  KKTool.m
//  FontChangeByRuntime
//
//  Created by kangzhiqiang on 2018/12/24.
//  Copyright © 2018 kangxx. All rights reserved.
//

#import "KKTool.h"

@implementation KKTool
+ (NSString *)fontName{
    return FONT_NAME_XIB;
}
//此处可以根据xib中设置的对应字体粗细判断替换对应粗细的字体
//由于当前字体只有Thin和Wide两种，所以不能一一匹配，所以就直接返回Thin的字体了
+ (NSString *)formatFontName:(NSString *)fontName{
    NSString *formatFontName;
    if ([fontName containsString:@"-Bold"]) {
        formatFontName = NSStringApp(FONT_NAME_XIB, @"-Bold");
    }else if ([fontName containsString:@"-Semibold"]) {
        formatFontName = NSStringApp(FONT_NAME_XIB, @"-Semibold");
    }else if ([fontName containsString:@"-Medium"]) {
        formatFontName = NSStringApp(FONT_NAME_XIB, @"-Medium");
    }else if ([fontName containsString:@"-Light"]) {
        formatFontName = NSStringApp(FONT_NAME_XIB, @"-Light");
    }else if ([fontName containsString:@"-Regular"]) {
        formatFontName = NSStringApp(FONT_NAME_XIB, @"-Regular");
    }
    if (formatFontName) {
        return formatFontName;
    } else {
        NSLog(@"字体为空:%@",fontName);
    }
    return NSStringApp(FONT_NAME_XIB, @"-Regular");
}
@end
