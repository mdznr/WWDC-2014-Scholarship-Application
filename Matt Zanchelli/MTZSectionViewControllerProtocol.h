//
//  MTZSectionViewControllerProtocol.h
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/9/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTZSectionViewControllerProtocol <NSObject>

///	Flash scroll indicators, if any.
- (void)flashScrollIndicators;

///	Scroll to the top of the view controller.
- (void)scrollToTop;

@end
