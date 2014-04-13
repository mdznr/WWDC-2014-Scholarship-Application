//
//  MTZTimelineEventView.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/8/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZTimelineEventView.h"

#import "PSPushPopPressView/PSPushPopPressView.h"
#import "CGRectManipulation.h"

@interface MTZTimelineEventView ()

///	Label for the date.
@property (strong, nonatomic) UILabel *dateLabel;

///	Label for the title.
@property (strong, nonatomic) UILabel *titleLabel;

///	Label for the description.
@property (strong, nonatomic) UILabel *descriptionLabel;

///	The view to load content to expand/manipulate.
@property (strong, nonatomic) PSPushPopPressView *pushPopPressView;

///	The original frame for @c pushPopPressView.
@property (nonatomic) CGRect pushPopPressViewFrame;

///	The image view to put the image in.
@property (strong, nonatomic) UIImageView *photoView;

///	The mark on the timeline for the event.
@property (strong, nonatomic) UIImageView *dotView;

///	The vertical stripe representing the timeline.
@property (strong, nonatomic) UIView *timelineStripeView;

@end

@implementation MTZTimelineEventView

- (void)setUpWithTimelineEvent:(MTZTimelineEvent *)timelineEvent
{
	self.date = timelineEvent.date;
	self.title = timelineEvent.title;
	self.description = timelineEvent.description;
	self.image = timelineEvent.image;
}

/*
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self setUpMTZTimeLineEventView];
	}
	return self;
}
 */

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
		[self setUpMTZTimeLineEventView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		[self setUpMTZTimeLineEventView];
    }
    return self;
}

- (id)init
{
	self = [super init];
	if (self) {
        // Initialization code
		[self setUpMTZTimeLineEventView];
    }
    return self;
}

- (void)setUpMTZTimeLineEventView
{	
	// Set up frame.
	self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, 1024, 130);
	
	self.timelineStripeView = [[UIView alloc] initWithFrame:CGRectMake(128, 0, 1, 130)];
	[self addSubview:self.timelineStripeView];
	
	// Add dot view.
	self.dotView = [[UIImageView alloc] initWithFrame:CGRectMake(123, 11, 11, 11)];
	self.dotView.image = [UIImage imageNamed:@"Timeline-Dot"];
	[self addSubview:self.dotView];
	
	// Add PPP view.
	self.pushPopPressViewFrame = CGRectMake(660, 0, 344, 150);
	self.pushPopPressView = [[PSPushPopPressView alloc] initWithFrame:self.pushPopPressViewFrame];
	self.pushPopPressView.backgroundColor = [UIColor whiteColor];
	[self addSubview:self.pushPopPressView];
	
	// Add image view.
	self.photoView = [[UIImageView alloc] initWithFrame:self.pushPopPressView.bounds];
	self.photoView.backgroundColor = [UIColor blackColor];
	self.photoView.opaque = YES;
	self.photoView.clipsToBounds = YES;
	self.photoView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.photoView.contentMode = UIViewContentModeScaleAspectFit;// UIViewContentModeScaleAspectFill;
#warning The delegate should be the corresponding view controller.
//	self.photoView.pushPopPressViewDelegate = self;
	[self.pushPopPressView addSubview:self.photoView];
	
	// Set up labels frames.
	self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(21, 5, 88, 25)];
	self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(148, 5, 472, 25)];
	self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(148, 29, 472, 100)];
	
	// Set backgrounds.
	self.dateLabel.backgroundColor = [UIColor whiteColor];
	self.titleLabel.backgroundColor = [UIColor whiteColor];
	self.descriptionLabel.backgroundColor = [UIColor whiteColor];
	self.dotView.backgroundColor = [UIColor whiteColor];
	self.timelineStripeView.backgroundColor = [UIColor colorWithWhite:0.85f alpha:1.0f];
	
	// Make views opaque.
	self.dateLabel.opaque = YES;
	self.titleLabel.opaque = YES;
	self.descriptionLabel.opaque = YES;
	self.dotView.opaque = YES;
	self.timelineStripeView.opaque = YES;
	
	// Set up number of lines.
	self.dateLabel.numberOfLines = 1;
	self.titleLabel.numberOfLines = 1;
	self.descriptionLabel.numberOfLines = 0;
	
	// Add to view hierachy.
	[self addSubview:self.dateLabel];
	[self addSubview:self.titleLabel];
	[self addSubview:self.descriptionLabel];
	
	// Set default text.
	[self setDate:@"Feb 1993"];
	[self setTitle:@"Event Title."];
	[self setDescription:@"Event description."];
}


#pragma mark - Properties

- (void)setDate:(NSString *)date
{
	_date = date;
	self.dateLabel.text = date;
	[self.dateLabel applyMTZStyle:MTZStyleEventDate];
}

- (void)setTitle:(NSString *)title
{
	_title = title;
	self.titleLabel.text = title;
	[self.titleLabel applyMTZStyle:MTZStyleEventTitle];
}

- (void)setDescription:(NSString *)description
{
	_description = description;
	self.descriptionLabel.text = description;
	[self.descriptionLabel applyMTZStyle:MTZStyleEventDetail];
}

- (void)setImage:(UIImage *)image
{
	if ( !image ) {
		_image = nil;
		self.photoView.image = nil;
		return;
	}
	
	_image = image;
	
	self.photoView.image = image;
	
#warning TODO: set the size of imageView to fit properly.
	CGRect imageRect = CGRectMake(0, 0, _image.size.width, _image.size.height);
	CGRect newFrame = CGRectScaledRectToFitInRect(imageRect, self.pushPopPressViewFrame);
	self.pushPopPressView.frame = newFrame;
}


@end
