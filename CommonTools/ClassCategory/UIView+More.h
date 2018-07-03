//
//  UIView+More.h
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MoreUISet)


#pragma mark - 实例化

/// 实例化 Frame + backgroundColor
+ (UIView *)ViewWithFrame:(CGRect)rect backColor:(UIColor *)backColor;


#pragma mark - 获取坐标或尺寸

/// 上
- (float)Top;

/// 下
- (float)Bottom;

/// 左
- (float)Left;

/// 右
- (float)Right;

/// 宽
- (float)Width;

/// 高
- (float)Height;


#pragma mark - 设置坐标或尺寸

/// 设置左上角x值
- (void)setLeft:(float)left;

/// 设置左上角y值
- (void)setTop:(float)top;

/// 设置宽
- (void)setWidth:(float)width;

/// 设置高
- (void)setHeight:(float)height;


#pragma mrk - 重设坐标

/// 重设x起点
- (void)resetOrigin_x:(float)x animated:(BOOL)animated;

/// 重设y起点
- (void)resetOrigin_y:(float)y animated:(BOOL)animated;


#pragma mark - 设置圆角

/// 设置圆角 边框宽度,边框颜色
- (void)setCornerRadius:(float)Radius andBorderWidth:(float)Width andBorderColor:(UIColor *)BorderColor;

/// 设置顶部两个圆角
- (void)setUpRadii:(int)radii;

/// 设置底部两个圆角
- (void)setDownRadii:(int)radii;

/// 设置底部左边圆角
- (void)setDownLeftRadii:(int)radii;

/// 设置底部右边圆角
- (void)setDownRightRadii:(int)radii;


/// 获取相同大小的Frame 在右边还是下边 + 间隔
- (CGRect)getFrameWithInterval:(float)interval isRight:(BOOL)right;

/// 在底部添加一条分隔线
- (void)addLine;

/// 是否包含某个点
- (BOOL)containPoint:(CGPoint)p;



@end

// #pragma mark - xib加圆角
// layer.cornerRadius string 10

/*
 UIViewAutoresizingNone就是不自动调整。
 UIViewAutoresizingFlexibleLeftMargin   自动调整与superView左边的距离，保证与superView右边的距离不变。
 UIViewAutoresizingFlexibleRightMargin  自动调整与superView的右边距离，保证与superView左边的距离不变。
 UIViewAutoresizingFlexibleTopMargin    自动调整与superView顶部的距离，保证与superView底部的距离不变。
 UIViewAutoresizingFlexibleBottomMargin 自动调整与superView底部的距离，也就是说，与superView顶部的距离不变。
 UIViewAutoresizingFlexibleWidth        自动调整自己的宽度，保证与superView左边和右边的距离不变。
 UIViewAutoresizingFlexibleHeight       自动调整自己的高度，保证与superView顶部和底部的距离不变。
 
 UIViewAutoresizingFlexibleLeftMargin  |UIViewAutoresizingFlexibleRightMargin
 自动调整与superView左边的距离，保证与左边的距离和右边的距离和原来距左边和右边的距离的比例不变。
 比如原来距离为20，30，调整后的距离应为68，102，即68/20=102/30。
 */
