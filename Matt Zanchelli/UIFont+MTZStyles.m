//
//  UIFont+MTZStyles.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/7/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "UIFont+MTZStyles.h"

@implementation UIFont (MTZStyles)

+ (instancetype)fontForName
{
	return [UIFont fontWithName:@"MyriadPro-Regular" size:55];
}

+ (instancetype)fontForPersonalDescription
{
	return [UIFont fontWithName:@"MyriadSetPro-Thin" size:21];
}

@end
