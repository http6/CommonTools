
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

#import "CommonDefine.h"
#import "ClassCategory.h"

@interface  CommonFunction: NSObject

#pragma mark --- 手机号 邮箱 验证方法

/// 邮箱验证 MODIFIED BY HELENSONG
+ (BOOL)isValidateEmail:(NSString *)email;

/// 手机号码验证 MODIFIED BY HELENSONG
+ (BOOL)isValidateMobile:(NSString *)mobile;

/// 手机号码验证
+ (BOOL)isValidateMobileNum:(NSString*)value;

/// 车牌号验证 MODIFIED BY HELENSONG
+ (BOOL)isValidateCarNumber:(NSString *)carNumber;

/// 身份证验证 MODIFIED BY HELENSONG
+ (BOOL)isValidateCardID:(NSString *)strID;



#pragma mark --- 其它

/// 获取当前语言
+ (NSString *)getCurrentLanguage;

/// 返回应用当前语言是否为中文
+ (BOOL)isChinese;

/// 隐藏电池栏 先在plist文件中禁用viewController对状态栏的操作
+ (void)setStatusBarHidden:(BOOL)isHide;

/// 设置电池状态栏为默认样式 黑字
+ (void)setStatusBarStyleDefault;

/// 设置电池状态栏为高亮样式 白字
+ (void)setStatusBarStyleLightContent;

/// 通过button找到它所在的cell的位置
+ (NSIndexPath *)getIndexPathForView:(UIView *)view;

/// 手动打开或关闭闪光灯  要导入：#import <AVFoundation/AVFoundation.h>
//+ (void)turnTorchOn:(BOOL)on;

/// 拨打电话
+ (void)phoneWithNum:(NSString *)num;

/// 获取 标准的json对象
+ (NSDictionary *)getJsonDicFromData:(NSData *)data;


@end



#pragma mark --- 批量删除.svn文件

/*
打开终端，cd ...命令进入到.svn所在的文件夹。
输入：
find . -type d -name ".svn"|xargs rm -rf
回车，这样.svn文件已经全部删除了。
*/


#pragma mark --- 显示隐藏文件

/* 
显示Mac隐藏文件的命令：
defaults write com.apple.finder AppleShowAllFiles -bool true

隐藏Mac隐藏文件的命令：
defaults write com.apple.finder AppleShowAllFiles -bool false
*/


#pragma mark --- 解决.a文件不能提交 

/*
http://blog.csdn.net/xyxjn/article/details/17264175
1、打开终端
2、执行命令：open ~/.subversion/config
3、找到以下文本位置，去掉第一行的 *.a
    #global-ignores = *.o *.lo *.la *.al .libs *.so *.so.[0-9]* *.a *.pyc *.pyo
    #*.rej *~ #*# .#* .*.swp .DS_Store
4、再去掉第一行最前面的 #
或直接使用下面一句：（为了配合Pods使用，后面加了忽略相关文件）
global-ignores = *.o *.lo *.la *.al .libs *.so *.so.[0-9]* *.pyc *.pro *.rej *~ #*# .#* .*.swp .DS_Store UserInterfaceState.xcuserstate Pods Podfile.lock
*/



