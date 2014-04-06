//
//  MTZStoryboardSegue.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/6/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZStoryboardSegue.h"

#import "MTZViewController.h"

@implementation MTZStoryboardSegue

- (void)perform
{
	((MTZViewController *)self.sourceViewController).containingViewController = self.destinationViewController;
}

@end
