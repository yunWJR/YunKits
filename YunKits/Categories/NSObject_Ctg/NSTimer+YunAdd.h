//
// Created by yun on 2018/4/24.
// Copyright (c) 2018 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (YunAdd)

+ (NSTimer *)yun_timerWithInterval:(NSTimeInterval)interval
                             block:(void (^)())block
                           repeats:(BOOL)repeats;

@end