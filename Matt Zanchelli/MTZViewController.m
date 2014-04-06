//
//  MTZViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/3/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZViewController.h"

@interface MTZViewController ()

@end

@implementation MTZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

/// Tapped the button for the "About Me" section.
- (IBAction)tappedAboutMeSectionButton:(id)sender
{
	NSLog(@"About Me");
}

/// Tapped the button for the "Background" section.
- (IBAction)tappedBackgroundSectionButton:(id)sender
{
	NSLog(@"Background");
}

/// Tapped the button for the "Projects" section.
- (IBAction)tappedProjectsSectionButton:(id)sender
{
	NSLog(@"Projects");
}

#pragma mark - UIViewController Misc.

- (BOOL)prefersStatusBarHidden
{
	return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
