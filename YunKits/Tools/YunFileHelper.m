//
// Created by yun on 2019-01-22.
// Copyright (c) 2019 yun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YunFileHelper.h"

@interface YunFileHelper () <UIDocumentInteractionControllerDelegate> {
}

@property (nonatomic, strong) UIDocumentInteractionController *docItCtr;

@end

@implementation YunFileHelper

+ (instancetype)instance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });

    return _sharedInstance;
}

- (void)openFileByOtherAppOfUrl:(NSString *)fileUrl vc:(UIViewController *)vc {
    NSURL *url = [NSURL fileURLWithPath:fileUrl];
    _docItCtr = [UIDocumentInteractionController interactionControllerWithURL:url];
    [_docItCtr setDelegate:self];

    [_docItCtr presentOpenInMenuFromRect:CGRectZero inView:vc.view animated:YES];
}

- (void)openFileByOtherApp:(NSURL *)url vc:(UIViewController *)vc {
    _docItCtr = [UIDocumentInteractionController interactionControllerWithURL:url];
    [_docItCtr setDelegate:self];

    [_docItCtr presentOpenInMenuFromRect:CGRectZero inView:vc.view animated:YES];
}

@end