//
//  UIKeyboardViewController.h
//
//
//  Created by user on 15/1/1.
//  Copyright 2015 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIKeyboardView.h"

#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]   //返回当前系统版本号

@protocol UIKeyboardViewControllerDelegate;

@interface UIKeyboardViewController : NSObject <UITextFieldDelegate, UIKeyboardViewDelegate, UITextViewDelegate>
{
	CGRect keyboardBounds;
	UIKeyboardView *keyboardToolbar;
    UIView *objectView;
}

@property (nonatomic, assign) id <UIKeyboardViewControllerDelegate> boardDelegate;

@end


@interface UIKeyboardViewController (UIKeyboardViewControllerCreation)

- (id)initWithControllerDelegate:(id <UIKeyboardViewControllerDelegate>)delegateObject;

@end


@interface UIKeyboardViewController (UIKeyboardViewControllerAction)

- (void)addToolbarToKeyboard;

@end


@protocol UIKeyboardViewControllerDelegate <NSObject>

@optional

- (BOOL)alttextFieldShouldBeginEditing:(UITextField *)textField;
- (void)alttextFieldDidEndEditing:(UITextField *)textField;
- (BOOL)alttextViewEditing:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

- (void)alttextViewDidEndEditing:(UITextView *)textView;
- (void)alttextViewDidBeginEditing:(UITextView *)textView;

@end
