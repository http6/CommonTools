
#import "CommonFunction.h"

@implementation CommonFunction


#pragma mark - 手机号 邮箱 车牌号 身份证 验证方法

/// 邮箱验证 MODIFIED BY HELENSONG
+ (BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

/// 手机号码验证 MODIFIED BY HELENSONG
+ (BOOL)isValidateMobile:(NSString *)mobile
{
    //手机号以13，15(除154)，14，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(14[0,0-9])|(18[0,0-9]))\\d{8}$";
//    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}

/// 手机号码验证
+ (BOOL)isValidateMobileNum:(NSString*)value
{
    const char *cvalue = [value UTF8String];
    NSInteger len = strlen(cvalue);
    if (len != 11)
        return FALSE;
    if (![self isValidNumber:value])
        return FALSE;
    
    NSString *s0 = [[NSString stringWithFormat:@"%@",value] substringToIndex:2];
    if ([s0 isEqualToString:@"13"] || [s0 isEqualToString: @"15"] || [s0 isEqualToString: @"17"] || [s0 isEqualToString: @"18"])
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
+ (BOOL) isValidNumber:(NSString*)value
{
    const char *cvalue = [value UTF8String];
    NSInteger len = strlen(cvalue);
    for (int i = 0; i < len; i++)
    {
        if(!isNumber(cvalue[i]))
            return FALSE;
    }
    return TRUE;
}
BOOL isNumber (char ch)
{
    if (!(ch >= '0' && ch <= '9'))
    {
        return FALSE;
    }
    return TRUE;
}

/// 车牌号验证 MODIFIED BY HELENSONG
+ (BOOL) isValidateCarNumber:(NSString *)carNumber
{
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNumber];
}


/// 身份证验证 MODIFIED BY HELENSONG
+ (BOOL)isValidateCardID:(NSString *)strID
{
    NSString *cardCheck = @"^[0-9]{17}[0-9|xX]{1}$";
    NSPredicate *cardTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",cardCheck];
    return [cardTest evaluateWithObject:strID];
}


#pragma mark - 其它

/// 获取当前语言
+ (NSString *)getCurrentLanguage
{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    return currentLanguage;
}

/// 返回应用当前语言是否为中文
+ (BOOL)isChinese
{
    NSString *language = [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0];
    return [language isEqualToString:@"zh-Hans"] ? YES : NO;
}


/// 隐藏电池栏 先在plist文件中禁用viewController对状态栏的操作
+ (void)setStatusBarHidden:(BOOL)isHide
{
    [[UIApplication sharedApplication] setStatusBarHidden:isHide];
}

/// 设置电池状态栏为默认样式 黑字
+ (void)setStatusBarStyleDefault
{
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }
}

/// 设置电池状态栏为高亮样式 白字
+ (void)setStatusBarStyleLightContent
{
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
}

/// 通过button找到它所在的cell的位置
+ (NSIndexPath *)getIndexPathForView:(UIView *)view
{
    UITableViewCell *cell = (UITableViewCell *)[view superview];
    
    while (![cell isKindOfClass:[UITableViewCell class]])
    {
        cell = (UITableViewCell *)[cell superview];
    }
    
    if(cell == nil)
    {
        NSLog(@"error");
        return nil;
    }
    
    UITableView *tableView = (UITableView *)[cell superview];
    while (![tableView isKindOfClass:[UITableView class]])
    {
        tableView = (UITableView *)[tableView superview];
    }
    
    if(tableView == nil)
    {
        NSLog(@"error");
        return nil;
    }
    
    NSIndexPath *indexPath = [tableView indexPathForCell:cell];
    
    return indexPath;
}

/// 手动打开或关闭闪光灯   要导入：#import <AVFoundation/AVFoundation.h>
//+ (void)turnTorchOn:(BOOL)on
//{
//    Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
//    if (captureDeviceClass != nil) {
//        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
//        if ([device hasTorch] && [device hasFlash])
//        {
//            [device lockForConfiguration:nil];
//            if (on)
//            {
//                [device setTorchMode:AVCaptureTorchModeOn];
//                [device setFlashMode:AVCaptureFlashModeOn];
//            }
//            else
//            {
//                [device setTorchMode:AVCaptureTorchModeOff];
//                [device setFlashMode:AVCaptureFlashModeOff];
//            }
//            [device unlockForConfiguration];
//        }
//    }
//}

/// 拨打电话
+ (void)phoneWithNum:(NSString *)num
{
    NSString *urlStr = [NSString stringWithFormat:@"tel://%@", num];
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:urlStr]];
}


/// 获取 标准的json对象
+ (NSDictionary *)getJsonDicFromData:(NSData *)data
{
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    if(error)
    {
        NSLog(@"%@",error.description);
        return nil;
    }
    return dic;
}


@end
