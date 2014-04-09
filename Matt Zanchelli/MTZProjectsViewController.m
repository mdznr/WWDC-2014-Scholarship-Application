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
	
	NSString *nibName = self.childViewControllerNibNames[index];
	MTZPageViewController *childViewController = [[MTZPageViewController alloc] initWithNibName:nibName bundle:nil];
	childViewController.index = index;

	return childViewController;
}


#pragma mark - UIPageViewControllerDataSource Delegate

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

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
	// The total number of view controllers.
    return [self.childViewControllerNibNames count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    // The index of the first view controller.
    return 0;
}

@end
