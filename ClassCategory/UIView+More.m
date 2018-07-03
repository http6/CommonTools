//
//  UIView+More.m
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import "UIView+More.h"

@implementation UIView (MoreUISet)


#pragma mark - 实例化

/// 实例化 Frame + backgroundColor
+ (UIView *)ViewWithFrame:(CGRect)rect backColor:(UIColor *)backColor
{
    UIView *view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = backColor;
    return view;
}


#pragma mark - 获取坐标或尺寸

/// 上
- (float)Top
{
    return self.frame.origin.y;
}

/// 下
- (float)Bottom
{
    float length = 0.0;
    length = self.frame.origin.y + self.frame.size.height;
    return length;
}

/// 左
- (float)Left
{
    return self.frame.origin.x;
}

/// 右
- (float)Right
{
    float length = 0.0;
    length = self.frame.origin.x + self.frame.size.width;
    return length;
}

/// 宽
- (float)Width
{
    float length = 0.0;
    length = self.frame.size.width;
    return length;
}

/// 高
- (float)Height
{
    float length = 0.0;
    length = self.frame.size.height;
    return length;
}


#pragma mark - 设置坐标或尺寸

/// 设置左上角x值
- (void)setLeft:(float)left
{
    CGRect rect = self.frame;
    rect.origin.x = left;
    self.frame = rect;
}

/// 设置左上角y值
- (void)setTop:(float)top
{
    CGRect rect = self.frame;
    rect.origin.y = top;
    self.frame = rect;
}

/// 设置宽
- (void)setWidth:(float)width
{
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

/// 设置高
- (void)setHeight:(float)height
{
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}


#pragma mrk - 重设坐标

/// 重设x起点
- (void)resetOrigin_x:(float)x animated:(BOOL)animated
{
    CGRect rect = self.frame;
    if(rect.origin.x == x) return;
    
    rect.origin.x = x;
    
    if(animated)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.frame = rect;
        }];
    }
    else
    {
        self.frame = rect;
    }
}

/// 重设y起点
- (void)resetOrigin_y:(float)y animated:(BOOL)animated
{
    CGRect rect = self.frame;
    if(rect.origin.y == y) return;
    
    rect.origin.y = y;
    if(animated)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.frame = rect;
        }];
    }
    else
    {
        self.frame = rect;
    }
}


#pragma mark - 设置圆角

/// 设置圆角   边框宽度,边框颜色
- (void)setCornerRadius:(float)Radius andBorderWidth:(float)Width andBorderColor:(UIColor *)BorderColor
{
    self.clipsToBounds = YES;
    
    [self.layer setCornerRadius:Radius];
    
    [self.layer setBorderWidth:Width];
    
    if (BorderColor)
        [self.layer setBorderColor:[BorderColor CGColor]];
}

/// 设置顶部两个圆角
- (void)setUpRadii:(int)radii
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(radii, radii)];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.frame = self.bounds;
    self.layer.mask = layer;
}

/// 设置底部两个圆角
- (void)setDownRadii:(int)radii
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(radii, radii)];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.frame = self.bounds;
    self.layer.mask = layer;
}

/// 设置底部左边圆角
- (void)setDownLeftRadii:(int)radii
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(radii, radii)];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.frame = self.bounds;
    self.layer.mask = layer;
}

/// 设置底部右边圆角
- (void)setDownRightRadii:(int)radii
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners: UIRectCornerBottomRight cornerRadii:CGSizeMake(radii, radii)];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.frame = self.bounds;
    self.layer.mask = layer;
}


/// 获取相同大小的Frame 在右边还是下边 + 间隔
- (CGRect)getFrameWithInterval:(float)interval isRight:(BOOL)right
{
    CGRect rect;
    if(right)
    {
        rect = CGRectMake(self.Right+interval, self.Top, self.Width, self.Height);
    }
    else
    {
        rect = CGRectMake(self.Left, self.Bottom+interval, self.Width, self.Height);
    }
    return rect;
}

/// 在底部添加一条分隔线
- (void)addLine
{
    UIView *line = [UIView ViewWithFrame:CGRectMake(0, self.Height-0.5, self.Width, 0.5) backColor:[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1]];
    [self addSubview:line];
}

/// 是否包含某个点
- (BOOL)containPoint:(CGPoint)p
{
    return ((p.x > self.Left) && (p.x < self.Right) && (p.y > self.Top) && (p.y < self.Bottom));
}


@end
