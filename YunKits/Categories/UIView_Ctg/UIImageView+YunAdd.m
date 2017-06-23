//
// Created by 王健 on 16/10/8.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <SDWebImage/SDImageCache.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <AFNetworking/AFHTTPSessionManager.h>
#import "UIImageView+YunAdd.h"
#import "YunGlobalDefine.h"
#import "YunValueVerifier.h"

@implementation UIImageView (YunAdd)

- (void)setImageURLStr:(NSString *)imgStr placeholderImage:(UIImage *)placeholderImage {
    if ([YunValueVerifier isNilOrEmptyStr:imgStr]) {
        self.image = placeholderImage;
        return;
    }

    [self sd_setImageWithURL:[NSURL URLWithString:imgStr]
            placeholderImage:placeholderImage
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       if (!image) {
                           self.image = [UIImage imageNamed:IMAGE_FAILED_NAME];
                       }
                   }];
}

- (void)setAvrImageURLStr:(NSString *)imgStr {
    UIImage *placeholderImage = [UIImage imageNamed:IMAGE_AVr_NAME];

    if ([YunValueVerifier isNilOrEmptyStr:imgStr]) {
        self.image = placeholderImage;
        return;
    }

    [self sd_setImageWithURL:[NSURL URLWithString:imgStr]
            placeholderImage:placeholderImage
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       if (!image) {
                           self.image = [UIImage imageNamed:IMAGE_AVr_NAME];
                       }
                   }];
}

- (void)setImageURLStr:(NSString *)imgStr {
    UIImage *placeholderImage = [UIImage imageNamed:IMAGE_PLACEHOLDER_NAME];

    if ([YunValueVerifier isNilOrEmptyStr:imgStr]) {
        self.image = placeholderImage;
        return;
    }

    [self sd_setImageWithURL:[NSURL URLWithString:imgStr]
            placeholderImage:placeholderImage
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       if (!image) {
                           self.image = [UIImage imageNamed:IMAGE_FAILED_NAME];
                       }
                   }];

}

// 执行下载文件的方法,可以监控下载进度
- (void)downLoadAction:(NSString *)imgStr
                result:(void (^)(NSURL *))rs {
    // 1.创建网络管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 2.目标地址
    NSURL *url = [NSURL URLWithString:imgStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    NSURLSessionDownloadTask *downTask = [manager downloadTaskWithRequest:request progress:^(NSProgress *progress) {
    }                                                         destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        //下载的目标路径
        NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        //path
        NSString *path = [cachesPath stringByAppendingPathComponent:response.suggestedFilename];

        return [NSURL fileURLWithPath:path];
    }                                                   completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        //文件存在filePath下，可以读出来放到其他文件中，后续文章会介绍
        rs(filePath);
    }];

    [downTask resume];
}

@end