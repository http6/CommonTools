//
//  SuperTableVC.h
//  MyProject
//
//  Created by cnmobi on 16/11/22.
//  Copyright © 2016年 cnmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperTableVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

/// 主滚动视图
@property (strong, nonatomic) IBOutlet UITableView *mTable;

@end
