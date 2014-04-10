//
//  MTZViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/3/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZViewController.h"

#import "MTZSectionViewControllerProtocol.h"
#import "RS3DSegmentedControl/RS3DSegmentedControl.h"

@interface MTZViewController () <RS3DSegmentedControlDelegate>

///	The view to contain the selected section.
@property (weak, nonatomic) IBOutlet UIView *containerView;

///	The index of the selected segment.
@property (nonatomic) NSUInteger index;

@property (strong, nonatomic) NSArray *segments;

@property (weak, nonatomic) IBOutlet RS3DSegmentedControl *segmentedControl;

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
	edge.edges = UIRectEdgeLeft | UIRectEdgeRight;
	[self.view addGestureRecognizer:edge];
	
	// The title for each segment (corresponds to the names of segues).
	self.segments = @[@"About Me", @"Background", @"Projects"];
	
	self.segmentedControl.font = [UIFont fontForSectionButton];
	self.segmentedControl.delegate = self;
	
	_index = -1;
	
	// Load first view controller.
	[self setSelectedIndex:0];
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

- (void)setSelectedIndex:(NSUInteger)index
{
	// Out of bounds.
	if ( index > [self.segments count] - 1 ) {
		return;
	}
	
	if ( _index == index ) {
		// Ask the section to scroll to top.
		[((UIViewController<MTZSectionViewControllerProtocol> *)self.containingViewController) scrollToTop];
		return;
	}
	
	_index = index;
	
	[self performSegueWithIdentifier:self.segments[index] sender:self];
	
	// Ask child view controller to flash scroll indicators.
	[((UIViewController<MTZSectionViewControllerProtocol> *)self.containingViewController) flashScrollIndicators];
}


#pragma mark - Segmented Control Delegate

- (NSUInteger)numberOfSegmentsIn3DSegmentedControl:(RS3DSegmentedControl *)segmentedControl
{
	return [self.segments count];
}

- (NSString *)titleForSegmentAtIndex:(NSUInteger)segmentIndex
					segmentedControl:(RS3DSegmentedControl *)segmentedControl
{
	return self.segments[segmentIndex];
}

- (void)didSelectSegmentAtIndex:(NSUInteger)segmentIndex
			   segmentedControl:(RS3DSegmentedControl *)segmentedControl
{
	[self setSelectedIndex:segmentIndex];
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

- (IBAction)didChangeSelectedSegment:(UISegmentedControl *)sender
{
	[self setSelectedIndex:sender.selectedSegmentIndex];
}

- (IBAction)didTapSegmentedControl:(UISegmentedControl *)sender
{
	[self setSelectedIndex:sender.selectedSegmentIndex];
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
