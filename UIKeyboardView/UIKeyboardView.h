//
//  UIKeyboardView.h
//
//
//  Created by user on 15/1/1.
//  Copyright 2015 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIKeyboardViewDelegate;

@interface UIKeyboardView : UIView
{
	UIToolbar *keyboardToolbar;
}

@property (nonatomic, assign) id <UIKeyboardViewDelegate> delegate;

@end


@interface UIKeyboardView (UIKeyboardViewAction)

- (UIBarButtonItem *)itemForIndex:(NSInteger)itemIndex;

@end


@protocol UIKeyboardViewDelegate <NSObject>

- (void)toolbarButtonTap:(UIButton *)button;

@optional

@end
