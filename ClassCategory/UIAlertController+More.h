//
//  UIAlertController+More.h
//  CnmobiPay
//
//  Created by cnmobi on 18-7-2.
//  Copyright © 2018年 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (More)

/// 样式: 无标题 + 取消/确定
+ (void)showAlertFromVC:(UIViewController *)vc message:(NSString *)message sureBlock:(void (^)(void))sureBlock;

/// 样式: 有标题 + 取消/确定
+ (void)showAlertFromVC:(UIViewController *)vc title:(NSString *)title message:(NSString *)message sureBlock:(void (^)(void))sureBlock;

/// 自定义样式
+ (void)showAlertFromVC:(UIViewController *)vc title:(NSString *)title message:(NSString *)message cancleTitle:(NSString *)cancleTitle sureTitle:(NSString *)sureTitle sureBlock:(void (^)(void))sureBlock;

/// 有输入框的弹出窗
+ (void)showAlertWithTextFieldFromVC:(UIViewController *)vc message:(NSString *)message sureBlock:(void (^)(NSString *string))sureBlock;

@end
