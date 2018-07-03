//
//  UIImageView+More.m
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import "UIImageView+More.h"

@implementation UIImageView (More)

/// 标准实例化：传图片
+ (UIImageView *)ImageViewWithFrame:(CGRect)rect image:(UIImage *)image
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.image = image;
    return imageView;
}

/// 标准实例化：传图片名称
+ (UIImageView *)ImageViewWithFrame:(CGRect)rect imageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.image = [UIImage imageNamed:imageName];
    return imageView;
}

///// 标准实例化 + 用户交互
//+ (UIImageView *)ImageViewWithFrame:(CGRect)rect image:(UIImage *)image userInteraction:(BOOL)is
//{
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
//    imageView.image = image;
//    imageView.userInteractionEnabled = is;
//    return imageView;
//}

@end
