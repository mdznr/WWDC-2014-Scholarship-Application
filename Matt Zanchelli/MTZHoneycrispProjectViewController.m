//
//  MTZHoneycrispProjectViewController.m
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 4/8/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZHoneycrispProjectViewController.h"

@interface MTZHoneycrispProjectViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *honeycrisp;
@property (weak, nonatomic) IBOutlet UILabel *description;

@property (weak, nonatomic) IBOutlet UILabel *abstract;

@property (weak, nonatomic) IBOutlet UILabel *contextHeader;
@property (weak, nonatomic) IBOutlet UILabel *contextDescription;
@property (weak, nonatomic) IBOutlet UILabel *context1;
@property (weak, nonatomic) IBOutlet UILabel *context2;

@property (weak, nonatomic) IBOutlet UILabel *contentHeader;
@property (weak, nonatomic) IBOutlet UILabel *contentDescription;
@property (weak, nonatomic) IBOutlet UILabel *contentQuote;
@property (weak, nonatomic) IBOutlet UILabel *content1;
@property (weak, nonatomic) IBOutlet UILabel *content2;

@property (weak, nonatomic) IBOutlet UILabel *interactionHeader;
@property (weak, nonatomic) IBOutlet UILabel *interactionDescription;
@property (weak, nonatomic) IBOutlet UILabel *interaction1;
@property (weak, nonatomic) IBOutlet UILabel *interaction1Annotation;
@property (weak, nonatomic) IBOutlet UILabel *interaction2;
@property (weak, nonatomic) IBOutlet UILabel *interaction2Annotation;

@end

@implementation MTZHoneycrispProjectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	[self.honeycrisp applyMTZStyle:MTZStyleProjectTitle];
	[self.description applyMTZStyle:MTZStyleProjectDescription];
	
	// TODO: Apply 26 line height
#warning incorrect line height.
	self.abstract.font = [UIFont fontWithName:@"MyriadSetPro-Thin" size:18.0f];
	
	[self.contextHeader applyMTZStyle:MTZStyleProjectSectionHeader];
	[self.contextDescription applyMTZStyle:MTZStyleProjectSectionDescription];
	[self.context1 applyMTZStyle:MTZStyleProjectSectionDescription];
	[self.context2 applyMTZStyle:MTZStyleProjectSectionDescription];
	
	[self.contentHeader applyMTZStyle:MTZStyleProjectSectionHeader];
	[self.contentDescription applyMTZStyle:MTZStyleProjectSectionDescription];
	[self.contentQuote applyMTZStyle:MTZStyleProjectSectionQuote];
	[self.content1 applyMTZStyle:MTZStyleProjectSectionDescription];
	[self.content2 applyMTZStyle:MTZStyleProjectSectionDescription];
	
	[self.interactionHeader applyMTZStyle:MTZStyleProjectSectionHeader];
	[self.interactionDescription applyMTZStyle:MTZStyleProjectSectionDescription];
	[self.interaction1 applyMTZStyle:MTZStyleProjectSectionDescription];
	[self.interaction1Annotation applyMTZStyle:MTZStyleProjectSectionAnnotation];
	[self.interaction2 applyMTZStyle:MTZStyleProjectSectionDescription];
	[self.interaction2Annotation applyMTZStyle:MTZStyleProjectSectionAnnotation];
}

@end
