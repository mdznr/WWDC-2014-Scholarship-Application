//
//  MTZBackgroundViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/6/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZBackgroundViewController.h"

#import "MTZTimelineEvent.h"
#import "MTZTimelineEventView.h"

@interface MTZBackgroundViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *content;

@end

@implementation MTZBackgroundViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.tableView.contentInset = UIEdgeInsetsMake(44+31, 0, 0, 0);
	
	MTZTimelineEvent *event1 = [MTZTimelineEvent eventWithDate:@"Dec. 2004"
														 title:@"Bought my first iPod."
												   description:@"As I unboxed the silver iPod mini, my eyes lit up. I suddenly knew what I would be doing for the rest of my life: building incredible products and customer experiences like this one. Every day of my life is working towards that goal."];
	
	MTZTimelineEvent *event2 = [MTZTimelineEvent eventWithDate:@"Aug. 2006"
														 title:@"Bought my first Mac."
												   description:@"After a couple years of collecting iPods, I knew it was time to also get a Mac. I used them occasionally at school and found them to be much more enjoyable to use than any other computer I had ever used before."];
	
	MTZTimelineEvent *event3 = [MTZTimelineEvent eventWithDate:@"Aug. 2007"
														 title:@"Started High School."
												   description:@"By this time, I was developing my interest in design. I spent a lot of time on design forums, like MacThemes, where I was inspired by and learned from fantastic Mac designers. I started designing icons and user interfaces for fun."];
	
	MTZTimelineEvent *event4 = [MTZTimelineEvent eventWithDate:@"Oct. 2007"
														 title:@"Began Freelancing."
												   description:@"I had enough experience with designing and building websites that I could do freelance design and web work. I loved my time designing logos, business cards, and websites for friends and locals in my community."];
	
	MTZTimelineEvent *event5 = [MTZTimelineEvent eventWithDate:@"Apr. 2008"
														 title:@"Started DJ BMZ."
												   description:@"I became very interested in music and started collecting equipment to playback and manipulate music. My neighbour and I started DJing parties and other events. Eventually that turned into a profitable business that’s still running to this day."];
	
	MTZTimelineEvent *event6 = [MTZTimelineEvent eventWithDate:@"Aug. 2011"
														 title:@"Started College."
												   description:@"I figured out that the design I’m most interested in was in software, so I decided to go to school for Computer Science. I met by best friend, Peter, who taught me how to take what I learned in class and build native apps for Mac and iOS."];
	
	self.content = @[event1, event2, event3, event4, event5, event6];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	[self.tableView flashScrollIndicators];
}

- (void)flashScrollIndicators
{
	[self.tableView flashScrollIndicators];
}

- (void)scrollToTop
{
	[self.tableView setContentOffset:CGPointMake(0, -self.tableView.contentInset.top) animated:YES];
}


#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Event"];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Event"];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	
	UIView *timelineStripeView = [[UIView alloc] initWithFrame:CGRectMake(128, 0, 1, cell.frame.size.height)];
	timelineStripeView.backgroundColor = [UIColor colorWithWhite:0.85f alpha:1.0f];
	[cell.contentView addSubview:timelineStripeView];
	
	MTZTimelineEvent *event = (MTZTimelineEvent *) self.content[indexPath.row];
	MTZTimelineEventView *eventView = [[MTZTimelineEventView alloc] initWithTimelineEvent:event];
	[cell.contentView addSubview:eventView];
	
	return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.content.count;
}

@end
