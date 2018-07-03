//
//  AlertView.m
//   
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import "UIAlertView+More.h"

@implementation UIAlertView (More)

/// 显示简单弹窗
+ (void)showAlertViewWithMessage:(NSString *)message fromVC:(UIViewController *)vc
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        UIAlertController *alertCtl = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
        [alertCtl addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [vc presentViewController:alertCtl animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

/// 指定时间后自动消失的提示窗
+ (void)showMessage:(NSString*)message time:(float)time
{
    CGSize size = [self getSizeForText:message font:[UIFont systemFontOfSize:16] withConstrainedSize:CGSizeMake(280, 200)];
    
    if(size.width < 50) {
        size.width = 50;
    }
    if(size.height < 40) {
        size.height = 40;
    }
    
    UILabel *label = [self LabelWithFrame:CGRectMake(0, 0, size.width + 20, size.height + 10) withText:message withTextColor:[UIColor whiteColor] withFont:16 withTextAlignment:NSTextAlignmentCenter withBackColor:[UIColor blackColor]];
    [label.layer setCornerRadius:10.0];
    label.clipsToBounds = YES;
    label.alpha = 0;
    [label setCenter:[UIApplication sharedApplication].keyWindow.center];
    [[UIApplication sharedApplication].keyWindow addSubview:label];
    
    [UIView animateWithDuration:0.3 animations:^{
        label.alpha = 0.8;
    }];
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        
        [NSThread sleepForTimeInterval:time];
    });
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.3 animations:^{
                label.alpha = 0;
            } completion:^(BOOL finished) {
                [label removeFromSuperview];
            }];
        });
    });
}

/// 指定时间后自动消失的提示窗 并指定显示的中心点
+ (void)showMessage:(NSString*)message time:(float)time center:(CGPoint)point
{
    CGSize size = [self getSizeForText:message font:[UIFont systemFontOfSize:16] withConstrainedSize:CGSizeMake(280, 200)];
    
    if(size.width < 50) {
        size.width = 50;
    }
    if(size.height < 40) {
        size.height = 40;
    }
    
    UILabel *label = [self LabelWithFrame:CGRectMake(0, 0, size.width + 20, size.height + 10) withText:message withTextColor:[UIColor whiteColor] withFont:16 withTextAlignment:NSTextAlignmentCenter withBackColor:[UIColor blackColor]];
    [label.layer setCornerRadius:10.0];
    label.clipsToBounds = YES;
    //    [label setCornerRadius:size.width/10.0 andBorderWidth:0 andBorderColor:nil];
    //    [label.layer setBorderWidth:0];
    
    label.alpha = 0;
    [label setCenter:point];
    [[UIApplication sharedApplication].keyWindow addSubview:label];
    
    [UIView animateWithDuration:0.3 animations:^{
        label.alpha = 0.8;
    }];
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        
        [NSThread sleepForTimeInterval:time];
        
    });
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.3 animations:^{
                label.alpha = 0;
            } completion:^(BOOL finished) {
                [label removeFromSuperview];
            }];
        });
    });
}



/////////////////////////////////////////



/// 动态获取文字所占长宽
+ (CGSize)getSizeForText:(NSString *)text font:(UIFont *)font withConstrainedSize:(CGSize)size
{
    CGSize newSize;
    
#ifdef __IPHONE_7_0
    NSDictionary *attribute = @{NSFontAttributeName: font};
    newSize = [text boundingRectWithSize:size options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
#else
    newSize = [text sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
#endif
    
    return newSize;
}

/// 快速构建
+ (UILabel *)LabelWithFrame:(CGRect)rect withText:(NSString *)text withTextColor:(UIColor *)textColor withFont:(int)fontSize withTextAlignment:(NSTextAlignment)alignment withBackColor:(UIColor *)backColor
{
    UILabel *label        = [[UILabel alloc] initWithFrame:rect];
    label.text            = text;
    label.textColor       = textColor;
    label.font            = [UIFont systemFontOfSize:fontSize];
    label.textAlignment   = alignment;
    label.backgroundColor = backColor;
    return label;
}


@end
