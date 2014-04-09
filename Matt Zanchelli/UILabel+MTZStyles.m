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
		case MTZStyleInterestDescription:
			[self applyMTZStyleInterestDescription];
			break;
		case MTZStyleEventDate:
			[self applyMTZStyleEventDate];
			break;
		case MTZStyleEventTitle:
			[self applyMTZStyleEventTitle];
			break;
		case MTZStyleEventDetail:
			[self applyMTZStyleEventDetail];
			break;
		case MTZStyleProjectTitle:
			[self applyMTZStyleProjectTitle];
			break;
		case MTZStyleProjectDescription:
			[self applyMTZStyleProjectDescription];
			break;
		case MTZStyleProjectDescriptionCenter:
			[self applyMTZStyleProjectDescriptionCentered];
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
	self.textColor = [UIColor colorWithWhite:0.5f alpha:1.0f];
	
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

- (void)applyMTZStyleInterestDescription
{
	// Set the proper font.
	self.font = [UIFont fontForInterestDescription];
	
	// Set the proper text color.
	self.textColor = [UIColor colorWithWhite:0.5f alpha:1.0f];
	
	// Get the attributed string.
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
	
	// Add the paragraph style.
	NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
	paragrahStyle.lineSpacing = 2.0f; // 16.0f - 14.0f
	paragrahStyle.alignment = NSTextAlignmentCenter;
	[attributedString addAttribute:NSParagraphStyleAttributeName
							 value:paragrahStyle
							 range:NSMakeRange(0, attributedString.length)];
	self.attributedText = attributedString;
}

- (void)applyMTZStyleEventDate
{
	// Set the proper font.
	self.font = [UIFont fontForEventDate];
	
	// Set the proper text color.
	self.textColor = [UIColor colorWithWhite:0.65f alpha:1.0f];
	
	// Get the attributed string.
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
	
	// Add the paragraph style.
	NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
	paragrahStyle.lineSpacing = 7.0f; // 25 - 18
	paragrahStyle.alignment = NSTextAlignmentRight;
	[attributedString addAttribute:NSParagraphStyleAttributeName
							 value:paragrahStyle
							 range:NSMakeRange(0, attributedString.length)];
	self.attributedText = attributedString;
}

- (void)applyMTZStyleEventTitle
{
	// Set the proper font.
	self.font = [UIFont fontForEventTitle];
	
	// Set the proper text color.
	self.textColor = [UIColor colorWithWhite:0.1f alpha:1.0f];
	
	// Get the attributed string.
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
	
	// Add the paragraph style.
	NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
	paragrahStyle.lineSpacing = 7.0f; // 25 - 18
	paragrahStyle.alignment = NSTextAlignmentLeft;
	[attributedString addAttribute:NSParagraphStyleAttributeName
							 value:paragrahStyle
							 range:NSMakeRange(0, attributedString.length)];
	self.attributedText = attributedString;
}

- (void)applyMTZStyleEventDetail
{
	// Set the proper font.
	self.font = [UIFont fontForEventDetail];
	
	// Set the proper text color.
	self.textColor = [UIColor colorWithWhite:0.33f alpha:1.0f];
	
	// Get the attributed string.
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
	
	// Add the paragraph style.
	NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
	paragrahStyle.lineSpacing = 7.0f; // 25 - 18
	paragrahStyle.alignment = NSTextAlignmentLeft;
	[attributedString addAttribute:NSParagraphStyleAttributeName
							 value:paragrahStyle
							 range:NSMakeRange(0, attributedString.length)];
	self.attributedText = attributedString;
}

- (void)applyMTZStyleProjectTitle
{
	// Set the proper font.
	self.font = [UIFont fontForProjectTitle];
}

- (void)applyMTZStyleProjectDescription
{
	// Set the proper font.
	self.font = [UIFont fontForProjectDescription];
	
	// Get the attributed string.
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
	
	// Add the paragraph style.
	NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
	paragrahStyle.lineSpacing = 5.0f; // 26 - 21
	[attributedString addAttribute:NSParagraphStyleAttributeName
							 value:paragrahStyle
							 range:NSMakeRange(0, attributedString.length)];
	self.attributedText = attributedString;
}

- (void)applyMTZStyleProjectDescriptionCentered
{
	// Set the proper font.
	self.font = [UIFont fontForProjectDescription];
	
	// Get the attributed string.
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
	
	// Add the paragraph style.
	NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
	paragrahStyle.lineSpacing = 5.0f; // 26 - 21
	paragrahStyle.alignment = NSTextAlignmentCenter;
	[attributedString addAttribute:NSParagraphStyleAttributeName
							 value:paragrahStyle
							 range:NSMakeRange(0, attributedString.length)];
	self.attributedText = attributedString;
}

@end
