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
		case MTZStyleProjectSectionHeader:
			[self applyMTZStyleProjectSectionHeader];
			break;
		case MTZStyleProjectSectionDescription:
			[self applyMTZStyleProjectSectionDescription];
			break;
		case MTZStyleProjectSectionQuote:
			[self applyMTZStyleProjectSectionQuote];
			break;
		case MTZStyleProjectSectionAnnotation:
			[self applyMTZStyleProjectSectionAnnotation];
			break;
		case MTZStyleGoodnightSectionTitle:
			[self applyMTZStyleGoodnightSectionTitle];
			break;
		case MTZStyleGoodnightSectionSubtitle:
			[self applyMTZStyleGoodnightSectionSubtitle];
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

- (void)applyMTZStyleProjectSectionHeader
{
	self.font = [UIFont fontForSectionHeader];
	
	// Get the attributed string.
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
	
	// Add the paragraph style.
	NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
	paragrahStyle.lineSpacing = -8.0f; // 26 - 34
	paragrahStyle.alignment = NSTextAlignmentLeft;
	[attributedString addAttribute:NSParagraphStyleAttributeName
							 value:paragrahStyle
							 range:NSMakeRange(0, attributedString.length)];
	self.attributedText = attributedString;
}

- (void)applyMTZStyleProjectSectionDescription
{
	self.font = [UIFont fontForSectionDescription];
	
	// Get the attributed string.
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
	
	// Add the paragraph style.
	// Left align, 26pt line spacing.
	NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
	paragrahStyle.lineSpacing = 8.0f; // 26 - 18
	paragrahStyle.alignment = NSTextAlignmentLeft;
	[attributedString addAttribute:NSParagraphStyleAttributeName
							 value:paragrahStyle
							 range:
	 NSMakeRange(0, attributedString.length)];
	
	// Make the first line bold..
	NSRange firstNewline = [self.text rangeOfString:@"\n"];
	NSRange firstLine = NSMakeRange(0, firstNewline.location-1);
	[attributedString addAttribute:NSFontAttributeName
							 value:[UIFont fontForSectionDescriptionFirstLine]
							 range:firstLine];
	
	self.attributedText = attributedString;
}

- (void)applyMTZStyleProjectSectionQuote
{
	self.font = [UIFont fontForSectionQuote];
	
	// Get the attributed string.
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
	
	// Add the paragraph style.
	NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
	paragrahStyle.lineSpacing = 7.0f;
	paragrahStyle.alignment = NSTextAlignmentCenter;
	[attributedString addAttribute:NSParagraphStyleAttributeName
							 value:paragrahStyle
							 range:
	 NSMakeRange(0, attributedString.length)];
	self.attributedText = attributedString;
}

- (void)applyMTZStyleProjectSectionAnnotation
{
	self.font = [UIFont fontForSectionAnnotation];
	self.textColor = [UIColor colorWithWhite:0.5f alpha:1.0f];
	
	// Get the attributed string.
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
	
	// Add the paragraph style.
	NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
	paragrahStyle.lineSpacing = 4.0f;
	paragrahStyle.alignment = NSTextAlignmentCenter;
	[attributedString addAttribute:NSParagraphStyleAttributeName
							 value:paragrahStyle
							 range:
	 NSMakeRange(0, attributedString.length)];
	self.attributedText = attributedString;
}

- (void)applyMTZStyleGoodnightSectionTitle
{
	self.font = [UIFont fontWithName:@"MyriadSetPro-Thin" size:48];
	
	// Get the attributed string.
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
	
	// Add the paragraph style.
	NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
	paragrahStyle.lineSpacing = 16.0f; // 64 - 48
	[attributedString addAttribute:NSParagraphStyleAttributeName
							 value:paragrahStyle
							 range:
	 NSMakeRange(0, attributedString.length)];
	self.attributedText = attributedString;
}

- (void)applyMTZStyleGoodnightSectionSubtitle
{
	self.font = [UIFont fontWithName:@"MyriadSetPro-Thin" size:24];
	self.textColor = [UIColor colorWithWhite:1.0f alpha:0.8f];
	
	// Get the attributed string.
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
	
	// Add the paragraph style.
	NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
	paragrahStyle.lineSpacing = 8.0f; // 32 - 24
	[attributedString addAttribute:NSParagraphStyleAttributeName
							 value:paragrahStyle
							 range:
	 NSMakeRange(0, attributedString.length)];
	self.attributedText = attributedString;
}

@end
