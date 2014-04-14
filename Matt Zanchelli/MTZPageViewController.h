//
//  MTZPageViewController.h
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/8/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MTZPageViewController;

@protocol MTZPageViewControllerDelegate <NSObject>

///	Tells the delegate that the page view controller did scroll.
///	@param pageViewController The instance of @c MTZPageViewController.
///	@param offset The offset of the scroll position.
- (void)pageViewControllerDidScroll:(MTZPageViewController *)pageViewController offset:(CGPoint)offset;

@end


@interface MTZPageViewController : UIViewController <UIScrollViewDelegate>

///	The delegate to send messages to.
@property (nonatomic, weak) id<MTZPageViewControllerDelegate> delegate;

///	The index of the page view controller.
@property (assign, nonatomic) NSInteger index;

///	Flash the scrollview's scroll indicators.
- (void)flashScrollIndicators;

///	Scroll to the top of the page.
- (void)scrollToTop;

@end
