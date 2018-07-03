//
//  UITextField+More.h
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (More)

/// 设置文字左对齐并留出指定缩进
- (void)setLeftIndent:(float)indent;


/// 标准实例化
+ (UITextField *)TextFieldWithFrame:(CGRect)rect placeholder:(NSString *)placeholder font:(UIFont *)font backColor:(UIColor *)backColor;

@end


