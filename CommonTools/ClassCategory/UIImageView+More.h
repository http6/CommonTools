//
//  UIImageView+More.h
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (More)

/// 标准实例化：传图片
+ (UIImageView *)ImageViewWithFrame:(CGRect)rect image:(UIImage *)image;

/// 标准实例化：传图片名称
+ (UIImageView *)ImageViewWithFrame:(CGRect)rect imageName:(NSString *)imageName;

@end
