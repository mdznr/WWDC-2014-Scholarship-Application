//
//  MTZAppIcon.m
//  PushBack
//
//  Created by Matt Zanchelli on 1/8/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZAppIcon.h"

#import "UIImage+Alpha.h"
#import "UIImage+Mask.h"

@implementation MTZAppIcon

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self MTZAPPICON_setup];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self MTZAPPICON_setup];
	}
	return self;
}

- (id)init
{
	self = [super init];
	if (self) {
		[self MTZAPPICON_setup];
	}
	return self;
}

- (void)MTZAPPICON_setup
{
	self.opaque = NO;
	self.highlightType = MTZPushBackButtonTouchHighlightWholeControl;
	
	// Translucent black
	self.highlightColor = [UIColor colorWithWhite:0.0f alpha:0.16f];
}

- (void)setIconImage:(UIImage *)iconImage
{
	_iconImage = iconImage;
	
	CGRect iconFrame = (CGRect){0, 0, iconImage.size.width, iconImage.size.height};
	UIBezierPath *round = [UIBezierPath bezierPathWithRoundedRect:iconFrame
													 cornerRadius:iconImage.size.width / 5.0f];
	
	iconImage = [iconImage maskedImageWithBezierPath:round];
	
	// This helps fix aliasing issues on transform
	iconImage = [iconImage transparentBorderImage:1.0f];
	[self setBackgroundImage:iconImage forState:UIControlStateNormal];
	
	// Create mask layer for highlight
	CALayer *mask = [CALayer layer];
	
	// Compenate for transparent border on icon
	mask.frame = CGRectMake(0, 0, iconImage.size.width - 2.0f, iconImage.size.height - 2.0f);
	
	mask.contents = (id) iconImage.CGImage;
	self.highlightMask = mask;
}

@end
