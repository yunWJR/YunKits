//
// Created by yun on 2019-01-18.
// Copyright (c) 2019 yun. All rights reserved.
//

#import "NSData+YunAdd.h"

@implementation NSData (YunAdd)

- (NSInteger)lengthKb {
    return self.length / 1024;
}

@end