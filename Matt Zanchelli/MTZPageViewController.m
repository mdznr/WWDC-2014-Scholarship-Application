//
//  MTZPageViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/8/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZPageViewController.h"

@interface MTZPageViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *headerView;

@end

@implementation MTZPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.scrollView.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	[self flashScrollIndicators];
}

- (void)flashScrollIndicators
{
	[self.scrollView flashScrollIndicators];
}

- (void)scrollToTop
{
	[self.scrollView setContentOffset:CGPointZero animated:YES];
}


#pragma mark - UIScrollViewDelegate Protocol

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	if ( scrollView.contentOffset.y < 0 ) {
		self.headerView.transform = CGAffineTransformMakeTranslation(0, 2*scrollView.contentOffset.y);
	} else {
		self.headerView.transform = CGAffineTransformIdentity;
	}
	
	// Tell the delegate about this.
	if ( [_delegate respondsToSelector:@selector(pageViewControllerDidScroll:offset:)] ) {
		[_delegate pageViewControllerDidScroll:self offset:self.scrollView.contentOffset];
	}
}

@end
