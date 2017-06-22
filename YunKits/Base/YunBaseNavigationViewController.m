//
//  Created by 王健 on 16/9/18.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunBaseNavigationViewController.h"

@interface YunBaseNavigationViewController () {
    UIImageView *_navBarHairlineImageView;
}

@end

@implementation YunBaseNavigationViewController

- (instancetype)init {
    self = [super init];

    if (self) {
        _hideNagBar = NO;
        _hideNagBarBtmLine = NO;
        _hideNagBarBackItem = NO;

        _needUpdateData = NO;
        _forceNoUpdate = NO;

        _hideBottomBar = YES;

        _keybordNotf = NO;

        _sideOff = 10;

        _firstLoad = YES;

        [self setHidesBottomBarWhenPushed:_hideBottomBar];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setAutomaticallyAdjustsScrollViewInsets:NO];

    // 不延伸
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    self.navigationController.navigationBar.translucent = NO; // 不延伸时，导航栏设为不透明，不然为灰色

    _navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if (_hideNagBar) {
        [self.navigationController.navigationBar setHidden:YES];
    }
    else {
        if (_hideNagBarBackItem) {
            UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:[UIButton new]];

            self.navigationItem.leftBarButtonItem = btnItem;
        }
        else {
            // todo none
            [self.navigationItem.backBarButtonItem setTarget:self];
            [self.navigationItem.backBarButtonItem setAction:@selector(didClickNagLeftItem)];
        }
    }

    _navBarHairlineImageView.hidden = _hideNagBarBtmLine;
    //if (_hideNagBarBtmLine) {
    //    [self setNagBottomLineHide:_hideNagBarBtmLine];
    //}
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    if (_keybordNotf) {
        [self addKeyboardNotification];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    if (_keybordNotf) {
        [self removeKeyboardNotification];
    }

    if (_hideNagBar) {
        [self.navigationController.navigationBar setHidden:NO];
    }

    //if (_hideNagBarBtmLine) {
    //    [self setNagBottomLineHide:NO];
    //}
    _navBarHairlineImageView.hidden = _hideNagBarBtmLine;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - handles

- (void)didClickNagLeftItem {
    if (_backVC) {
        [self.navigationController popToViewController:_backVC animated:YES];
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didClickNagRightItem {

}

#pragma mark - public functions

- (void)setRightBarItemByNormalImg:(NSString *)norImg highLightImg:(NSString *)highImg {
    UIBarButtonItem *rBtnItem = [self createBarItemByNormalImg:norImg
                                                  highLightImg:highImg
                                                        action:@selector(didClickNagRightItem)];

    self.navigationItem.rightBarButtonItem = rBtnItem;
}

- (void)setRightBarItemName:(NSString *)name font:(UIFont *)font color:(UIColor *)color {
    if (name == nil) {
        return;
    }

    UIBarButtonItem *rBtnItem = [self createBarItemByName:name
                                                     font:font
                                                    color:color
                                                   action:@selector(didClickNagRightItem)];

    self.navigationItem.rightBarButtonItem = rBtnItem;
}

- (void)setLeftBarItemByNormalImg:(NSString *)norImg highLightImg:(NSString *)highImg {
    UIBarButtonItem *lBtnItem = [self createBarItemByNormalImg:norImg
                                                  highLightImg:highImg
                                                        action:@selector(didClickNagLeftItem)];

    self.navigationItem.leftBarButtonItem = lBtnItem;
}

- (void)setLeftBarItemName:(NSString *)name font:(UIFont *)font color:(UIColor *)color {
    if (name == nil) {
        return;
    }

    UIBarButtonItem *lBtnItem = [self createBarItemByName:name
                                                     font:font
                                                    color:color
                                                   action:@selector(didClickNagLeftItem)];

    self.navigationItem.leftBarButtonItem = lBtnItem;
}

- (UIBarButtonItem *)createBarItemByNormalImg:(NSString *)norImg highLightImg:(NSString *)highImg action:(nullable SEL)action {
    UIButton *button = [UIButton new];
    button.backgroundColor = [UIColor clearColor];
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;

    if (norImg) {
        [button setImage:[UIImage imageNamed:norImg] forState:UIControlStateNormal];
    }

    if (highImg) {
        [button setImage:[UIImage imageNamed:highImg] forState:UIControlStateHighlighted];
    }

    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];

    button.frame = CGRectMake(0, 0, 40, 40);
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:button];

    return btnItem;
}

- (UIBarButtonItem *)createBarItemByName:(NSString *)name font:(UIFont *)font color:(UIColor *)color action:(nullable SEL)action {
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithTitle:name
                                                                style:UIBarButtonItemStyleDone
                                                               target:self
                                                               action:action];
    [btnItem setTitleTextAttributes:
                     @{
                             NSFontAttributeName            : font,
                             NSForegroundColorAttributeName : color
                     }
                           forState:UIControlStateNormal];

    return btnItem;

}

#pragma mark - private functions

- (void)setNagBottomLineHide:(BOOL)hide {
    //return;
    //// 去掉nav下划线
    //if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
    //
    //    NSArray *list = self.navigationController.navigationBar.subviews;
    //
    //    for (id obj in list) {
    //
    //        if ([obj isKindOfClass:[UIImageView class]]) {
    //            UIImageView *imageView = (UIImageView *) obj;
    //            imageView.hidden = YES;
    //        }
    //    }
    //}
    //
    //return;
    //
    //if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
    //    NSArray *list = self.navigationController.navigationBar.subviews;
    //    for (id obj in list) {
    //        if ([obj isKindOfClass:[UIImageView class]]) {
    //            UIImageView *imageView = (UIImageView *) obj;
    //            NSArray *list2 = imageView.subviews;
    //            if (list2.count > 0) {
    //                for (id obj2 in list2) {
    //                    if ([obj2 isKindOfClass:[UIImageView class]]) {
    //                        UIImageView *imageView2 = (UIImageView *) obj2;
    //                        imageView2.hidden = hide;
    //                    }
    //                }
    //            }
    //            else {
    //                imageView.hidden = hide;
    //            }
    //        }
    //    }
    //}
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *) view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

#pragma mark - UIKeyboard Notification

- (void)addKeyboardNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)removeKeyboardNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)ntf {
}

- (void)keyboardWillHide:(NSNotification *)ntf {
}

#pragma mark - protocol

#pragma mark - request functions

@end
