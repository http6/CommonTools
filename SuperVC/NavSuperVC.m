//
//  NavSuperVC.m
//
//
//  Created by apple on 15/5/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "NavSuperVC.h"

@interface NavSuperVC () <UINavigationControllerDelegate>

@end

@implementation NavSuperVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}


#pragma mark - 横竖屏相关

/// 是否支持旋转
- (BOOL) shouldAutorotate
{
    //    Class class = self.topViewController.class;
    //    NSLog(@"%@", class);
    return self.topViewController.shouldAutorotate;
}

/// 支持哪些方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.viewControllers.lastObject supportedInterfaceOrientations];
}

/// 优先显示的屏幕方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.viewControllers.lastObject preferredInterfaceOrientationForPresentation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
