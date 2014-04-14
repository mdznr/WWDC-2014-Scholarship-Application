//
//  MTZProjectsViewController.h
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/6/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MTZSectionViewControllerProtocol.h"

@interface MTZProjectsViewController : UIPageViewController <MTZSectionViewControllerProtocol>

///	A Boolean value that determines whether scrolling is enabled.
/// @discussion If the value of this property is @c YES , scrolling is enabled, and if it is @c NO , scrolling is disabled. The default is @c YES. When scrolling is disabled, the scroll view does not accept touch events; it forwards them up the responder chain.
@property (nonatomic, getter = isScrollEnabled) BOOL scrollEnabled;

@end
