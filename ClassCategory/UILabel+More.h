//
//  UILabel+More.h
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (More)

/// 标准实例化
+ (UILabel *)LabelWithFrame:(CGRect)rect text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font backColor:(UIColor *)backColor;

@end
