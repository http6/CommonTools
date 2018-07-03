//
//  UIScrollView+More.h
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (More)

/// 实例化 背景色
+ (UIScrollView *)ScrollViewWithFrame:(CGRect)rect contentSize:(CGSize)size backColor:(UIColor *)backcolor;

@end
