//
// Created by yun on 2019-01-22.
// Copyright (c) 2019 yun. All rights reserved.
//

#import "YunViewHelper.h"
#import "YunConfig.h"
#import "UIColor+YunAdd.h"

@interface YunViewHelper () {
}

@end

@implementation YunViewHelper

+ (void)setRandomBgColor:(UIView *)view {
    if (!YunConfig.instance.isDebugMode) {
        return;
    }

    view.backgroundColor = UIColor.randomColor;
}

@end