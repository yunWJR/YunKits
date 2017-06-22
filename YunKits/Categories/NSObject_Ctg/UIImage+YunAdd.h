//
// Created by yun on 2017/5/17.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YunAdd)

+ (UIImage *)GetImageWithColor:(UIColor *)color andHeight:(CGFloat)height;

- (UIImage *)resizeWithHeight:(CGFloat)height;

- (UIImage *)resizeWithSize:(NSInteger)size;

@end