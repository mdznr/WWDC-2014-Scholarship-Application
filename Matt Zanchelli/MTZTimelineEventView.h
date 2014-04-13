//
//  MTZTimelineEventView.h
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/8/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MTZTimelineEvent.h"


@interface MTZTimelineEventView : UIView

///	Set up a timeline event view with a timeline event object.
///	@param timelineEvent The timeline event object to create the view from.
- (void)setUpWithTimelineEvent:(MTZTimelineEvent *)timelineEvent;

///	Date of the event (as a string).
@property (nonatomic, copy) NSString *date;

///	The title of the event.
@property (nonatomic, copy) NSString *title;

///	Description of the event.
@property (nonatomic, copy) NSString *description;

///	An image corresponding to the event.
@property (nonatomic, copy) UIImage *image;

@end
