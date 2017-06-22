//
// Created by 王健 on 16/6/28.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunIdCardHelper : NSObject

+ (BOOL)isValidIdCard:(NSString *)idCard;

- (NSString *)getIdentityCardAge:(NSString *)numberStr;

@end