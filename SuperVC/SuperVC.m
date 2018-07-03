//
//  SuperVC.h
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import "SuperVC.h"

@interface SuperVC ()

@end

@implementation SuperVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBColor(248, 92, 28);
    
    HUD = [[MBProgressHUD alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:HUD];
}

/// 添加单击手势 用于取消键盘
- (void)addTapGestureRecognizer
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
}
- (void)tap:(UITapGestureRecognizer *)tap
{
    [self.view endEditing:YES];
}

/// 添加进入后台的通知实现
- (void)addEnterBackgroundNotification
{
    [kNotificationCenter addObserver:self selector:@selector(appDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:Nil];
}
/// 应用进入后台时
- (void)appDidEnterBackground
{
    
}

/// 添加进入前台的通知实现
- (void)addEnterForegroundNotification
{
    [kNotificationCenter addObserver:self selector:@selector(appEnterForeground) name:UIApplicationWillEnterForegroundNotification object:Nil];
}
/// 应用进入前台时
- (void)appEnterForeground
{
    
}

#pragma mark - UITableView
/// 默认就是当前类的 数据数组 的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

/// 返回上一层视图
- (void)backVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    keyBoardController = [[UIKeyboardViewController alloc] initWithControllerDelegate:self];
    [keyBoardController addToolbarToKeyboard];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    keyBoardController = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
