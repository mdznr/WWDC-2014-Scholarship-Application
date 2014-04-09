//
//  MTZAboutViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/6/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZAboutViewController.h"

@interface MTZAboutViewController ()

///	The label for my name.
@property (weak, nonatomic) IBOutlet UILabel *name;

///	The label for my personal description.
@property (weak, nonatomic) IBOutlet UILabel *description;

///	The label mentioning my other interests.
@property (weak, nonatomic) IBOutlet UILabel *interests;

///	Labels below each interest.
@property (weak, nonatomic) IBOutlet UILabel *biking;
@property (weak, nonatomic) IBOutlet UILabel *music;
@property (weak, nonatomic) IBOutlet UILabel *photography;

@end

@implementation MTZAboutViewController

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
	
	[self.name applyMTZStyle:MTZStyleName];
	[self.description applyMTZStyle:MTZStylePersonalDescription];
	[self.interests applyMTZStyle:MTZStylePersonalDescription];
	[self.biking applyMTZStyle:MTZStyleInterestDescription];
	[self.music applyMTZStyle:MTZStyleInterestDescription];
	[self.photography applyMTZStyle:MTZStyleInterestDescription];
}

- (void)flashScrollIndicators
{
	
}

- (void)scrollToTop
{
	
}

@end
