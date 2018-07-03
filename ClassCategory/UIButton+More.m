//
//  UIButton+More.m
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import "UIButton+More.h"

@implementation UIButton (More)

/// 设置文字左对齐并留出指定缩进
- (void)setTextLeftEdgeInsets:(float)insets
{
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.contentEdgeInsets = UIEdgeInsetsMake(0, insets, 0, 0);
}


#pragma mark - 类方法

/// 1. 无图无字
+ (UIButton *)ButtonWithFrame:(CGRect)rect target:(id)target action:(SEL)action backColor:(UIColor *)color
{
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:color];
    
    return button;
}

/// 2. 背景图
+ (UIButton *)ButtonWithFrame:(CGRect)rect target:(id)target action:(SEL)action backImage:(UIImage *)image
{
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    
    [button setBackgroundColor:[UIColor clearColor]];
    button.clipsToBounds = YES;
    return button;
}

/// 3. 文字
+ (UIButton *)ButtonWithFrame:(CGRect)rect target:(id)target action:(SEL)action title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font backColor:(UIColor *)color
{
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button.titleLabel setFont:font];
    [button setBackgroundColor:color];
    
    button.clipsToBounds = YES;
    return button;
}

/// 4. 背景图 + 文字
+ (UIButton *)ButtonWithFrame:(CGRect)rect target:(id)target action:(SEL)action backImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font
{
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button.titleLabel setFont:font];
    
    [button setBackgroundColor:[UIColor clearColor]];
    button.clipsToBounds = YES;
    return button;
}

@end
