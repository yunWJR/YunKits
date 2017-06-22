//
// Created by 王健 on 2016/11/14.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunUIImageViewFactory.h"
#import "YunValueVerifier.h"
#import "UIView+YunAdd.h"
#import "YunGlobalDefine.h"

@implementation YunUIImageViewFactory

+ (UIImageView *)baseImgView {
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.contentMode = IMAGE_DEF_CTN_MODE; // 默认的显示模式
    imgView.clipsToBounds = YES;

    imgView.backgroundColor = [UIColor clearColor];

    return imgView;
}

+ (UIImageView *)imgViewWithImgName:(NSString *)imgName {
    UIImageView *imgView = [self baseImgView];

    if (![YunValueVerifier isNilOrEmptyStr:imgName]) {
        imgView.image = [UIImage imageNamed:imgName];
    }

    return imgView;
}

+ (UIImageView *)imgViewWithImgName:(NSString *)imgName
                             radius:(CGFloat)radius
                              width:(CGFloat)width
                        borderColor:(UIColor *)borderColor {
    UIImageView *imgView = [self imgViewWithImgName:imgName];

    [imgView setViewLayerRadius:radius width:width color:borderColor];

    return imgView;
}

@end