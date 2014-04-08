//
//  MTZBackgroundViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/6/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZBackgroundViewController.h"

#import "MTZTimelineEventView.h"

@interface MTZBackgroundViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet MTZTimelineEventView *event1;

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
	
	self.event1.date = @"Dec. 2004";
	self.event1.title = @"Bought my first iPod.";
	self.event1.description = @"As I unboxed the silver iPod mini, my eyes lit up. I suddenly knew what I would be doing for the rest of my life: building incredible products and customer experiences like this one. Everyday of my life is working towards that goal.";
}


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
