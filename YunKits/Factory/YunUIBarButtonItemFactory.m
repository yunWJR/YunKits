//
// Created by 王健 on 16/9/18.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunUIBarButtonItemFactory.h"
#import "YunSizeHelper.h"
#import "YunUIImageViewFactory.h"
#import <Masonry/Masonry.h>

@implementation YunUIBarButtonItemFactory

+ (UIBarButtonItem *)itemWithFrame:(CGRect)btnFrame
                             image:(NSString *_Nullable)image
                         imgHeight:(CGFloat)imgH
                            target:(id _Nullable)target
                            action:(SEL _Nullable)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = btnFrame;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    UIImageView *icon = [YunUIImageViewFactory imgViewWithImgNameIconMode:image];
    [button addSubview:icon];

    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button);
        make.centerY.equalTo(button);
        make.height.equalTo(@(imgH));
        make.width.equalTo(@(imgH));
    }];

    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:button];

    return btnItem;
}

+ (UIBarButtonItem *)itemWithImage:(NSString *_Nullable)image
                         imgHeight:(CGFloat)imgHeight
                            target:(id _Nullable)target
                            action:(SEL _Nullable)action {
    CGRect btn = CGRectMake(0, 0, YunSizeHelper.navigationBarHeight, YunSizeHelper.navigationBarHeight);

    return [self itemWithFrame:btn image:image imgHeight:imgHeight target:target action:action];
}

@end