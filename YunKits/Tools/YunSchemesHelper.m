//
// Created by yun on 2019-01-22.
// Copyright (c) 2019 yun. All rights reserved.
//

#import "YunSchemesHelper.h"

@interface YunSchemesHelper () {
}

@end

@implementation YunSchemesHelper

+ (void)callWeChat {
    if ([self isWeChatInstalled]) {
        NSString *qqUrl = [NSString stringWithFormat:@"weixin://"];
        UIWebView *webview = [[UIWebView alloc] initWithFrame:CGRectZero];
        [[UIApplication sharedApplication].keyWindow addSubview:webview];
        NSURL *url = [NSURL URLWithString:
                                    qqUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [webview loadRequest:request];
    }
}

+ (BOOL)isWeChatInstalled {
    NSString *urlStr = [NSString stringWithFormat:@"weixin://"];
    NSURL *url = [NSURL URLWithString:urlStr];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        return YES;
    }
    else {
        return NO;
    }
}

@end