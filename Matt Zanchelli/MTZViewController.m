//
//  MTZViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/3/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZViewController.h"

@interface MTZViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation MTZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - Containing View Controller

- (void)setContainingViewController:(UIViewController *)containingViewController
{
	_containingViewController = containingViewController;
	[self addChildViewController:_containingViewController];
}

- (void)addChildViewController:(UIViewController *)childController
{
	[super addChildViewController:childController];
	
	NSLog(@"%@", self.containerView.subviews);
#warning remove previous view on containerView
	[self.containerView addSubview:childController.view];
	
	[childController didMoveToParentViewController:self];
}


#pragma mark - Actions

/// Tapped the button for the "About Me" section.
- (IBAction)tappedAboutMeSectionButton:(id)sender
{
	NSLog(@"About Me");
	[self performSegueWithIdentifier:@"About Me" sender:self];
}

/// Tapped the button for the "Background" section.
- (IBAction)tappedBackgroundSectionButton:(id)sender
{
	NSLog(@"Background");
	[self performSegueWithIdentifier:@"Background" sender:self];
}

/// Tapped the button for the "Projects" section.
- (IBAction)tappedProjectsSectionButton:(id)sender
{
	NSLog(@"Projects");
	[self performSegueWithIdentifier:@"Projects" sender:self];
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
