//
// Created by yun on 2017/5/17.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "UIImage+YunAdd.h"
#import "UIImage+Resizing.h"

@implementation UIImage (YunAdd)

+ (UIImage *)GetImageWithColor:(UIColor *)color andHeight:(CGFloat)height {
    CGRect r = CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);

    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return img;
}

- (UIImage *)resizeWithHeight:(CGFloat)height {
    CGFloat w = CGImageGetWidth(self.CGImage);
    CGFloat h = CGImageGetHeight(self.CGImage);

    CGFloat newW = w * height / h;

    UIImage *newImg = [self scaleToFitSize:CGSizeMake(newW, height)];

    return newImg;
}

- (UIImage *)resizeWithSize:(NSInteger)size {
    UIImage *newImg = [self resizeWithHeight:1400];

    CGFloat compression = 0.5f;
    CGFloat maxCompression = 0.00000001f;
    NSData *imageData = UIImageJPEGRepresentation(newImg, compression);
    while ([imageData length] > size && compression > maxCompression) {
        compression *= 0.5f;
        imageData = UIImageJPEGRepresentation(newImg, compression);
    }

    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}

@end