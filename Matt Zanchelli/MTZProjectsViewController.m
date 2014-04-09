//
//  MTZProjectsViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/6/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZProjectsViewController.h"

#import "MTZPageViewController.h"

@interface MTZProjectsViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

///	The names of the .xib child view controllers.
@property (strong, nonatomic) NSArray *childViewControllerNibNames;

///	The page control to indicate which page is currently shown.
@property (strong, nonatomic) UIPageControl *pageControl;

@end

@implementation MTZProjectsViewController

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
	
	/*
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:emailLabel
														  attribute:NSLayoutAttributeLeft
														  relatedBy:NSLayoutRelationGreaterThanOrEqual
															 toItem:emailField
														  attribute:NSLayoutAttributeLeft
														 multiplier:1.0f
														   constant:0.0f]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:spinner attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:logInButton attribute:NSLayoutAttributeRight multiplier:1.0f constant:10.0f]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:preview attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:preview attribute:NSLayoutAttributeWidth multiplier:0.625f constant:0.0f]];
	 */
	
	self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-31, self.view.frame.size.width, 10)];
	self.pageControl.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
	self.pageControl.numberOfPages = 3;
	self.pageControl.currentPage = 0;
	self.pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:0.5f alpha:0.5f];
	self.pageControl.currentPageIndicatorTintColor = [UIColor colorWithWhite:0.0f alpha:0.75f];
	[self.view addSubview:self.pageControl];
	
	self.dataSource = self;
	self.delegate = self;
	
	self.childViewControllerNibNames = @[@"MTZHoneycrispProjectViewController",
										 @"MTZPasscodeProjectViewController",
										 @"MTZGoodnightProjectViewController"];
	
	// Load first view controller.
	[self setViewControllers:@[[self viewControllerAtIndex:0]]
				   direction:UIPageViewControllerNavigationDirectionForward
					animated:NO
				  completion:^(BOOL finished) {}];
}

- (MTZPageViewController *)viewControllerAtIndex:(NSUInteger)index
{
	if ( index >= [self.childViewControllerNibNames count] ) {
		return nil;
	}
	
	NSString *className = self.childViewControllerNibNames[index];
	Class pageViewControllerSubclass = NSClassFromString(className);
	MTZPageViewController *childViewController = [[pageViewControllerSubclass alloc] initWithNibName:className bundle:nil];
	childViewController.index = index;
	
	return childViewController;
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
		didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray *)previousViewControllers
	   transitionCompleted:(BOOL)completed
{
	if ( !completed ) {
		return;
	}
	
#warning not always accurate.
	
	// Find the index of current page.
	MTZPageViewController *currentViewController = (MTZPageViewController *)[self.viewControllers lastObject];
	NSUInteger index = currentViewController.index;
//	NSLog(@"%@, %lu", currentViewController, (unsigned long)index);
	self.pageControl.currentPage = index;
}

@end
