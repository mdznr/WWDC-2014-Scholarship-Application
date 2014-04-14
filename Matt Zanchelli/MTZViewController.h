//
//  MTZViewController.h
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/3/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PSPushPopPressView.h"

@interface MTZViewController : UIViewController <PSPushPopPressViewDelegate>

///	The section view controller to display.
@property (nonatomic) UIViewController *containingViewController;

@end
