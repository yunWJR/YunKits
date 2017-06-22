//
// Created by 王健 on 16/9/18.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunUILabelFactory.h"
#import "YunGlobalDefine.h"
#import "UILabel+Style.h"

@implementation YunUILabelFactory

+ (UILabel *)baseLabel {
    UILabel *lbl = [UILabel new];
    lbl.lineBreakMode = NSLineBreakByTruncatingTail;

    return lbl;
}

+ (UILabel *)labelWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color {
    return [self labelWithText:text font:font color:color align:NSTextAlignmentLeft lines:1 adjust:NO];
}

+ (UILabel *)labelWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color
                     align:(NSTextAlignment)align lines:(NSInteger)lines adjust:(BOOL)adjust {
    UILabel *lbl = [self baseLabel];
    [lbl setText:text font:font color:color];
    [lbl setAlign:align lines:lines adjust:adjust];

    return lbl;
}

+ (UILabel *)labelWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color
                     align:(NSTextAlignment)align lines:(NSInteger)lines adjust:(BOOL)adjust
                    radius:(CGFloat)radius width:(CGFloat)width borderColor:(UIColor *)borderColor {
    UILabel *lbl = [self labelWithText:text font:font color:color
                                 align:align lines:lines adjust:adjust];

    [lbl setLayerRadius:radius width:width color:borderColor];

    return lbl;
}

+ (UILabel *)labelWithIconName:(NSString *)iconName
                      fontSize:(CGFloat)fontSize
                     textColor:(UIColor *)color {
    UILabel *iconLbl = [UILabel new];
    iconLbl.font = [UIFont fontWithName:ICON_FONT_NAME size:fontSize];
    iconLbl.text = iconName;
    iconLbl.textColor = color;
    iconLbl.textAlignment = NSTextAlignmentCenter;
    iconLbl.numberOfLines = 1;
    iconLbl.adjustsFontSizeToFitWidth = YES;

    return iconLbl;
}

@end