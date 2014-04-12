//
//  UIFont+MTZStyles.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/7/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "UIFont+MTZStyles.h"

@implementation UIFont (MTZStyles)

#pragma mark - Navigation Bar

+ (instancetype)fontForSectionButton
{
	return [UIFont fontWithName:@"MyriadPro-Regular" size:16];
}


#pragma mark - About

+ (instancetype)fontForName
{
	return [UIFont fontWithName:@"MyriadPro-Regular" size:55];
//	return [UIFont fontWithName:@"MyriadSetPro-Thin" size:55];
}

+ (instancetype)fontForPersonalDescription
{
	return [UIFont fontWithName:@"MyriadSetPro-Thin" size:21];
}

+ (instancetype)fontForInterestDescription
{
	return [UIFont fontWithName:@"MyriadPro-Regular" size:14];
}


#pragma mark - Background

+ (instancetype)fontForEventDate
{
//	return [UIFont fontWithName:@"MyriadPro-Regular" size:18];
	return [UIFont fontWithName:@"MyriadSetPro-Thin" size:18];
}

+ (instancetype)fontForEventTitle
{
	return [UIFont fontWithName:@"MyriadPro-Bold" size:18];
//	return [UIFont fontWithName:@"MyriadPro-Regular" size:18];
}

+ (instancetype)fontForEventDetail
{
	return [UIFont fontWithName:@"MyriadPro-Regular" size:18];
//	return [UIFont fontWithName:@"MyriadSetPro-Thin" size:18];
}


#pragma mark - Projects

+ (instancetype)fontForProjectTitle
{
//	return [UIFont fontWithName:@"MyriadSetPro-Thin" size:55];
	return [UIFont fontWithName:@"MyriadPro-Regular" size:55];
}

+ (instancetype)fontForProjectDescription
{
	return [UIFont fontWithName:@"MyriadSetPro-Thin" size:21];
//	return [UIFont fontWithName:@"MyriadSetPro-Regular" size:21];
}

+ (instancetype)fontForSectionHeader
{
	return [UIFont fontWithName:@"MyriadSetPro-Thin" size:34];
}

+ (instancetype)fontForSectionDescriptionFirstLine
{
	return [UIFont fontWithName:@"MyriadPro-Bold" size:18];
}

+ (instancetype)fontForSectionDescription
{
	return [UIFont fontWithName:@"MyriadPro-Regular" size:18];
}

+ (instancetype)fontForSectionQuote
{
	return [UIFont fontWithName:@"MyriadSetPro-Thin" size:18];
}

+ (instancetype)fontForSectionAnnotation
{
	// TODO: Italics?
	return [UIFont fontWithName:@"MyriadPro-Regular" size:18];
}


@end
