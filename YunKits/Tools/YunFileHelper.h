//
// Created by yun on 2019-01-22.
// Copyright (c) 2019 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;

@interface YunFileHelper : NSObject

+ (instancetype)instance;

- (void)openFileByOtherApp:(NSURL *)fileUrl vc:(UIViewController *)vc;

@end