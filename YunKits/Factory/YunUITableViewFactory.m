//
// Created by yun on 2017/5/15.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunUITableViewFactory.h"

@implementation YunUITableViewFactory {

}

+ (UITableView *)tvWithTg:(id)target
                  classes:(NSArray *)classes
                      ids:(NSArray *)ids {
    if (classes.count != ids.count) {return nil;}

    UITableView *tvc = [[UITableView alloc] init];
    tvc.delegate = target;
    tvc.dataSource = target;
    tvc.backgroundColor = [UIColor clearColor];
    tvc.separatorStyle = UITableViewCellSeparatorStyleNone;
    // tvc.estimatedRowHeight = 40; // 防止数据过多加载缓慢 但是会造成刷新乱跳

    [self setTvc:tvc estimated:YES];

    for (int i = 0; i < classes.count; ++i) {
        [tvc registerClass:classes[i] forCellReuseIdentifier:ids[i]];
    }

    return tvc;
}

+ (UITableView *)tvWithTg:(id)target
                classItem:(Class)cellClass
                      ids:(NSArray *)ids {
    UITableView *tvc = [[UITableView alloc] init];
    tvc.delegate = target;
    tvc.dataSource = target;
    tvc.backgroundColor = [UIColor clearColor];
    tvc.separatorStyle = UITableViewCellSeparatorStyleNone;
    // tvc.estimatedRowHeight = 40; // 防止数据过多加载缓慢 但是会造成刷新乱跳

    [self setTvc:tvc estimated:YES];

    for (int i = 0; i < ids.count; ++i) {
        [tvc registerClass:cellClass forCellReuseIdentifier:ids[i]];
    }

    return tvc;
}

+ (void)setTvc:(UITableView *)tvc estimated:(BOOL)estimated {
    // iOS 11后，默认开启Self-Sizing，可能引起乱跳
    // 设置为0，关闭Self-Sizing
    // 如果想禁止，请设置为UITableViewAutomaticDimension
    tvc.estimatedRowHeight = estimated ? 0 : UITableViewAutomaticDimension;
    tvc.estimatedSectionHeaderHeight = estimated ? 0 : UITableViewAutomaticDimension;
    tvc.estimatedSectionFooterHeight = estimated ? 0 : UITableViewAutomaticDimension;
}

@end