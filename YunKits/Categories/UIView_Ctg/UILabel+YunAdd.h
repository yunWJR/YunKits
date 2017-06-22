//
//  UILabel+YunAdd.h
//
//  Created by yun on 16/5/8.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UILabel (YunAdd)

+ (CGFloat)calHeightByWidth:(CGFloat)width text:(NSString *)text font:(UIFont *)font;

+ (CGFloat)calHeightOneLine:(UIFont *)font;

+ (CGFloat)calWidthWithText:(NSString *)text font:(UIFont *)font;

- (CGFloat)getTextHeightByWidth:(CGFloat)width;

- (CGFloat)getTextOneLineHeight;

- (CGFloat)getTextWidth;

- (CGFloat)getTextWidthWithWordCount:(NSInteger)count;

- (CGFloat)getTextOneWordWidth;

- (void)setText:(NSString *)text lineInner:(CGFloat)inner;

@end
