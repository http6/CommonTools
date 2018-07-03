//
//  UIAlertController+More.m
//  CnmobiPay
//
//  Created by cnmobi on 18-7-2.
//  Copyright © 2018年 cnmobi. All rights reserved.
//

#import "UIAlertController+More.h"


@implementation UIAlertController (More)

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/// 样式: 无标题 + 取消/确定
+ (void)showAlertFromVC:(UIViewController *)vc message:(NSString *)message sureBlock:(void (^)(void))sureBlock
{
    [UIAlertController showAlertFromVC:vc title:nil message:message cancleTitle:@"取消" sureTitle:@"确定" sureBlock:sureBlock];
}

/// 样式：有标题 + 取消/确定
+ (void)showAlertFromVC:(UIViewController *)vc title:(NSString *)title message:(NSString *)message sureBlock:(void (^)(void))sureBlock
{
    [UIAlertController showAlertFromVC:vc title:title message:message cancleTitle:@"取消" sureTitle:@"确定" sureBlock:sureBlock];
}

/// 自定义样式
+ (void)showAlertFromVC:(UIViewController *)vc title:(NSString *)title message:(NSString *)message cancleTitle:(NSString *)cancleTitle sureTitle:(NSString *)sureTitle sureBlock:(void (^)(void))sureBlock
{
    UIAlertController *alertCtl = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    /// 取消
    UIAlertAction *action = [UIAlertAction actionWithTitle:cancleTitle style:UIAlertActionStyleCancel handler:nil];
    [alertCtl addAction:action];
    
    /// 确定
    action = [UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (sureBlock)
        {
            sureBlock();
        }
    }];
    [alertCtl addAction:action];
    
    [vc presentViewController:alertCtl animated:YES completion:nil];
}


/// 有输入框的弹出窗
+ (void)showAlertWithTextFieldFromVC:(UIViewController *)vc message:(NSString *)message sureBlock:(void (^)(NSString *string))sureBlock
{
    UIAlertController *alertCtl = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:(UIAlertControllerStyleAlert)];
    [alertCtl addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alertCtl addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (sureBlock)
        {
            NSArray<UITextField *> *textFields = alertCtl.textFields;
            UITextField *tf = textFields[0];
            sureBlock(tf.text);
        }
    }]];
    [alertCtl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        //        NSLogObj(@"...");
        //        textField.placeholder = @"text input";
        //        textField.delegate = self;
    }];
    [vc presentViewController:alertCtl animated:YES completion:nil];
}


/// 通用请求：接口地址+参数+描述+回调
+ (void)requestWithUrl:(NSString *)url
            parameters:(NSDictionary *)parameters
           description:(NSString *)des
               success:(void (^)(id responseObject))successBlock
               failure:(void (^)(NSError *error))failureBlock{
    
    /// 拼接参数
    NSString *parameterStr;
    if (parameters.count)
    {
//        parameterStr = [APPFunction convertJsonDictToString:parameters];
    }
    
    /// 拼接url
    NSString *urlStr;
    if (parameterStr.length)
    {
//        urlStr = [NSString stringWithFormat:@"%@%@%@", HOST, url, parameterStr];
    }
    else
    {
//        urlStr = [NSString stringWithFormat:@"%@%@", HOST, url];
    }
    /// 格式化请求地址
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if (des.length)
    {
        NSLog(@"%@：%@", des, urlStr);
    }
    else
    {
        NSLog(@"%@", urlStr);
    }
    
    /// 访问接口
//    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
//    [manger GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//
//        if (des.length)
//        {
//            NSLog(@"%@结果：%@", des, responseObject);
//        }
//        else
//        {
//            NSLog(@"%@：%@", responseObject[@"msg"], responseObject);
//        }
//
//        if (successBlock)
//        {
//            successBlock(responseObject);
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@", error);
//        if (failureBlock)
//        {
//            failureBlock(error);
//        }
//    }];
}




- (void)addTapGestureRecognizerWithDelegate:(id)tapGestureDelegate Block:(void(^)(NSInteger tag))block
{
    
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
