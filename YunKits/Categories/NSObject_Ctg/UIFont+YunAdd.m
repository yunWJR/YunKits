//
// Created by yun on 2017/9/8.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "UIFont+YunAdd.h"

@implementation UIFont (YunAdd)

+ (CGFloat)lineItvOfSize:(CGFloat)size {
    return size * 0.4f;
}

- (CGFloat)lineItv {
    return [UIFont lineItvOfSize:self.pointSize];
}

@end