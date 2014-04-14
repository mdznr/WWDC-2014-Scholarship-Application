//
//  UILabel+MTZStyles.h
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/7/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MTZStyle){
	// About
	MTZStyleName,
	MTZStylePersonalDescription,
	MTZStyleInterestDescription,
	
	// Background
	MTZStyleEventDate,
	MTZStyleEventTitle,
	MTZStyleEventDetail,
	
	// Projects
	MTZStyleProjectTitle,
	MTZStyleProjectDescription,
	MTZStyleProjectDescriptionCenter,
	MTZStyleProjectSectionHeader,
	MTZStyleProjectSectionDescription,
	MTZStyleProjectSectionQuote,
	MTZStyleProjectSectionAnnotation,
	MTZStyleGoodnightSectionTitle,
	MTZStyleGoodnightSectionSubtitle
};

@interface UILabel (MTZStyles)

- (void)applyMTZStyle:(MTZStyle)style;

@end
