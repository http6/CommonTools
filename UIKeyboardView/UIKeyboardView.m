//
//  UIKeyboardView.m
//
//
//  Created by user on 15/1/1.
//  Copyright 2015 apple. All rights reserved.
//

#import "UIKeyboardView.h"


@implementation UIKeyboardView

@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
		keyboardToolbar = [[UIToolbar alloc] initWithFrame:frame];
		
		keyboardToolbar.barStyle = UIBarStyleBlackTranslucent;
		
		UIBarButtonItem *previousBarItem = [[UIBarButtonItem alloc] initWithTitle: NSLocalizedString(@"前一项", @"previous") style:UIBarButtonItemStyleBordered target:self action:@selector(toolbarButtonTap:)];
		previousBarItem.tag=1;
		
		UIBarButtonItem *nextBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"后一项", @"next") style:UIBarButtonItemStyleBordered target:self action:@selector(toolbarButtonTap:)];
		nextBarItem.tag=2;
		
		UIBarButtonItem *spaceBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
																					  target:nil
																					  action:nil];
		
		UIBarButtonItem *doneBarItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"完成", @"done")
																		style:UIBarButtonItemStyleBordered
																	   target:self
																	   action:@selector(toolbarButtonTap:)];
		doneBarItem.tag=3;
		
		[keyboardToolbar setItems:[NSArray arrayWithObjects:previousBarItem, nextBarItem, spaceBarItem, doneBarItem, nil]];
		[self addSubview:keyboardToolbar];
    }
    return self;
}

- (void)toolbarButtonTap:(UIButton *)button
{
	if ([self.delegate respondsToSelector:@selector(toolbarButtonTap:)])
    {
		[self.delegate toolbarButtonTap:button];
	}
}

@end

@implementation UIKeyboardView (UIKeyboardViewAction)

//根据index找出对应的UIBarButtonItem
- (UIBarButtonItem *)itemForIndex:(NSInteger)itemIndex
{
	if (itemIndex < [[keyboardToolbar items] count])
    {
		return [[keyboardToolbar items] objectAtIndex:itemIndex];
	}
	return nil;
}

@end
