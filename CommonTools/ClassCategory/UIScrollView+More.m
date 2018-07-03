//
//  UIScrollView+More.m
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import "UIScrollView+More.h"

@implementation UIScrollView (More)

/// 实例化 背景色
+ (UIScrollView *)ScrollViewWithFrame:(CGRect)rect contentSize:(CGSize)size backColor:(UIColor *)backcolor
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:rect];
    scrollView.contentSize     = size;
    scrollView.backgroundColor = backcolor;
    
    return scrollView;
}


///// 实例化 背景色 + 代理
//+ (UIScrollView *)ScrollViewWithFrame:(CGRect)rect contentSize:(CGSize)size backColor:(UIColor *)backcolor delegate:(id)delegate
//{
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:rect];
//    scrollView.contentSize     = size;
//    scrollView.backgroundColor = backcolor;
//    scrollView.delegate        = delegate;
//    
//    return scrollView;
//}

@end
