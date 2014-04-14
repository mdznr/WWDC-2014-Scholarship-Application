//
//  MTZGoodnightProjectViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/8/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZGoodnightProjectViewController.h"

@interface MTZGoodnightProjectViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *screenshot;

@property (weak, nonatomic) IBOutlet UILabel *goodnight;
@property (weak, nonatomic) IBOutlet UILabel *description;

@property (weak, nonatomic) IBOutlet UILabel *restEasy;
@property (weak, nonatomic) IBOutlet UILabel *restEasy2;

@property (weak, nonatomic) IBOutlet UILabel *haveAGoodNight;
@property (weak, nonatomic) IBOutlet UILabel *haveAGoodNight2;

@property (weak, nonatomic) IBOutlet UILabel *goodMorning;
@property (weak, nonatomic) IBOutlet UILabel *goodMorning2;

@end

@implementation MTZGoodnightProjectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	[self.goodnight applyMTZStyle:MTZStyleProjectTitle];
	[self.description applyMTZStyle:MTZStyleProjectDescription];
	
	[self.restEasy applyMTZStyle:MTZStyleGoodnightSectionTitle];
	[self.haveAGoodNight applyMTZStyle:MTZStyleGoodnightSectionTitle];
	[self.goodMorning applyMTZStyle:MTZStyleGoodnightSectionTitle];
	
	[self.restEasy2 applyMTZStyle:MTZStyleGoodnightSectionSubtitle];
	[self.haveAGoodNight2 applyMTZStyle:MTZStyleGoodnightSectionSubtitle];
	[self.goodMorning2 applyMTZStyle:MTZStyleGoodnightSectionSubtitle];
}


#pragma mark - UIScrollViewDelegate Protocol

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	[super scrollViewDidScroll:scrollView];
	
	NSUInteger page = round(scrollView.contentOffset.y / scrollView.frame.size.height);
	switch (page) {
		case 0:
			self.screenshot.image = [UIImage imageNamed:@"Goodnight-Time Set"];
			break;
		case 1:
			self.screenshot.image = [UIImage imageNamed:@"Goodnight-Alarm"];
			break;
		case 2:
			self.screenshot.image = [UIImage imageNamed:@"Goodnight-Wake Times"];
			break;
		case 3:
			self.screenshot.image = [UIImage imageNamed:@"Goodnight-Good Morning"];
			break;
		default:
			self.screenshot.image = nil;
			break;
	}
}


@end
