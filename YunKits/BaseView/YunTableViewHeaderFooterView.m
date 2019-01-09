//
// Created by yun on 2019-01-09.
// Copyright (c) 2019 yun. All rights reserved.
//

#import "YunTableViewHeaderFooterView.h"
#import "YunValueVerifier.h"

@interface YunTableViewHeaderFooterView () {
    CGFloat _allSideOff;
}

@end

@implementation YunTableViewHeaderFooterView

+ (instancetype)instance {
    static YunTableViewHeaderFooterView *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] initWithConfig];
        }
    }

    return _instance;
}

- (instancetype)initWithConfig {
    //self = [super init]; // 不需调用[super init];
    if (self) {
        _heightDic = [NSMutableDictionary new];
    }

    return self;
}

- (CGFloat)allOff {
    return _allSideOff;
}

- (void)setAllOff:(CGFloat)allOff {
    _allSideOff = allOff;

    _sideOff = _allSideOff;
    _topOff = _allSideOff;
    _leftOff = _allSideOff;
    _rightOff = _allSideOff;
    _bottomOff = _allSideOff;
    _ctnIntervalH = _allSideOff;
    _ctnIntervalV = _allSideOff;
}

- (void)setViewHeight:(NSString *)viewId height:(CGFloat)height {
    if ([YunValueVerifier isInvalidStr:viewId]) {return;}

    [_heightDic setValue:@(height) forKey:viewId];
}

- (CGFloat)getViewHeight:(NSString *)viewId {
    if ([YunValueVerifier isInvalidStr:viewId]) {return 0;}

    NSNumber *h = [_heightDic valueForKey:viewId];
    if (h != nil) {
        return h.floatValue;
    }

    return 0;
}

@end