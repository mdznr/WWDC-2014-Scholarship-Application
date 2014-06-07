//
//  MTZBackgroundViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/6/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZBackgroundViewController.h"

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
	
	MTZTimelineEvent *event0 = [[MTZTimelineEvent alloc] initWithDate:@"Early Life" title:@"Interested in Computers & Computer Graphics." descriptionString:@"As a kid, I was fascinated with computers and what was possible with them. I made artwork in various programs to give to my parents. I much preferred drawing with computer programs over traditional crayons and markers." image:[UIImage imageNamed:@"Computer Graphics.jpg"]];
	
	MTZTimelineEvent *event1 = [[MTZTimelineEvent alloc] initWithDate:@"Dec. 2004" title:@"Owned my first iPod." descriptionString:@"As I unboxed the silver iPod mini, my eyes lit up. I suddenly knew what I would be doing for the rest of my life: building incredible products and customer experiences like this one. Every day of my life is working towards that goal." image:[UIImage imageNamed:@"iPod.jpg"]];
	
	MTZTimelineEvent *event2 = [[MTZTimelineEvent alloc] initWithDate:@"Aug. 2006" title:@"Bought my first Mac." descriptionString:@"After a couple years of collecting iPods, I knew it was time to also get a Mac. I used them occasionally at school and found them to be much more enjoyable to use than any other computer I had ever used before." image:[UIImage imageNamed:@"MacBook.jpg"]];
	
	MTZTimelineEvent *event3 = [[MTZTimelineEvent alloc] initWithDate:@"Aug. 2007" title:@"Started High School." descriptionString:@"By this time, I was developing my interest in design. I spent a lot of time on design forums, like MacThemes, where I was inspired by and learned from fantastic Mac designers. I started designing icons and user interfaces for fun." image:[UIImage imageNamed:@"Started HS.jpg"]];
	
	MTZTimelineEvent *event4 = [[MTZTimelineEvent alloc] initWithDate:@"Oct. 2007" title:@"Began Freelancing." descriptionString:@"I had enough experience with designing and building websites that I could do freelance design and web work. I loved my time designing logos, business cards, and websites for friends and locals in my community." image:[UIImage imageNamed:@"10th Grade.jpg"]];
	
	MTZTimelineEvent *event5 = [[MTZTimelineEvent alloc] initWithDate:@"Apr. 2008" title:@"Started DJ BMZ." descriptionString:@"I became very interested in music and started collecting equipment to playback and manipulate music. My neighbour and I started DJing parties and other events. Eventually that turned into a profitable business that’s still running to this day." image:[UIImage imageNamed:@"DJ BMZ.jpg"]];
	
	MTZTimelineEvent *event6 = [[MTZTimelineEvent alloc] initWithDate:@"Aug. 2011" title:@"Started College." descriptionString:@"I figured out that the design I’m most interested in was in software, so I decided to go to school for Computer Science. I met by best friend, Peter, who taught me how to take what I learned in class and build native apps for Mac and iOS." image:[UIImage imageNamed:@"College.jpg"]];
	
	self.content = @[event0, event1, event2, event3, event4, event5, event6];
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
	
	if ( !cell ) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Event"];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	
	UIView *timelineStripeView = [cell.contentView viewWithTag:222];
	if ( !timelineStripeView ) {
		timelineStripeView = [[UIView alloc] initWithFrame:CGRectMake(128, 0, 1, cell.frame.size.height)];
		timelineStripeView.tag = 222;
		timelineStripeView.backgroundColor = [UIColor colorWithWhite:0.85f alpha:1.0f];
		[cell.contentView addSubview:timelineStripeView];
	}
	
	MTZTimelineEventView *timelineEventView = (MTZTimelineEventView *) [cell.contentView viewWithTag:111];
	if ( !timelineEventView ) {
		timelineEventView = [[MTZTimelineEventView alloc] initWithFrame:cell.bounds];
		timelineEventView.tag = 111;
		[cell.contentView addSubview:timelineEventView];
	}
	
	MTZTimelineEvent *event = (MTZTimelineEvent *) self.content[indexPath.row];
	[timelineEventView setUpWithTimelineEvent:event];
	
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
