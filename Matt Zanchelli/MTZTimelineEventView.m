//
//  MTZTimelineEventView.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/8/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZTimelineEventView.h"

@interface MTZTimelineEventView ()

///	Label for the date.
@property (strong, nonatomic) UILabel *dateLabel;

///	Label for the title.
@property (strong, nonatomic) UILabel *titleLabel;

///	Label for the description.
@property (strong, nonatomic) UILabel *descriptionLabel;

@end

@implementation MTZTimelineEventView

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
	self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, 600, 130);
	
	// Set up labels frames.
	self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(1, 5, 88, 25)];
	self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(128, 5, 472, 25)];
	self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(128, 29, 472, 100)];
	
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


@end
