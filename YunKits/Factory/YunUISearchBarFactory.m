//
// Created by 王健 on 16/9/18.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunUISearchBarFactory.h"

@implementation YunUISearchBarFactory

+ (UISearchBar *)createBarWithTarget:(id)target {
    CGFloat screenWide = [UIScreen mainScreen].bounds.size.width;
    return [self createBarByFrame:CGRectMake(0.0f, 2.0f, screenWide - 15 * 4 - 26 * 2, 26.0f) phText:@"搜索" target:target];
}

+ (UISearchBar *)createBarByPHText:(NSString *_Nullable)phText target:(id _Nullable)target {
    CGFloat screenWide = [UIScreen mainScreen].bounds.size.width;
    return [self createBarByFrame:CGRectMake(0.0f, 2.0f, screenWide - 15 * 4 - 26 * 2, 26.0f) phText:phText target:target];
}

+ (UISearchBar *)createBarByFrame:(CGRect)frame target:(id _Nullable)target {
    return [self createBarByFrame:frame phText:@"搜索" target:target];
}

+ (UISearchBar *)createBarByFrame:(CGRect)frame phText:(NSString *_Nullable)phText target:(id _Nullable)target {
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:frame];
    searchBar.layer.cornerRadius = 3;
    searchBar.layer.borderWidth = 0;
    searchBar.layer.masksToBounds = YES;
    [searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"search_bg"] forState:UIControlStateNormal];
    searchBar.delegate = target;
    [searchBar setTintColor:[UIColor blackColor]];
    [searchBar setPlaceholder:phText];
//    [searchBar setSearchIconCustom];

    return searchBar;
}

+ (UIView *)createViewByFrame:(CGRect)frame phText:(NSString *_Nullable)phText target:(id _Nullable)target {
    UISearchBar *searchBar = [self createBarByFrame:frame phText:phText target:target];
    searchBar.tag = 99;

    UIView *searchView = [[UIView alloc] initWithFrame:frame];
    searchView.backgroundColor = [UIColor clearColor];
    [searchView addSubview:searchBar];

    return searchView;
}

@end