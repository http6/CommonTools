//
//  AlertView.h
//   
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (More)

/// 显示简单弹窗
+ (void)showAlertViewWithMessage:(NSString *)message fromVC:(UIViewController *)vc;

/// 指定时间后自动消失的提示窗
+ (void)showMessage:(NSString*)message time:(float)time;

/// 指定时间后自动消失的提示窗 并指定显示的中心点
+ (void)showMessage:(NSString*)message time:(float)time center:(CGPoint)point;

@end
