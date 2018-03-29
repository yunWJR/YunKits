//
// Created by yun on 16/12/1.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

@interface YunViewController : UIViewController

// 返回视图,nil则返回上一级视图 // 默认nil
@property (nonatomic, weak) YunViewController *backVC;

// 导航栏隐藏属性 // 默认NO
@property (nonatomic, assign) BOOL hideNagBar;

// 导航栏返回按钮隐藏属性 // 默认NO
@property (nonatomic, assign) BOOL hideNagBarBackItem;

// 导航栏底部线条隐藏属性 // 默认NO
@property (nonatomic, assign) BOOL hideNagBarBtmLine;

// leftNagItem
@property (nonatomic, strong) UIBarButtonItem *leftNagItem;

// rightNagItem
@property (nonatomic, strong) UIBarButtonItem *rightNagItem;

// bottom bar隐藏属性 // 默认YES, table bar需要设置成 NO
@property (nonatomic, assign) BOOL hideBottomBar;

// 第一次加载标识符 // 默认YES
@property (nonatomic, assign) BOOL firstLoad;

// 有数据需要更新 // 默认NO
@property (nonatomic, assign) BOOL needUpdateData; // 使用后设为NO

// 有数据需要强制更新 // 默认NO
@property (nonatomic, assign) BOOL forceNoUpdate;

// 是否Appear
@property (nonatomic, assign) BOOL isAppear;

// 是否为模态Vc
@property (nonatomic, assign) BOOL isModalVc;

// 控件间距 // 默认0
@property (nonatomic, assign) CGFloat topOff;

// 控件间距 // 默认0
@property (nonatomic, assign) CGFloat sideOff;

#pragma mark - nag

- (void)setRightBarItemByImg:(NSString *)img;

- (void)setRightBarItemName:(NSString *)name font:(UIFont *)font color:(UIColor *)color;

- (void)setLeftBarItemByImg:(NSString *)img;

- (void)setLeftBarItemName:(NSString *)name font:(UIFont *)font color:(UIColor *)color;

- (void)didClickNagLeftItem;

- (void)didClickNagRightItem;

- (void)setBackVcNeedUpdate;

@end