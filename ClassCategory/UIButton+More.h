//
//  UIButton+More.h
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (More)

/// 设置文字左对齐并留出指定缩进
- (void)setTextLeftEdgeInsets:(float)insets;


#pragma mark - 类方法

/// 1. 无图无字
+ (UIButton *)ButtonWithFrame:(CGRect)rect target:(id)target action:(SEL)action backColor:(UIColor *)color;

/// 2. 背景图
+ (UIButton *)ButtonWithFrame:(CGRect)rect target:(id)target action:(SEL)action backImage:(UIImage *)image;

/// 3. 文字
+ (UIButton *)ButtonWithFrame:(CGRect)rect target:(id)target action:(SEL)action title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font backColor:(UIColor *)color;

/// 4. 背景图 + 文字
+ (UIButton *)ButtonWithFrame:(CGRect)rect target:(id)target action:(SEL)action backImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font;

@end
