//
//  SuperVC.h
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

/// 继承 UIViewController 添加一些方法 以快速调用 

#import <UIKit/UIKit.h>
#import "CommonDefine.h"
#import "UIKeyboardViewController.h"
#import "MBProgressHUD.h"

@interface SuperVC : UIViewController < UITableViewDataSource, UITableViewDelegate,
                                        UIScrollViewDelegate,
                                        UITextFieldDelegate, UITextViewDelegate,
                                        UIAlertViewDelegate, UIActionSheetDelegate,
                                        UIKeyboardViewControllerDelegate >
{    
    /// 主滚动视图
    UIScrollView *mScroll;
    
    /// 键盘控制
    UIKeyboardViewController *keyBoardController;
    
    /// 状态显示器
    MBProgressHUD *HUD;
}

/// 添加单击手势 用于取消键盘
- (void)addTapGestureRecognizer;

/// 添加进入后台的通知实现
- (void)addEnterBackgroundNotification;
/// 应用进入后台时
- (void)appDidEnterBackground;

/// 添加进入前台的通知实现
- (void)addEnterForegroundNotification;
/// 应用进入前台时
- (void)appEnterForeground;


@end
