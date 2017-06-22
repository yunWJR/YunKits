//
// Created by yun on 2017/5/22.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "UITextView+YunAdd.h"

@implementation UITextView (YunAdd)

/**
 @method 获取指定宽度width的字符串在UITextView上的高度
 @param textView 待计算的UITextView
 @param Width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
- (float)heightForString:(UITextView *)textView andWidth:(float)width {
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}

/**
 @method 获取指定宽度width的字符串在UITextView上的高度
 @param textView 待计算的UITextView
 @param Width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
- (float)getCtnHeight {
    CGSize sizeToFit = [self sizeThatFits:CGSizeMake(sizeToFit.width, MAXFLOAT)];
    return sizeToFit.height;
}

@end