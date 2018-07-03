
#ifndef CommonDefine_h
#define CommonDefine_h



/* DEBUG 是系统自带的宏定义，测试环境为1，发布环境为0 */

#ifdef DEBUG
// 比如在登录页面时，可以在这里把账号密码直接写好，就不用每次运行的时候手动填写了
#else
// 发布环境
#endif



/*
 iPad Air {{0, 0}, {768, 1024}}
 Apple Watch 1.65英寸 320*640
 iphone4 4s:    {{0, 0}, {320, 480}}  640 * 960
 iphone5 5s:    {{0, 0}, {320, 568}}  640 * 1136
 iphone6 6s:    {{0, 0}, {375, 667}}  750 * 1334
 6Plus 6sPlus:  {{0, 0}, {414, 736}}  1242 * 2208
*/

/** 硬件尺寸信息 */

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
#define isPad           ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)



/** 系统版本信息 */

#define IOS7        ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IOS8        ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS9        ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define IOS10       ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
#define IOSVersion  [[UIDevice currentDevice] systemVersion]



/** 常用宏定义 */

#define kUserDefaults               [NSUserDefaults standardUserDefaults]
#define kNotificationCenter         [NSNotificationCenter defaultCenter]
#define kApplication                [UIApplication sharedApplication]
#define kAppDelegate                (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define kWindow                     [[UIApplication sharedApplication] keyWindow]
#define kFileManager                [NSFileManager defaultManager]
#define kDevice                     [UIDevice currentDevice]
#define kBundle                     [NSBundle mainBundle]
#define kInfoDictionary             [[NSBundle mainBundle] infoDictionary]
#define kDocumentPath               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kBundleLoadNibName(name)    [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] lastObject]
#define kUUIDStr [[[UIDevice currentDevice] identifierForVendor] UUIDString]  // 设备的udid



/** APP版本号 */
#define kAppVersion         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
/** APP Build 版本号 (每次打包时递增 +1) */
#define kAppBuildVersion    [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
/** APP名字 */
#define kAppDisplayName     [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]

/** 当前语言 */
#define kAppLocalLanguage   [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode]
/** 当前国家 */
#define kAppLocalCountry    [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode]



/** 常用 */

#define URLWithString(str)      [NSURL URLWithString:str]
#define StringWithInt(num)      [NSString stringWithFormat:@"%d", (num)]
#define NumberWithInt(num)      [NSNumber numberWithInt: (num)]



/** 懒人拼接参数 */
#define Parameters2(str1, str2)             [NSString stringWithFormat:@"%@&%@",        str1, str2]
#define Parameters3(str1, str2, str3)       [NSString stringWithFormat:@"%@&%@&%@",     str1, str2, str3]
#define Parameters4(str1, str2, str3, str4) [NSString stringWithFormat:@"%@&%@&%@&%@",  str1, str2, str3, str4]

/** 懒人拼接字符串 */
#define StringWithFomat2(str1, str2)             [NSString stringWithFormat:@"%@%@",     str1, str2]
#define StringWithFomat3(str1, str2, str3)       [NSString stringWithFormat:@"%@%@%@",   str1, str2, str3]
#define StringWithFomat4(str1, str2, str3, str4) [NSString stringWithFormat:@"%@%@%@%@", str1, str2, str3, str4]




/**  打印函数 */

/*
#ifndef __OPTIMIZE__    /// 仅调试环境打印，生产环境不打印

#define NSLog(...) NSLog(__VA_ARGS__)
 
#else   /// 生产环境不打印

#define NSLog(...) {}

#endif

*/


/**  打印函数 */

#ifndef __OPTIMIZE__    /// 仅调试环境打印，生产环境不打印

#define NSLog(...) NSLog(__VA_ARGS__)
#define CMLog(FORMAT, ...) fprintf(stderr, "%s [%s: %d行] %s\n", \
        [[NSString stringWithFormat:@"%@", [[NSDate date] dateString]] UTF8String],\
        [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],\
        __LINE__, \
        [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

#else   /// 生产环境不打印

#define NSLog(...) {}
#define CMLog(FORMAT, ...) nil

#endif



/** 用得不多 */

#define kCellLineColor          RGBColor_f(0xdddddd)  // cell分隔线
#define RELEASE_SAFELY(_a)      {if(_a){[_a release];_a = nil;}}
/** 判断设备室真机还是模拟器 */
#if TARGET_OS_IPHONE
#endif

#if TARGET_IPHONE_SIMULATOR
#endif

/** 判断系统为64位还是32位 */
//#if __LP64__
//NSLog(@"64");
//#else
//NSLog(@"64");
//#endif

/** 当前使用Xcode iPhone OS SDK 的版本 */
//#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_0
//NSLog(@"当前使用Xcode iPhone OS SDK 8.0 以后版本的处理");
//#else
//NSLog(@"当前使用Xcode iPhone OS SDK 8.0 之前版本的处理");
//#endif



/** 系统控件的默认高度 */
#define kSTATUS_BAR_H   (20.f)
#define kNAV_BAR_H      (44.f)
#define kTAB_BAR_H      (49.f)
#define kCELL_H         (44.f)

/** 中英状态下键盘的高度 */
#define kEN_KEY_BOARD_H  (216.f)
#define kCH_KEY_BOARD_H  (252.f)



// MARK:- 颜色相关
#define kBlackColor     [UIColor blackColor]      // 0.0 white
#define kDarkGrayColor  [UIColor darkGrayColor]   // 0.333 white
#define kLightGrayColor [UIColor lightGrayColor]  // 0.667 white
#define kWhiteColor     [UIColor whiteColor]      // 1.0 white
#define kGrayColor      [UIColor grayColor]       // 0.5 white
#define kRedColor       [UIColor redColor]        // 1.0, 0.0, 0.0 RGB
#define kGreenColor     [UIColor greenColor]      // 0.0, 1.0, 0.0 RGB
#define kBlueColor      [UIColor blueColor]       // 0.0, 0.0, 1.0 RGB
#define hCyanColor      [UIColor cyanColor]       // 0.0, 1.0, 1.0 RGB
#define hYellowColor    [UIColor yellowColor]     // 1.0, 1.0, 0.0 RGB
#define hMagentaColor   [UIColor magentaColor]    // 1.0, 0.0, 1.0 RGB
#define kOrangeColor    [UIColor orangeColor]     // 1.0, 0.5, 0.0 RGB
#define kPurpleColor    [UIColor purpleColor]     // 0.5, 0.0, 0.5 RGB
#define hBrownColor     [UIColor brownColor]      // 0.6, 0.4, 0.2 RGB
#define kClearColor     [UIColor clearColor]      // 0.0 white, 0.0 alpha
#define RGBColor(_r, _g, _b)        [UIColor colorWithRed:(_r)/255.0 green:(_g)/255.0 blue:(_b)/255.0 alpha:1.0f]
#define RGBColor_a(_r, _g, _b, _a)  [UIColor colorWithRed:(_r)/255.0 green:(_g)/255.0 blue:(_b)/255.0 alpha:_a]
#define RGBColor_f(_f)              [UIColor colorWithRed:((float)((_f & 0xFF0000) >> 16))/255.0 green:((float)((_f & 0xFF00)>> 8))/255.0 blue:((float) (_f & 0xFF))/255.0 alpha:1.0f]


/** 字体相关 */
#define FontSize(_size)       [UIFont systemFontOfSize:_size]
#define HeiTiFont(_size)      [UIFont fontWithName:@"HelveticaNeue" size:_size]


/** 资源路径 */
#define kPATH_PNG(NAME) [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"]
#define kPATH_JPG(NAME) [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]
#define kPATH(NAME,EXT) [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]


/** 加载图片 */
#define ImageNamed(_name)       [UIImage imageNamed:_name]
#define IMAGE_FILE_PNG(NAME)    [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define IMAGE_FILE_JPG(NAME)    [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define IMAGE_FILE(NAME,EXT)    [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]


/** 用得不多 */
#define kCellLineColor          RGBColor_f(0xdddddd)  // cell分隔线





#endif


