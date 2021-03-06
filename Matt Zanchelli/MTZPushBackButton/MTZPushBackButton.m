//
//  MTZPushBackButton.m
//
//  Created by Matt on 8/17/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZPushBackButton.h"

#define GOLDEN_RATIO 1.61803398875f
#define ANIMATION_DURATION 0.1618f
//#define ANIMATION_DURATION 1.0f

#define UIViewAutoresizingFlexibleSize (UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth)

@interface MTZPushBackButton ()

///	The view containing the highlight.
@property (strong, nonatomic) UIView *highlightView;

///	The touches on the control.
@property (strong, nonatomic) NSMutableSet *myTouches;

@end

@implementation MTZPushBackButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self setup];
	}
	return self;
}

- (id)init
{
	self = [super init];
	if (self) {
		[self setup];
	}
	return self;
}

- (void)setup
{
	self.layer.zPosition = 100.0f;
	
	_highlightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
	_highlightView.opaque = NO;
	_highlightView.hidden = YES;
	_highlightView.layer.opacity = 0.0f;
	[self addSubview:_highlightView];
	
	_myTouches = [[NSMutableSet alloc] init];
}


#pragma mark Touches

- (CGPoint)averagePointOfTouches:(NSSet *)touches
{
	CGFloat x = 0.0f;
	CGFloat y = 0.0f;
	for ( UITouch *touch in touches ) {
		CGPoint point = [touch locationInView:self];
		x += point.x;
		y += point.y;
	}
	x /= touches.count;
	y /= touches.count;
	
	return (CGPoint) {x, y};
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
	return [super pointInside:point withEvent:event];
//	return YES;
}

// TODO: Use Gesture Recognizers.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[_myTouches unionSet:touches];
	
	CGPoint point = [self averagePointOfTouches:_myTouches];
	
	if ( ![self pointInside:point withEvent:event] ) {
		return;
	}
	
	[UIView animateWithDuration:ANIMATION_DURATION
						  delay:0.0f
		 usingSpringWithDamping:1.0f
		  initialSpringVelocity:1.0f
						options:UIViewAnimationOptionLayoutSubviews |
								UIViewAnimationOptionAllowAnimatedContent |
								UIViewAnimationOptionAllowUserInteraction |
								UIViewAnimationOptionBeginFromCurrentState
					 animations:^(void){
						 [self pushBackAtPoint:point];
						 [self highlightAtPoint:point];
					 }
					 completion:nil];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	[_myTouches unionSet:touches];
	for ( UITouch* touch in touches ) {
		CGPoint point = [touch locationInView:self];
		// TODO: this should be to the original frame (not the transformed frame)
		if ( ![self pointInside:point withEvent:event] ) {
			[self touchesCancelled:[NSSet setWithObject:touch] withEvent:event];
		}
	}
	
	// No touches are inside. Cancel them.
	if ( !_myTouches.count ) {
		[self touchesCancelled:touches withEvent:event];
	}
	
	CGPoint avgPoint = [self averagePointOfTouches:_myTouches];
	
	[UIView animateWithDuration:1.0f/60.0f // Set to be accurate to how often refresh of touches is.
						  delay:0.0f
						options:UIViewAnimationOptionCurveLinear |
	                            UIViewAnimationOptionBeginFromCurrentState
					 animations:^{
						 [self pushBackAtPoint:avgPoint];
						 [self highlightAtPoint:avgPoint]; // This should probably not be average point
					 }
					 completion:^(BOOL finished) {}];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	[_myTouches minusSet:touches];
	
	if ( _myTouches.count ) {
		// TODO: this is a bit of a hack
		[self touchesMoved:_myTouches withEvent:event];
	} else {
		[self revertToNormalPerspective];
		[self stopHighlight];
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[_myTouches minusSet:touches];
	
	if ( _myTouches.count ) {
		// TODO: this is a bit of a hack
		[self touchesMoved:_myTouches withEvent:event];
	} else {
		[self revertToNormalPerspective];
		[self stopHighlight];
	}
}

- (void)pushBackAtPoint:(CGPoint)point
{
	CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
	rotationAndPerspectiveTransform.m34 = 1.0 / -500;
	
	// Calculate the y coordinate
	CGFloat width = self.frame.size.width;
	CGFloat y = point.x / width;
	y = (2.0f * y) - 1.0f;
	
	// Calculate the x coordinate
	CGFloat height = self.frame.size.height;
	CGFloat x = point.y / height;
	x = (2.0f * x) - 1.0f;
	x *= -1;
	
	// Calculate the partial angle (from 0 to angle)
	CGFloat angle = 8 * GOLDEN_RATIO;
	CGFloat distance = sqrt((x*x) + (y*y));
	angle *= distance;
	
	// Calculate scale
	CGFloat largestSideLength = MAX(self.frame.size.width, self.frame.size.height);
	// Find scale of the size reduce by 4 points on largest side
	CGFloat scale = 1.0f - (2.0f / largestSideLength);
	
	rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, angle * M_PI / 180.0f, x, y, 0.0f);
	rotationAndPerspectiveTransform = CATransform3DScale(rotationAndPerspectiveTransform, scale, scale, 1.0f);
	
	self.layer.transform = rotationAndPerspectiveTransform;
}

- (void)revertToNormalPerspective
{
	[UIView animateWithDuration:ANIMATION_DURATION
						  delay:0.0f
		 usingSpringWithDamping:1.0f
		  initialSpringVelocity:1.0f
						options:UIViewAnimationOptionLayoutSubviews |
	                            UIViewAnimationOptionAllowAnimatedContent |
	                            UIViewAnimationOptionAllowUserInteraction
					 animations:^(void){
						 self.layer.transform = CATransform3DIdentity;
					 }
					 completion:nil];
}


#pragma mark Highlighting

- (void)setHighlightColor:(UIColor *)highlightColor
{
	_highlightColor = highlightColor;
	_highlightView.backgroundColor = highlightColor;
}

- (void)setHighlightType:(MTZPushBackButtonTouchHighlight)highlightType
{
	_highlightType = highlightType;
	switch ( highlightType ) {
		case MTZPushBackButtonTouchHighlightTapArea:
			_highlightView.frame = (CGRect){0, 0, 40, 40};
			_highlightView.autoresizingMask = UIViewAutoresizingNone;
			// TODO: highlightView should be circular and diffused
			break;
		case MTZPushBackButtonTouchHighlightWholeControl:
			_highlightView.frame = self.bounds;
			_highlightView.autoresizingMask = UIViewAutoresizingFlexibleSize;
			_highlightView.layer.mask = _highlightMask;
			break;
		case MTZPushBackButtonTouchHighlightNone:
			_highlightView.frame = CGRectZero;
			break;
		default:
			break;
	}
}

- (void)setHighlightMask:(CALayer *)highlightMask
{
	_highlightMask = highlightMask;
	
	if ( self.highlightType == MTZPushBackButtonTouchHighlightWholeControl ) {
		_highlightView.layer.mask = highlightMask;
	}
}

- (void)highlightAtPoint:(CGPoint)point
{
	[_highlightView removeFromSuperview];
	
	// Don't highlight
	if ( _highlightType == MTZPushBackButtonTouchHighlightNone ) {
		return;
	}
	
	[self addSubview:_highlightView];
	
	switch ( _highlightType ) {
		case MTZPushBackButtonTouchHighlightTapArea:
			// TODO: this looks goofy when appearing in an animation
			_highlightView.center = point;
		case MTZPushBackButtonTouchHighlightWholeControl:
			_highlightView.hidden = NO;
			_highlightView.layer.opacity = 1.0f;
			break;
		case MTZPushBackButtonTouchHighlightNone:
		default:
			break;
	}
}

- (void)stopHighlight
{
	_highlightView.hidden = YES;
	_highlightView.layer.opacity = 0.0f;
}

@end
