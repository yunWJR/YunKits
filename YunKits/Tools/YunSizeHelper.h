//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YunSizeHelper : NSObject

+ (CGFloat)statusBarHeight;

+ (CGFloat)navigationBarHeight;

+ (CGFloat)statusAndNagBarHeight;

+ (CGFloat)tabBarHeight;

+ (CGFloat)screenWidth;

+ (CGFloat)screenHeight;

+ (CGFloat)widthOn320:(CGFloat)width;

+ (CGFloat)widthOnIPhone6:(CGFloat)width;

+ (CGFloat)heightOnIPhone6:(CGFloat)height;

+ (CGFloat)widthOn414:(CGFloat)width;

+ (CGFloat)heightOn736:(CGFloat)height;

+ (CGFloat)widthOnIPhone8Plus:(CGFloat)width;

+ (CGFloat)heightOnIPhone8Plus:(CGFloat)height;

+ (CGFloat)widthOn2x:(CGFloat)width;

+ (CGFloat)heightOn2x:(CGFloat)height;

+ (CGFloat)btmSafeOff;

+ (CGFloat)heightOn568:(CGFloat)height;

+ (CGFloat)widthOnIPhone5:(CGFloat)width;

+ (CGFloat)heightOnIPhone5:(CGFloat)height;

+ (CGFloat)widthOn375:(CGFloat)width;

+ (CGFloat)heightOn667:(CGFloat)height;

@end