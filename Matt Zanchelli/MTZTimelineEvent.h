//
//  MTZTimelineEvent.h
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/8/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTZTimelineEvent : NSObject

///	Create a timeline event with a date, title, and description.
///	@param date A string representing the date of the event.
///	@param title The title of the event.
///	@param description The description of the event.
///	@return A newly created @c MTZTimelineEvent with a date, title, and description.
+ (instancetype)eventWithDate:(NSString *)date
						title:(NSString *)title
				  description:(NSString *)description;

///	Date of the event (as a string).
@property (nonatomic, copy) NSString *date;

///	The title of the event.
@property (nonatomic, copy) NSString *title;

///	Description of the event.
@property (nonatomic, copy) NSString *description;

@end
