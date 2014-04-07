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
	
	// Load About view controller by default.
	[self performSegueWithIdentifier:@"About Me" sender:self];
}


#pragma mark - Containing View Controller

///	Set the containing view controller.
///	@param containingViewController The view controller to set as the containing view controller.
- (void)setContainingViewController:(UIViewController *)containingViewController
{
	// Hide old child view controller.
	[self hideChildViewController:_containingViewController];
	
	// Update to the new child view controller.
	_containingViewController = containingViewController;
	[self addChildViewController:_containingViewController];
}

///	Add a child view controller.
///	@param childController The child view controller to add.
- (void)addChildViewController:(UIViewController *)childController
{
	[super addChildViewController:childController];
	[self.containerView addSubview:childController.view];
	[childController didMoveToParentViewController:self];
}

///	Hide a child view controller.
///	@param childController The child view controller to hide.
- (void)hideChildViewController:(UIViewController *)childController
{
	[childController willMoveToParentViewController:nil];
	[childController.view removeFromSuperview];
	[childController removeFromParentViewController];
}


#pragma mark - Actions

/// Tapped the button for the "About Me" section.
/// @param sender The segment that was tapped.
- (IBAction)tappedAboutMeSectionButton:(id)sender
{
	[self performSegueWithIdentifier:@"About Me" sender:self];
	[self updateSelectedSegment:sender];
}

/// Tapped the button for the "Background" section.
/// @param sender The segment that was tapped.
- (IBAction)tappedBackgroundSectionButton:(id)sender
{
	[self performSegueWithIdentifier:@"Background" sender:self];
	[self updateSelectedSegment:sender];
}

/// Tapped the button for the "Projects" section.
/// @param sender The segment that was tapped.
- (IBAction)tappedProjectsSectionButton:(id)sender
{
	[self performSegueWithIdentifier:@"Projects" sender:self];
	[self updateSelectedSegment:sender];
}

/// Update the position of the selected segment view to represent the selected segment.
///	@param sender The segment that was selected.
- (void)updateSelectedSegment:(id)sender
{
	[UIView animateWithDuration:0.5f
						  delay:0.0f
		 usingSpringWithDamping:0.75f
		  initialSpringVelocity:0.0f
						options:UIViewAnimationOptionBeginFromCurrentState
					 animations:^{
						 self.selectedView.center = CGPointMake(((UIView *)sender).center.x, self.selectedView.center.y);
					 }
					 completion:^(BOOL finished) {}];
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
