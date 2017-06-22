//
// Created by yun on 2017/6/5.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "UITabBar+YunAdd.h"

@implementation UITabBar (YunAdd)

- (void)setBarBgColor:(UIColor *)bgColor {
    [self setBackgroundImage:[self createImageWithColor:bgColor]];
}

- (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end