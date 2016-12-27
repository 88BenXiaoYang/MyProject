//
//  UIPlaceHolderTextView.m
//  Apps
//
//  Created by BianYong on 16/12/27.
//  Copyright © 2016年 BY. All rights reserved.
//

#import "UIPlaceHolderTextView.h"

@interface UIPlaceHolderTextView ()

@property (nonatomic, strong) UILabel *placeHolderLabel;

@end

@implementation UIPlaceHolderTextView
#pragma mark- Live circle
- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self initWithSetting];
	}
	return self;
}

- (void)dealloc
{
	self.placeHolder = nil;
	self.placeHolderColor = nil;
	_placeHolderLabel = nil;
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark- Overwrite
- (void)drawRect:(CGRect)rect
{
	MISLogFunc
	if( [[self placeHolder] length] > 0 ) {
		[self addSubview:self.placeHolderLabel];
		_placeHolderLabel.text = self.placeHolder;
		[_placeHolderLabel sizeToFit];
		[self sendSubviewToBack:_placeHolderLabel];
	}
	
	if( [[self text] length] == 0 && [[self placeHolder] length] > 0 )
	{
		[[self viewWithTag:999] setAlpha:1];
	}
	
	[super drawRect:rect];
}

- (void)setText:(NSString *)text {
	[super setText:text];
	[self textChanged:nil];
}

#pragma mark- Delegate
#pragma mark- Notification methods
- (void)textChanged:(NSNotification *)notification
{
	if ([[self placeHolder] length] == 0) {
		return;
	}
	
	if([[self text] length] == 0) {
		[[self viewWithTag:999] setAlpha:1];
	} else {
		[[self viewWithTag:999] setAlpha:0];
	}
}

#pragma mark- Interface methods
#pragma mark- Event Response methods
#pragma mark- Net request
#pragma mark- Private methods
- (void)initWithSetting
{
	MISLogFunc
	[self setPlaceHolder:@""];
	[self setPlaceHolderColor:[UIColor lightGrayColor]];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

#pragma mark- Setter and getter
- (UILabel *)placeHolderLabel
{
	if (!_placeHolderLabel) {
		_placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8,8,self.bounds.size.width - 16,0)];
		_placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
		_placeHolderLabel.numberOfLines = 0;
		_placeHolderLabel.font = self.font;
		_placeHolderLabel.backgroundColor = [UIColor clearColor];
		_placeHolderLabel.textColor = self.placeHolderColor;
		_placeHolderLabel.alpha = 0;
		_placeHolderLabel.tag = 999;
	}
	return _placeHolderLabel;
}

@end
