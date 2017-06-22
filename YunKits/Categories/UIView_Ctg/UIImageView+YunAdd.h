//
// Created by 王健 on 16/10/8.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (YunAdd)

- (void)setImageURLStr:(NSString *)imgStr;

- (void)setImageURLStr:(NSString *)imgStr placeholderImage:(UIImage *)placeholderImage;

- (void)setAvrImageURLStr:(NSString *)imgStr;

@end