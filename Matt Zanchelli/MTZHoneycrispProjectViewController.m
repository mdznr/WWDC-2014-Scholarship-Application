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
@property (weak, nonatomic) IBOutlet UIView *photoCropper;
@property (weak, nonatomic) IBOutlet UIView *photoCropLeft;
@property (weak, nonatomic) IBOutlet UIView *photoCropRight;
@property (weak, nonatomic) IBOutlet UIImageView *photoCrop;
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
	
	self.abstract.font = [UIFont fontWithName:@"MyriadSetPro-Thin" size:18.0f];
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.abstract.text];
	NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
	paragrahStyle.lineSpacing = 8.0f;
	paragrahStyle.alignment = NSTextAlignmentCenter;
	[attributedString addAttribute:NSParagraphStyleAttributeName
							 value:paragrahStyle
							 range:
	 NSMakeRange(0, attributedString.length)];
	self.abstract.attributedText = attributedString;
	
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

- (IBAction)didChangeCropType:(UISegmentedControl *)sender
{
	// Hardcoded positions for performance.
	// Honeycrisp slightly too slow for effective demo.
	void (^animations)() = ^{
		switch ( sender.selectedSegmentIndex ) {
			case 2: // Honeycrisp
			{
				// Shift photo.
				self.photoCrop.frame = CGRectOffset(self.photoCropper.bounds, 27, 0);
				// Bring in crop.
				self.photoCropLeft.frame = CGRectMake(0, 0, 55, self.photoCropper.bounds.size.height);
				self.photoCropRight.frame = CGRectMake(self.photoCropper.bounds.size.width-55, 0, 55, self.photoCropper.bounds.size.height);
			}	break;
			case 1: // Center
			{
				// Reset photo position.
				self.photoCrop.frame = self.photoCropper.bounds;
				// Bring in crop.
				self.photoCropLeft.frame = CGRectMake(0, 0, 55, self.photoCropper.bounds.size.height);
				self.photoCropRight.frame = CGRectMake(self.photoCropper.bounds.size.width-55, 0, 55, self.photoCropper.bounds.size.height);
			}	break;
			case 0: // Original
			{
				// Reset photo position.
				self.photoCrop.frame = self.photoCropper.bounds;
				// Pull back crop.
				self.photoCropLeft.frame = CGRectMake(0, 0, 0, self.photoCropper.bounds.size.height);
				self.photoCropRight.frame = CGRectMake(self.photoCropper.bounds.size.width, 0, 0, self.photoCropper.bounds.size.height);
			}	break;
		}
	};
	
	// Animate.
	[UIView animateWithDuration:0.3f
						  delay:0.0f
						options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut
					 animations:animations
					 completion:^(BOOL finished) {}];
}


@end
