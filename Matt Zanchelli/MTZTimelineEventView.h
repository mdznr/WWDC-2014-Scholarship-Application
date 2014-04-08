//
//  MTZTimelineEventView.h
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/8/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTZTimelineEventView : UIView

///	Date of the event (as a string).
@property (nonatomic, copy) NSString *date;

///	The title of the event.
@property (nonatomic, copy) NSString *title;

///	Description of the event.
@property (nonatomic, copy) NSString *description;

@end
