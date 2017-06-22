//
// Created by yun on 2017/5/22.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "UITextView+YunAdd.h"

@implementation UITextView (YunAdd)

- (float)heightForString:(UITextView *)textView andWidth:(float)width {
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}

- (float)getCtnHeight {
    CGSize sizeToFit = [self sizeThatFits:CGSizeMake(sizeToFit.width, MAXFLOAT)];
    return sizeToFit.height;
}

@end