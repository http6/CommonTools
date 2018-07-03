//
//  NSDate+More.h
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (More)

// Format："MM月dd日 E HH:mm:ss"
// 结果：05月25日 星期三 16:20:12
// 更多格式，参考图片：Data格式定义.png

#pragma mark - 实例方法

/// 获取默认格式的时间戳 yyyy-MM-dd HH:mm:ss
- (NSString *)dateString;

/// 获取指定格式的时间戳 yyyy-MM-dd HH:mm:ss
- (NSString *)dateStringWithFormat:(NSString *)format;

/// 获取日期里的一部分（如果是要获取周几的话，周日为一个星期的第一天）
- (NSInteger)valueForComponent:(NSCalendarUnit)unit;


#pragma mark - 类方法

/// 获取一个自定义的时间
+ (NSDate *)getDateWithYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day;
+ (NSDate *)getDateWithYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day Hour:(NSInteger)hour Minute:(NSInteger)minute Second:(NSInteger)second;


@end
