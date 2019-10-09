//
// Created by yun on 16/9/18.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "UISearchBar+YunAdd.h"
#import "UIImage+YunAdd.h"

@implementation UISearchBar (YunAdd)

- (void)setIconByImgName:(NSString *)imgName {
    [self setImage:[UIImage imageNamed:imgName] forSearchBarIcon:UISearchBarIconSearch
             state:UIControlStateNormal];
}

- (void)setRadius:(CGFloat)rd bgColor:(UIColor *)bgColor {
    [self setRadius:rd bgColor:bgColor borderColor:nil borderWidth:0];
}

- (void)setRadius:(CGFloat)rd
          bgColor:(UIColor *)bgColor
      borderColor:(UIColor *)borderColor
      borderWidth:(CGFloat)borderWidth {
    UITextField *searchField = [self lz_GetSearchTextFiled];

    if (searchField) {
        [searchField setBackgroundColor:bgColor];
        searchField.layer.cornerRadius = rd;
        searchField.layer.borderColor = borderColor.CGColor;
        searchField.layer.borderWidth = borderWidth;
        searchField.layer.masksToBounds = YES;
    }
}

- (void)setBg:(UIColor *)color {
    [self setBg:color height:0];
}

- (void)setBg:(UIColor *)color height:(CGFloat)height {
    [self setBg:color height:height fieldImg:nil];
}

- (void)setBg:(UIColor *)color height:(CGFloat)height fieldImg:(NSString *)img {
    // 设置背景图片
    UIImage *bgImg = height <= 0 ?
                     [UIImage imgWithColor:color] :
                     [UIImage imgWithColor:color height:height];
    [self setBackgroundImage:bgImg];   //这里图片的颜色和导航栏一样

    // 设置背景图片
    [self setBackgroundColor:color];

    // 设置文本框背景
    if (img) {
        UIImage *fBg = [UIImage imageNamed:img];
        if (fBg) {
            [self setSearchFieldBackgroundImage:fBg forState:UIControlStateNormal];
        }
    }
}

- (UITextField *)lz_GetSearchTextFiled {
    if ([[[UIDevice currentDevice]systemVersion] floatValue] >= 13.0) {
        return self.searchTextField;
    } else {
        UITextField *searchTextField =  [self valueForKey:@"_searchField"];
        return searchTextField;
    }
}

- (UIButton *)lz_GetSearchCancleButton {
    UITextField * tf = [self lz_GetSearchTextFiled];
    UIButton * btn = [tf valueForKey:@"_clearButton"];
    return btn;
}

@end
