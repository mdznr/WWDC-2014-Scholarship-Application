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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.tableView.contentInset = UIEdgeInsetsMake(44+31, 0, 0, 0);
	
	MTZTimelineEvent *event1 = [MTZTimelineEvent eventWithDate:@"Dec 2004"
														 title:@"Bought my first iPod."
												   description:@"As I unboxed the silver iPod mini, my eyes lit up. I suddenly knew what I would be doing for the rest of my life: building incredible products and customer experiences like this one. Everyday of my life is working towards that goal."];
	
	MTZTimelineEvent *event2 = [MTZTimelineEvent eventWithDate:@"Dec 2004"
														 title:@"Bought my first iPad."
												   description:@"As I unboxed the silver iPod mini, my eyes lit up. I suddenly knew what I would be doing for the rest of my life: building incredible products and customer experiences like this one. Everyday of my life is working towards that goal."];
	
	MTZTimelineEvent *event3 = [MTZTimelineEvent eventWithDate:@"Dec 2004"
														 title:@"Bought my first iPod sock."
												   description:@"As I unboxed the silver iPod mini, my eyes lit up. I suddenly knew what I would be doing for the rest of my life: building incredible products and customer experiences like this one. Everyday of my life is working towards that goal."];
	
	self.content = @[event1, event2, event3];
}


#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Event"];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Event"];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	
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


#pragma mark - UITableViewDelegate


#pragma mark - UIViewController Misc.

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
