//
//  MTZTimelineEvent.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/8/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZTimelineEvent.h"

@implementation MTZTimelineEvent

+ (instancetype)eventWithDate:(NSString *)date
						title:(NSString *)title
				  description:(NSString *)description
{
	MTZTimelineEvent *event = [[MTZTimelineEvent alloc] init];
	
	event.date = date;
	event.title = title;
	event.description = description;
	
	return event;
}

@end
