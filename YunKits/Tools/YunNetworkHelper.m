//
//  YunNetworkHelper.m
//  Report
//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunNetworkHelper.h"
#import "AFNetworkReachabilityManager.h"

@interface YunNetworkHelper () {
    BOOL _started;
}

@end

@implementation YunNetworkHelper

+ (instancetype)instance {
    static YunNetworkHelper *sharedInstance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];

        [sharedInstance startMonitor];
    });

    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)startMonitor {
    // 网络状态检测
    [[AFNetworkReachabilityManager sharedManager]
                                   setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
                                       _started = YES;

                                       if (_didStatusChanged) {
                                           _didStatusChanged(self.isNetworkAvailable);
                                       }

                                       [[NSNotificationCenter defaultCenter]
                                                              postNotificationName:NETWORK_STATUS_NOTI_STR
                                                                            object:nil
                                                                          userInfo:@{@"status" : @(self.isNetworkAvailable)}];
                                   }];

    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (void)isNetworkReachable:(void (^)(BOOL))result {
    if (result) {
        result(self.isNetworkAvailable);
    }
}

- (BOOL)isNetworkAvailable {
    return [AFNetworkReachabilityManager sharedManager].isReachable;
}

@end
