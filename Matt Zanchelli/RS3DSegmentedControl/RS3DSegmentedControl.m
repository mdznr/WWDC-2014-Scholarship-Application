//
//  RS3DSegmentedControl.m
//  RS3DSegmentedControl
//
//  Created by Ron Soffer on 12/15/13.
//  Copyright (c) 2013 Ron Soffer. All rights reserved.
//

#import "RS3DSegmentedControl.h"

@interface RS3DSegmentedControl () <iCarouselDelegate, iCarouselDataSource>

///	The carousel.
@property (strong, nonatomic) iCarousel *carousel;

///	Whether or not the delegate was just set.
@property (nonatomic) BOOL delegateJustSet;

@end

@implementation RS3DSegmentedControl

- (id)init
{
	self = [super init];
	if (self) {
		[self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self commonInit];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self commonInit];
    }
    return self;
}

- (void)commonInit
{
	static UIImageView *bg = nil;
	if ( !bg ) {
		NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
		NSString *bundlePath = [resourcePath stringByAppendingPathComponent:@"RS3DSegmentedControl.bundle"];
		NSString *imagePath = [bundlePath stringByAppendingPathComponent:@"RS3DSegmentedControlBg.png"];
		
		bg = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:imagePath]];
	}
	
	[self addSubview:bg];
	
	_carousel = [[iCarousel alloc] initWithFrame:self.bounds];
	_carousel.backgroundColor = [UIColor clearColor];
	_carousel.type = iCarouselTypeCustom;
	_carousel.decelerationRate = 0.6f;
	_carousel.scrollSpeed = 0.5f;
	_carousel.stopAtItemBoundary = NO;
	_carousel.dataSource = self;
	
	// Defaults
	self.textColor = [UIColor blackColor];
	self.font = [UIFont systemFontOfSize:17.0f];
	
	[self addSubview:_carousel];
	
	self.layer.shouldRasterize = YES;
	self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)setDelegate:(id<RS3DSegmentedControlDelegate>)delegate
{
    _delegate = delegate;
    
    NSUInteger itemToScrollTo = 0;
    
    [_carousel scrollByNumberOfItems:_carousel.numberOfItems + itemToScrollTo duration:0.9f];
    
    _delegateJustSet = YES;
    
    _carousel.delegate = self;
    
    [_carousel reloadData];
}

- (NSUInteger)selectedSegmentIndex
{
    return _carousel.currentItemIndex;
}

- (void)setSelectedSegmentIndex:(NSUInteger)selectedSegmentIndex animated:(BOOL)animated
{
    [_carousel scrollToItemAtIndex:selectedSegmentIndex animated:animated];
}

- (void)setSelectedSegmentIndex:(NSUInteger)selectedSegmentIndex
{
    [self setSelectedSegmentIndex:selectedSegmentIndex animated:YES];
}


#pragma mark iCarousel Delegate Protocol

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [_delegate numberOfSegmentsIn3DSegmentedControl:self];
}

- (UIView *)carousel:(iCarousel *)carousel
  viewForItemAtIndex:(NSUInteger)index
		 reusingView:(UIView *)view
{
    if ( !view ) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, self.frame.size.height)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
        label.backgroundColor = [UIColor clearColor];
		label.textColor = self.textColor;
		label.font = self.font;
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = 1;
        
        [view addSubview:label];
    }
    
    UILabel *label = (UILabel *)[view viewWithTag:1];
    
    label.text = [_delegate titleForSegmentAtIndex:index segmentedControl:self];
    
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index;
{
    
}

- (CGFloat)carousel:(iCarousel *)carousel
	 valueForOption:(iCarouselOption)option
		withDefault:(CGFloat)value;
{
    switch ( option ) {
        case iCarouselOptionWrap:
            return NO;
        case iCarouselOptionFadeMax:
            return 0.0f;
        case iCarouselOptionFadeMin:
            return 0.0f;
        case iCarouselOptionFadeRange:
            return 3.0f;
        case iCarouselOptionOffsetMultiplier:
            return 1.0f;
        default:
            return value;
    }
}

- (CATransform3D)carousel:(iCarousel *)carousel
   itemTransformForOffset:(CGFloat)offset
			baseTransform:(CATransform3D)transform
{
	// The number of items in the carousel, if it were fully circular.
    NSUInteger count = 1280;
    
	// The spacing between items.
    CGFloat spacing = 1.2f;
    
    CGFloat arc = M_PI * 1.0f;
    
    CGFloat radius = fmaxf(100 * spacing / 2.0f, 100 * spacing / 2.0f / tanf(arc/2.0f/count));
    CGFloat angle = offset / count * arc;
    
    return CATransform3DTranslate(transform, radius * sin(angle), 0.0f, radius * cos(angle) - radius);
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
    if ( _delegateJustSet ) {
        _delegateJustSet = NO;
        return;
    }

    [_delegate didSelectSegmentAtIndex:carousel.currentItemIndex segmentedControl:self];
}

@end
