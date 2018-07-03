//
//  UITableView+More.m
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import "UITableView+More.h"

@implementation UITableView (More)

/// 实例化 Frame + 类型 + 代理
+ (UITableView *)TableViewWithFrame:(CGRect)rect tableViewStyle:(UITableViewStyle)style delegate:(id)delegate dataSourec:(id)dataSource
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:rect style:style];
    tableView.delegate     = delegate;
    tableView.dataSource   = dataSource;
    
    return tableView;
}

@end
