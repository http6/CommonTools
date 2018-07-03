//
//  UILabel+More.m
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import "UILabel+More.h"

@implementation UILabel (More)

/// 标准实例化
+ (UILabel *)LabelWithFrame:(CGRect)rect text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font backColor:(UIColor *)backColor
{
    UILabel *label        = [[UILabel alloc] initWithFrame:rect];
    label.text            = text;
    label.textColor       = textColor;
    label.font            = font;
//    label.textAlignment   = alignment;
    label.backgroundColor = backColor;
    
    return label;
}

@end
