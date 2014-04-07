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
		case MTZStyleName: {
		} break;
		case MTZStylePersonalDescription: {
			self.font = [UIFont fontForPersonalDescription];
			NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
			NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
			paragrahStyle.lineSpacing = 5.0f; // 26.0f - 21.0f
			paragrahStyle.alignment = NSTextAlignmentCenter;
			[attributedString addAttribute:NSParagraphStyleAttributeName
									  value:paragrahStyle
									  range:NSMakeRange(0, attributedString.length)];
			self.attributedText = attributedString;
			self.textColor = [UIColor colorWithWhite:0.6f alpha:1.0f];
		} break;
		default: {
		} break;
	}
}

@end
