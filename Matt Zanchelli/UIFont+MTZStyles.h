//
//  UIFont+MTZStyles.h
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/7/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (MTZStyles)

#pragma mark - Navigation Bar

///	The font used for buttons for each section in the navigation bar.
+ (instancetype)fontForSectionButton;


#pragma mark - About

///	The font used for my name.
+ (instancetype)fontForName;

/// The font used for my personal description.
+ (instancetype)fontForPersonalDescription;

///	The font used for each interest's description.
+ (instancetype)fontForInterestDescription;

@end
