//
//  MTZPageViewController.h
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/8/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTZPageViewController : UIViewController

///	The index of the page view controller.
@property (assign, nonatomic) NSInteger index;

///	Scroll to the top of the page.
- (void)scrollToTop;

@end
