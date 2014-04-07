//
//  MTZViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/3/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZViewController.h"

@interface MTZViewController ()

///	The view to contain the selected section.
@property (weak, nonatomic) IBOutlet UIView *containerView;

///	The view that marks the selected segment.
@property (weak, nonatomic) IBOutlet UIView *selectedView;

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
	// Hide old child view controller.
	[self hideChildViewController:_containingViewController];
	
	// Update to the new child view controller.
	_containingViewController = containingViewController;
	[self addChildViewController:_containingViewController];
}

- (void)addChildViewController:(UIViewController *)childController
{
	[super addChildViewController:childController];
	[self.containerView addSubview:childController.view];
	[childController didMoveToParentViewController:self];
}

- (void)hideChildViewController:(UIViewController *)childController
{
	[childController willMoveToParentViewController:nil];
	[childController.view removeFromSuperview];
	[childController removeFromParentViewController];
}


#pragma mark - Actions

/// Tapped the button for the "About Me" section.
- (IBAction)tappedAboutMeSectionButton:(id)sender
{
	[self performSegueWithIdentifier:@"About Me" sender:self];
}

/// Tapped the button for the "Background" section.
- (IBAction)tappedBackgroundSectionButton:(id)sender
{
	[self performSegueWithIdentifier:@"Background" sender:self];
}

/// Tapped the button for the "Projects" section.
- (IBAction)tappedProjectsSectionButton:(id)sender
{
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
