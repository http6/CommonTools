//
//  NSString+More.m
//
//
//  Created by hubin on 15/1/1.
//  Copyright © 2016年 cnmobi. All rights reserved.
//

#import "NSString+More.h"

@implementation NSString (More)

/// 动态获取文字所占长宽
- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    CGSize newsize;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        NSDictionary *attribute = @{NSFontAttributeName: font};
        CGRect rect = [self boundingRectWithSize:size options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil];
        newsize = rect.size;
    }
    else
    {
#pragma clang diagnostic ignored "-Wdeprecated-declarations"  // "-Wunused-variable"  用于隐藏警告
        newsize = [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    }
    return newsize;
}

@end
