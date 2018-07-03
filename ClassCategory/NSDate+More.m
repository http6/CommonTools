//
//  NSDate+More.m
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import "NSDate+More.h"

@implementation NSDate (More)

#pragma mark - 实例方法

/// 获取默认格式的时间戳 yyyy-MM-dd HH:mm:ss
- (NSString *)dateString
{
    return [self dateStringWithFormat:nil];
}

/// 获取指定格式的时间戳 yyyy-MM-dd HH:mm:ss
- (NSString *)dateStringWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format.length ? format : @"yyyy-MM-dd HH:mm:ss"];
    
    NSString *dateStr = [dateFormatter stringFromDate:self];
    return dateStr;
}

/// 获取日期里的一部分（如果是要获取周几的话，周日为一个星期的第一天）
- (NSInteger)valueForComponent:(NSCalendarUnit)unit
{
    /// 标准日期组件
    NSDateComponents *component = [[NSDateComponents alloc] init];
    
    /// 设置组成部分
    NSInteger unitFlags = unit;
    
    //    NSInteger unitFlags =
    //    NSCalendarUnitYear      |
    //    NSCalendarUnitMonth     |
    //    NSCalendarUnitDay       |
    //    NSCalendarUnitWeekday   |
    //    NSCalendarUnitHour      |
    //    NSCalendarUnitMinute    |
    //    NSCalendarUnitSecond;
    
    /// 得到当前日历里指定时间的结构
    component = [[NSCalendar currentCalendar] components:unitFlags fromDate:self];
    
    //    NSInteger year = [component year];
    
    /// 返回值
    NSInteger value = [component valueForComponent:unit];
    //    NSLog(@"%ld", (long)value);
    
    return value;
}


#pragma mark - 类方法

/// 获取一个自定义的时间
+ (NSDate *)getDateWithYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [gregorian dateFromComponents:components];
    return date;
}
+ (NSDate *)getDateWithYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day Hour:(NSInteger)hour Minute:(NSInteger)minute Second:(NSInteger)second
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    [components setHour:hour];
    [components setMinute:minute];
    [components setSecond:second];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [gregorian dateFromComponents:components];
    return date;
}


//程序中使用的，将日期显示成  2011年4月4日 星期一
+ (NSString *)Date2StrV:(NSDate *)indate{
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]]; //setLocale 方法将其转为中文的日期表达
    dateFormatter.dateFormat = @"yyyy '-' MM '-' dd ' ' EEEE";
    NSString *tempstr = [dateFormatter stringFromDate:indate];
    return tempstr;
}
//程序中使用的，将日期显示成  2011年4月4日
+ (NSString *) Date3StrV:(NSDate *)indate{
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]]; //setLocale 方法将其转为中文的日期表达
    dateFormatter.dateFormat = @"yyyy '-' MM '-' dd";
    NSString *tempstr = [dateFormatter stringFromDate:indate];
    return tempstr;
}


@end
