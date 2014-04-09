//
//  MTZHoneycrispProjectViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/8/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZHoneycrispProjectViewController.h"

@interface MTZHoneycrispProjectViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *honeycrisp;
@property (weak, nonatomic) IBOutlet UILabel *description;

@end

@implementation MTZHoneycrispProjectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	[self.honeycrisp applyMTZStyle:MTZStyleProjectTitle];
	[self.description applyMTZStyle:MTZStyleProjectDescription];
}

@end
