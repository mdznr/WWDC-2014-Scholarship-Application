//
//  MTZViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/3/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZViewController.h"

@interface MTZViewController ()

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

@end

@implementation MTZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - UIViewController Misc.

- (BOOL)prefersStatusBarHidden
{
	return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
