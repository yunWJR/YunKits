//
// Created by yun on 2018/4/24.
// Copyright (c) 2018 yun. All rights reserved.
//

#import "NSTimer+YunAdd.h"

@implementation NSTimer (YunAdd)

+ (NSTimer *)yun_timerWithInterval:(NSTimeInterval)interval
                             block:(void (^)())block
                           repeats:(BOOL)repeats {
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(yun_blockInvoke:) userInfo:[block copy]
                                        repeats:repeats];
}

- (void)yun_blockInvoke:(NSTimer *)timer {
    void (^block)() = timer.userInfo;
    if (block) {
        block();
    }
}

@end