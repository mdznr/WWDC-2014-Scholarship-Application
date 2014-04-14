//
//  MTZPasscodeProjectViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/8/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZPasscodeProjectViewController.h"

@interface MTZPasscodeProjectViewController ()

@property (weak, nonatomic) IBOutlet UILabel *passcode;
@property (weak, nonatomic) IBOutlet UILabel *description;

@property (weak, nonatomic) IBOutlet UILabel *step1Label;
@property (weak, nonatomic) IBOutlet UILabel *step2Label;
@property (weak, nonatomic) IBOutlet UILabel *step3Label;

@end

@implementation MTZPasscodeProjectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	[self.passcode applyMTZStyle:MTZStyleProjectTitle];
	[self.description applyMTZStyle:MTZStyleProjectDescriptionCenter];
	
	[self.step1Label applyMTZStyle:MTZStyleProjectSectionDescription];
	[self.step2Label applyMTZStyle:MTZStyleProjectSectionDescription];
	[self.step3Label applyMTZStyle:MTZStyleProjectSectionDescription];
}

@end
