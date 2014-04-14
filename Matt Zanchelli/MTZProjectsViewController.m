//
//  MTZProjectsViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/6/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZProjectsViewController.h"

#import "MTZPageViewController.h"

@interface MTZProjectsViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate, MTZPageViewControllerDelegate>

///	The names of the .xib child view controllers.
@property (strong, nonatomic) NSArray *childViewControllerNibNames;

///	The page control to indicate which page is currently shown.
@property (strong, nonatomic) UIPageControl *pageControl;

///	The view behind @c pageControl to aid with readability.
@property (strong, nonatomic) UIView *pageControlHoldingView;

@end

@implementation MTZProjectsViewController

@synthesize scrollEnabled = _scrollEnabled;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.pageControlHoldingView = [[UIView alloc] initWithFrame:CGRectMake(483, 729, 58, 26)];
	self.pageControlHoldingView.layer.cornerRadius = 13.0f;
	self.pageControlHoldingView.backgroundColor = [UIColor whiteColor];
	self.pageControlHoldingView.alpha = 0.93f;
	[self.view addSubview:self.pageControlHoldingView];
	
	self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-31, self.view.frame.size.width, 10)];
	self.pageControl.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
	self.pageControl.numberOfPages = 3;
	self.pageControl.currentPage = 0;
	self.pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:0.0f alpha:0.3f];
	self.pageControl.currentPageIndicatorTintColor = [UIColor colorWithWhite:0.0f alpha:0.8f];
	[self.pageControl addTarget:self action:@selector(pageDidChangeOnPageControl:) forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:self.pageControl];
	
	self.dataSource = self;
	self.delegate = self;
	
	_scrollEnabled = YES;
	
	self.childViewControllerNibNames = @[@"MTZHoneycrispProjectViewController",
										 @"MTZPasscodeProjectViewController",
										 @"MTZGoodnightProjectViewController"];
	
	// Load first view controller.
	[self setViewControllers:@[[self viewControllerAtIndex:0]]
				   direction:UIPageViewControllerNavigationDirectionForward
					animated:NO
				  completion:^(BOOL finished) {}];
}

- (void)setScrollEnabled:(BOOL)scrollEnabled
{
	if ( scrollEnabled == self.scrollEnabled ) {
		return;
	}
	
	_scrollEnabled = scrollEnabled;
	
	for (UIScrollView *view in self.view.subviews) {
		if ([view isKindOfClass:[UIScrollView class]]) {
			view.scrollEnabled = scrollEnabled;
		}
	}
}

- (BOOL)isScrollEnabled
{
	return _scrollEnabled;
}

- (MTZPageViewController *)viewControllerAtIndex:(NSUInteger)index
{
	if ( index >= [self.childViewControllerNibNames count] ) {
		return nil;
	}
	
	NSString *className = self.childViewControllerNibNames[index];
	Class pageViewControllerSubclass = NSClassFromString(className);
	MTZPageViewController *childViewController = [[pageViewControllerSubclass alloc] initWithNibName:className bundle:nil];
	childViewController.delegate = self;
	childViewController.index = index;
	childViewController.view.clipsToBounds = NO;
	
	return childViewController;
}

- (void)pageDidChangeOnPageControl:(UIPageControl *)sender
{
	NSInteger previousPage = ((MTZPageViewController *)[self.viewControllers lastObject]).index;
	NSInteger currentPage = sender.currentPage;
	
	UIPageViewControllerNavigationDirection direction;
	if ( previousPage < currentPage ) {
		direction = UIPageViewControllerNavigationDirectionForward;
	} else if ( previousPage > currentPage ) {
		direction = UIPageViewControllerNavigationDirectionReverse;
	} else {
		return;
	}
	
	MTZPageViewController *viewController = [self viewControllerAtIndex:currentPage];
	[self setViewControllers:@[viewController]
				   direction:direction
					animated:YES
				  completion:^(BOOL finished) {}];
}

- (void)flashScrollIndicators
{
	// Flash scroll indicators for all child view controllers.
	for ( MTZPageViewController *childViewController in self.childViewControllers ) {
		[childViewController flashScrollIndicators];
	}
}

- (void)scrollToTop
{
	// Scroll all child view controllers to the top.
	for ( MTZPageViewController *childViewController in self.childViewControllers ) {
		[childViewController scrollToTop];
	}
}


#pragma mark - UIPageViewControllerDataSource Protocol

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
	  viewControllerBeforeViewController:(UIViewController *)viewController
{
	// Find the index of the current view controller.
	NSUInteger index = [(MTZPageViewController *)viewController index];
	
	// No view controllers before the first one.
	if (index == 0) {
		return nil;
	}
	
	// Return the previous view controller.
	return [self viewControllerAtIndex:--index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
	   viewControllerAfterViewController:(UIViewController *)viewController
{
	// Find the index of the current view controller.
	NSUInteger index = [(MTZPageViewController *)viewController index];
	
	// No view controllers beyond the last one.
	if (index == [self.childViewControllerNibNames count]-1) {
		return nil;
	}
	
	// Return the next view controller.
	return [self viewControllerAtIndex:++index];
}


#pragma mark - UIPageViewControllerDelegate Protocol

- (void)pageViewController:(UIPageViewController *)pageViewController
willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
	// Scroll to the top of the current page if trying to switch pages.
	MTZPageViewController *currentViewController = (MTZPageViewController *) [self.viewControllers lastObject];
	[currentViewController scrollToTop];
}

- (void)pageViewController:(UIPageViewController *)pageViewController
		didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray *)previousViewControllers
	   transitionCompleted:(BOOL)completed
{
	if ( !completed ) {
		return;
	}
	
	// Find the index of current page.
	MTZPageViewController *currentViewController = (MTZPageViewController *) [self.viewControllers lastObject];
	NSUInteger index = currentViewController.index;
//	NSLog(@"%@, %lu", currentViewController, (unsigned long)index);
	self.pageControl.currentPage = index;
}


#pragma mark - MTZPageViewControllerDelegate Protocol

- (void)pageViewControllerDidScroll:(MTZPageViewController *)pageViewController offset:(CGPoint)offset
{
//	NSLog(@"Page view controller did scroll %@", NSStringFromCGPoint(offset) );
	
	CGFloat alpha = 1.0f - (offset.y / (pageViewController.view.frame.size.height/4));
	self.pageControlHoldingView.alpha = alpha;
	self.pageControl.alpha = alpha;
	
	// Do not allow swiping between pages anymore.
	if ( offset.y > (pageViewController.view.frame.size.height/4) ) {
		self.scrollEnabled = NO;
	} else {
		self.scrollEnabled = YES;
	}
}

@end
