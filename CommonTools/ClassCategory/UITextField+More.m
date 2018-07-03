//
//  UITextField+More.m
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import "UITextField+More.h"

@implementation UITextField (More)

/// 设置文字左对齐并留出指定缩进
- (void)setLeftIndent:(float)indent
{
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, indent, self.frame.size.height)];
    self.leftViewMode = UITextFieldViewModeAlways;
}


/// 标准实例化 NSTextAlignment
+ (UITextField *)TextFieldWithFrame:(CGRect)rect placeholder:(NSString *)placeholder font:(UIFont *)font backColor:(UIColor *)backColor
{
    UITextField *textField = [[UITextField alloc] initWithFrame:rect];
    textField.placeholder  = placeholder;
    textField.font = font;
//    textField.textAlignment = alignment;
    textField.backgroundColor = backColor;
    
    textField.clearButtonMode          = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    return textField;
}

@end
