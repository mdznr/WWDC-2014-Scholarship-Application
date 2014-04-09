//
//  MTZViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/3/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZViewController.h"

#import "MTZSectionViewControllerProtocol.h"

@interface MTZViewController ()

///	The view to contain the selected section.
@property (weak, nonatomic) IBOutlet UIView *containerView;

///	The index of the selected segment.
@property (nonatomic) NSUInteger index;

///	The view that marks the selected segment.
@property (weak, nonatomic) IBOutlet UIView *selectedView;

@property (weak, nonatomic) IBOutlet UIButton *aboutMeButton;
@property (weak, nonatomic) IBOutlet UIButton *backgroundButton;
@property (weak, nonatomic) IBOutlet UIButton *projectsButton;

@end

@implementation MTZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// Add edge gesture recognizer.
	UIScreenEdgePanGestureRecognizer *edge = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(didPanFromEdge:)];
	edge.minimumNumberOfTouches = 1;
	edge.maximumNumberOfTouches = 1;
	edge.edges = UIRectEdgeLeft|UIRectEdgeRight;
	[self.view addGestureRecognizer:edge];
	
	// Set proper text styles.
	self.aboutMeButton.titleLabel.font = [UIFont fontForSectionButton];
	self.backgroundButton.titleLabel.font = [UIFont fontForSectionButton];
	self.projectsButton.titleLabel.font = [UIFont fontForSectionButton];
	
	_index = -1;
	
	// Load first view controller.
	self.index = 0;
}

- (void)setIndex:(NSUInteger)index
{
	if ( _index == index) {
		// Ask the section to scroll to top.
		[((UIViewController<MTZSectionViewControllerProtocol> *)self.containingViewController) scrollToTop];
		return;
	}
	
	_index = index;
	
	switch ( index ) {
		case 0:
			// Load About view controller by default.
			[self performSegueWithIdentifier:@"About Me" sender:self];
			[self updateSelectedSegment:self.aboutMeButton];
			break;
		case 1:
			[self performSegueWithIdentifier:@"Background" sender:self];
			[self updateSelectedSegment:self.backgroundButton];
			break;
		case 2:
			[self performSegueWithIdentifier:@"Projects" sender:self];
			[self updateSelectedSegment:self.projectsButton];
			break;
		default:
			break;
	}
}

- (IBAction)didPanFromEdge:(UIGestureRecognizer *)sender
{
#warning TODO: Enable scrollview panning horizontally between sections.
	NSLog(@"Did Pan");
	switch ( sender.state ) {
		case UIGestureRecognizerStateBegan:
			break;
		case UIGestureRecognizerStateChanged:
			break;
		case UIGestureRecognizerStateEnded:
			break;
		case UIGestureRecognizerStateCancelled:
			break;
		default:
			break;
	}
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
	childController.view.frame = self.containerView.bounds;
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
	self.index = 0;
}

/// Tapped the button for the "Background" section.
/// @param sender The segment that was tapped.
- (IBAction)tappedBackgroundSectionButton:(id)sender
{
	self.index = 1;
}

/// Tapped the button for the "Projects" section.
/// @param sender The segment that was tapped.
- (IBAction)tappedProjectsSectionButton:(id)sender
{
	self.index = 2;
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
