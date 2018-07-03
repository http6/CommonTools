//
//  NSString+More.h
//   
//
//  Created by hubin on 15/1/1.
//  Copyright © 2016年 cnmobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (More)

/// 动态获取文字所占长宽
- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end
