//
//  UIImage+More.h
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (More)

- (CGFloat)Width;

- (CGFloat)Height;


#pragma mark - 类方法

/// 1. 等比绽放图片     照相出来时 1936.000000  2592.000000
+ (UIImage *)getScaleImage:(UIImage *)image toSize:(CGSize)size;

/// 2. 截取图中某部分小图
+ (UIImage *)getSubImageFromImage:(UIImage *)oldImage withRect:(CGRect)rect;

/// 3. 固定某张图片方向 向上
+ (UIImage *)fixOrientationForImage:(UIImage *)image;

/// 4. 获取自适应大小的图片
+ (UIImage *)getResizableImage:(NSString *)name;


@end
