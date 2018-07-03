//
//  UITableView+More.h
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (More)

/// 实例化 Frame + 类型 + 代理
+ (UITableView *)TableViewWithFrame:(CGRect)rect tableViewStyle:(UITableViewStyle)style delegate:(id)delegate dataSourec:(id)dataSource;

@end
