//
//  MTZGoodnightProjectViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/8/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZGoodnightProjectViewController.h"

@interface MTZGoodnightProjectViewController ()

@property (weak, nonatomic) IBOutlet UILabel *goodnight;
@property (weak, nonatomic) IBOutlet UILabel *description;

@end

@implementation MTZGoodnightProjectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	[self.goodnight applyMTZStyle:MTZStyleProjectTitle];
	[self.description applyMTZStyle:MTZStyleProjectDescription];
}

@end
