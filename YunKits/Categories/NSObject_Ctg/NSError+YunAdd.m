//
//  NSError+YunAdd.m
//
//  Created by 王健 on 16/5/26.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSError+YunAdd.h"

@implementation NSError (YunAdd)

+ (instancetype)errorWithCustomMsg:(NSString *)errorMsg {
    return [self errorWithCustomMsg:errorMsg andErrorCode:-1];
}

+ (instancetype)errorWithCustomMsg:(NSString *)errorMsg andErrorCode:(NSInteger)errorCode {
    return [[NSError alloc] initWithDomain:@"request" code:errorCode userInfo:@{@"custom_error" : errorMsg}];
}

+ (instancetype)errorWithCustomErrorCode:(NSInteger)errorCode {
    return [[NSError alloc] initWithDomain:@"request" code:errorCode userInfo:@{@"custom_error" : @""}];
}

@end
