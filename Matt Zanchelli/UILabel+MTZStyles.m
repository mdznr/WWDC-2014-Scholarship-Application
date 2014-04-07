//
//  UILabel+MTZStyles.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/7/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "UILabel+MTZStyles.h"

@implementation UILabel (MTZStyles)

- (void)applyMTZStyle:(MTZStyle)style
{
	switch ( style ) {
		case MTZStyleName:
			[self applyMTZStyleName];
			break;
		case MTZStylePersonalDescription:
			[self applyMTZStylePersonalDescription];
			break;
		default:
			break;
	}
}

- (void)applyMTZStyleName
{
	// Set the proper font.
	self.font = [UIFont fontForName];
	
	// Set the proper text color.
	self.textColor = [UIColor blackColor];
	
	// Get the attributed string.
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
	
	// Add the paragraph style.
	NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
	paragrahStyle.lineSpacing = 0.0f;
	paragrahStyle.alignment = NSTextAlignmentCenter;
	[attributedString addAttribute:NSParagraphStyleAttributeName
							 value:paragrahStyle
							 range:NSMakeRange(0, attributedString.length)];
	self.attributedText = attributedString;
}

- (void)applyMTZStylePersonalDescription
{
	// Set the proper font.
	self.font = [UIFont fontForPersonalDescription];
	
	// Set the proper text color.
	self.textColor = [UIColor colorWithWhite:0.6f alpha:1.0f];
	
	// Get the attributed string.
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
	
	// Add the paragraph style.
	NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
	paragrahStyle.lineSpacing = 5.0f; // 26.0f - 21.0f
	paragrahStyle.alignment = NSTextAlignmentCenter;
	[attributedString addAttribute:NSParagraphStyleAttributeName
							 value:paragrahStyle
							 range:NSMakeRange(0, attributedString.length)];
	self.attributedText = attributedString;
}

@end
