//
//  PSPushPopPressView.m
//  PSPushPopPressView
//
//  Based on BSSPushPopPressView by Blacksmith Software.
//

#import "PSPushPopPressView.h"

#import <QuartzCore/QuartzCore.h>

#import "CGRectManipulation.h"

#define kPSAnimationDuration 0.55f
#define kPSAnimationMoveToOriginalPositionDuration 0.45f

#define kPSShadowFadeDuration 0.4f
#define kPSShadowOpacity 0.2f

#define kPSSpringDampingOut 0.7f
#define kPSSpringDampingIn 0.85f
#define kPSSpringVelocityIn 0.5f
#define kPSSpringVelocityOut 1.0f

@interface PSPushPopPressView() {
	UITapGestureRecognizer *_tapRecognizer;
	UILongPressGestureRecognizer *_doubleTouchRecognizer;
	UIPanGestureRecognizer *_panRecognizer;
	CGAffineTransform _scaleTransform;
	CGAffineTransform _rotateTransform;
	CGAffineTransform _panTransform;
	NSInteger _initialIndex;
	BOOL _fullscreenAnimationActive;
	BOOL _anchorPointUpdated;
	
    // Internal state variables.
    UIView *_initialSuperview;
    BOOL _beingDragged;
    BOOL _gesturesEnded;
    BOOL _scaleActive;
}

//	Make these properties modifiable internally.
@property (nonatomic, getter=isBeingDragged) BOOL beingDragged;
@property (nonatomic, getter=isFullscreen) BOOL fullscreen;

///	The bounds of the window.
///	@return The Core Graphics rectangle structure representing the bounds of the window.
- (CGRect)windowBounds;

@end

@implementation PSPushPopPressView

// Adapt frame for fullscreen.
- (void)detectOrientation
{
    if ( self.isFullscreen ) {
        self.frame = [self windowBounds];
    }
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
    if ( self ) {
        self.userInteractionEnabled = YES;
        self.multipleTouchEnabled = YES;

        _scaleTransform = CGAffineTransformIdentity;
        _rotateTransform = CGAffineTransformIdentity;
        _panTransform = CGAffineTransformIdentity;
		_initialIndex = 0;
		_allowSingleTapSwitch = YES;
		_showShadow = YES;
		_retainAspectRatio = NO;

        UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchPanRotate:)];
        pinchRecognizer.cancelsTouchesInView = NO;
        pinchRecognizer.delaysTouchesBegan = NO;
        pinchRecognizer.delaysTouchesEnded = NO;
        pinchRecognizer.delegate = self;
        [self addGestureRecognizer: pinchRecognizer];

        UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(pinchPanRotate:)];
        rotationRecognizer.cancelsTouchesInView = NO;
        rotationRecognizer.delaysTouchesBegan = NO;
        rotationRecognizer.delaysTouchesEnded = NO;
        rotationRecognizer.delegate = self;
        [self addGestureRecognizer: rotationRecognizer];

        _panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget: self action:@selector(pinchPanRotate:)];
        _panRecognizer.cancelsTouchesInView = NO;
        _panRecognizer.delaysTouchesBegan = NO;
        _panRecognizer.delaysTouchesEnded = NO;
        _panRecognizer.delegate = self;
        _panRecognizer.minimumNumberOfTouches = 2;
        _panRecognizer.maximumNumberOfTouches = 2;
        [self addGestureRecognizer:_panRecognizer];

        _tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(tap:)];
        _tapRecognizer.delegate = self;
        _tapRecognizer.cancelsTouchesInView = NO;
        _tapRecognizer.delaysTouchesBegan = NO;
        _tapRecognizer.delaysTouchesEnded = NO;
        [self addGestureRecognizer:_tapRecognizer];

        _doubleTouchRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapped:)];
        _doubleTouchRecognizer.delegate = self;
        _doubleTouchRecognizer.cancelsTouchesInView = NO;
        _doubleTouchRecognizer.delaysTouchesBegan = NO;
        _doubleTouchRecognizer.delaysTouchesEnded = NO;
        _doubleTouchRecognizer.numberOfTouchesRequired = 2;
        _doubleTouchRecognizer.minimumPressDuration = 0.0f;
        [self addGestureRecognizer:_doubleTouchRecognizer];

        self.layer.shadowRadius = 12.0f;
        self.layer.shadowOffset = CGSizeMake(0.0f, 3.0f);
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
        self.layer.shadowOpacity = 0.0f;

        // manually track rotations and adapt fullscreen
        // needed if we rotate within a fullscreen animation and miss the autorotate event
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(detectOrientation)
													 name:UIDeviceOrientationDidChangeNotification
												   object:nil];
    }

    return self;
}

- (void)dealloc
{
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    _delegate = nil;
}

- (void)setFrame:(CGRect)frame
{
	[super setFrame:frame];
	
	if ( ![self.superview isEqual:[self rootView]] ) {
		_initialFrame = self.frame;
	}
}

- (void)setInitialFrame:(CGRect)initialFrame
{
    _initialFrame = initialFrame;

    // If we're not in fullscreen, reset frame.
    if ( !self.isFullscreen ) {
        self.frame = initialFrame;
    }
}

- (UIView *)rootView
{
    return self.window.rootViewController.view;
}

- (CGRect)windowBounds
{
	CGRect windowBounds = [self rootView].bounds;
	
	if ( self.ignoreStatusBar ) {
        windowBounds = [UIScreen mainScreen].bounds;
        if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
            windowBounds.size.width = windowBounds.size.height;
            windowBounds.size.height = [UIScreen mainScreen].bounds.size.width;
        }
    }
	
	if ( self.retainAspectRatio ) {
		windowBounds = CGRectScaledRectToFitInRect(self.frame, windowBounds);
	}
	
	return windowBounds;
}

- (CGRect)superviewCorrectedInitialFrame
{
    UIView *rootView = [self rootView];
    CGRect superviewCorrectedInitialFrame = [rootView convertRect:_initialFrame fromView:_initialSuperview];
    return superviewCorrectedInitialFrame;
}

- (BOOL)detachViewToWindow:(BOOL)enable
{
    BOOL viewChanged = NO;
    UIView *rootView = [self rootView];

    if ( enable && !_initialSuperview ) {
		_initialIndex = [self.superview.subviews indexOfObject:self];
        _initialSuperview = self.superview;
        CGRect newFrame = [self.superview convertRect:_initialFrame toView:rootView];
        [rootView addSubview:self];
        [self setFrame:newFrame];
        viewChanged = YES;
    } else if ( !enable ) {
        if ( _initialSuperview ) {
            [_initialSuperview insertSubview:self atIndex:_initialIndex];
            viewChanged = YES;
        }
        [self setFrame:_initialFrame];
        _initialSuperview = nil;
    }
	
    return viewChanged;
}

- (void)updateShadowPath
{
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
}

- (void)applyShadowAnimated:(BOOL)animated
{
	if ( !_showShadow ) {
		return;
	}
    
	if ( animated ) {
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
        anim.fromValue = [NSNumber numberWithFloat:0.0f];
        anim.toValue = [NSNumber numberWithFloat:kPSShadowOpacity];
        anim.duration = kPSShadowFadeDuration;
        [self.layer addAnimation:anim forKey:@"shadowOpacity"];
    } else {
        [self.layer removeAnimationForKey:@"shadowOpacity"];
    }

    [self updateShadowPath];
    self.layer.shadowOpacity = kPSShadowOpacity;
}

- (void)removeShadowAnimated:(BOOL)animated
{
	if ( !_showShadow ) {
		return;
	}
	
    // TODO: sometimes animates crazy, shadowOpacity animation losses shadowPath transform on certain conditions
    // shadow should also use a "lightSource", maybe it's easier to make a completely custom shadow view.
    if ( animated ) {
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
        anim.fromValue = [NSNumber numberWithFloat:kPSShadowOpacity];
        anim.toValue = [NSNumber numberWithFloat:0.0f];
        anim.duration = kPSShadowFadeDuration;
        [self.layer addAnimation:anim forKey:@"shadowOpacity"];
    } else {
        [self.layer removeAnimationForKey:@"shadowOpacity"];
    }

    self.layer.shadowOpacity = 0.0f;
}

- (void)setBeingDragged:(BOOL)newBeingDragged
{
    if (newBeingDragged != _beingDragged) {
        _beingDragged = newBeingDragged;
		
        if ( _beingDragged ) {
			[self applyShadowAnimated:YES];
        } else {
//			BOOL animate = !self.isFullscreen && !fullscreenAnimationActive_;
			[self removeShadowAnimated:NO]; //TODO: removing this shadow animation fixes the (shadow) problem when coming back from fullscreen, that's a good give-and-take for me. The bool was nice writted but I think something messed up in other parts of the code and the check that creates the bool `animate' are messed up so I fixed that the simple way.
        }
    }
}

- (void)moveViewToOriginalPositionAnimated:(BOOL)animated bounces:(BOOL)bounces
{
    self.fullscreen = NO;

    if ([self.delegate respondsToSelector:@selector(pushPopPressViewWillAnimateToOriginalFrame:duration:)]) {
        [self.delegate pushPopPressViewWillAnimateToOriginalFrame:self duration:kPSAnimationMoveToOriginalPositionDuration*1.5f];
    }
	
	[UIView animateWithDuration:animated ? kPSAnimationMoveToOriginalPositionDuration : 0.0f
						  delay:0.0f
		 usingSpringWithDamping:kPSSpringDampingIn
		  initialSpringVelocity:kPSSpringVelocityIn
						options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction
					 animations:^{
                         // Always reset transforms.
                         _rotateTransform = CGAffineTransformIdentity;
                         _panTransform = CGAffineTransformIdentity;
                         _scaleTransform = CGAffineTransformIdentity;
                         self.transform = CGAffineTransformIdentity;
                         
// TODO: Fix issue of moving frame when it's in a scrollview/tableview.
                         CGRect correctedInitialFrame = [self superviewCorrectedInitialFrame];
						 [self setFrame:correctedInitialFrame];
					 }
					 completion:^(BOOL finished) {
//						NSLog(@"moveViewToOriginalPositionAnimated [complete] finished:%d, bounces:%d", finished, bounces);
						_fullscreenAnimationActive = NO;
						if ( !self.isBeingDragged && finished ) {
							[self detachViewToWindow:NO];
						}
						if ([self.delegate respondsToSelector:@selector(pushPopPressViewDidAnimateToOriginalFrame:)]) {
							[self.delegate pushPopPressViewDidAnimateToOriginalFrame:self];
						}
                     }];
}

- (void)moveToFullscreenAnimated:(BOOL)animated bounces:(BOOL)bounces
{
    if ([self.delegate respondsToSelector:@selector(pushPopPressViewWillAnimateToFullscreenWindowFrame:duration:)]) {
		[self.delegate pushPopPressViewWillAnimateToFullscreenWindowFrame:self duration:kPSAnimationDuration];
    }
	
	BOOL viewChanged = [self detachViewToWindow:YES];
    self.fullscreen = YES;
	
	[UIView animateWithDuration:animated ? kPSAnimationDuration : 0.0f
						  delay:0.0f
		 usingSpringWithDamping:kPSSpringDampingOut
		  initialSpringVelocity:kPSSpringVelocityOut
						options:(viewChanged ? 0 : UIViewAnimationOptionBeginFromCurrentState) | UIViewAnimationOptionAllowUserInteraction
					 animations:^{
                         _scaleTransform = CGAffineTransformIdentity;
                         _rotateTransform = CGAffineTransformIdentity;
                         _panTransform = CGAffineTransformIdentity;
                         self.transform = CGAffineTransformIdentity;
                         CGRect windowBounds = [self windowBounds];
						 [self setFrame:windowBounds];
                     }
                     completion:^(BOOL finished) {
						 if ([self.delegate respondsToSelector:@selector(pushPopPressViewDidAnimateToFullscreenWindowFrame:)]) {
							 [self.delegate pushPopPressViewDidAnimateToFullscreenWindowFrame:self];
						 }
						 _anchorPointUpdated = NO;
                     }];
}

- (void)alignViewAnimated:(BOOL)animated bounces:(BOOL)bounces
{
    if ( self.frame.size.width > [self windowBounds].size.width ) {
        [self moveToFullscreenAnimated:animated bounces:bounces];
    } else {
        [self moveViewToOriginalPositionAnimated:animated bounces:bounces];
    }
}

// Disrupt gesture recognizer, which continues to receive touch events even as we set minimumNumberOfTouches to two.
- (void)resetGestureRecognizers
{
	for ( UIGestureRecognizer *aGestRec in self.gestureRecognizers ) {
		[aGestRec setEnabled:NO];
		[aGestRec setEnabled:YES];
	}
}

- (void)startedGesture:(UIGestureRecognizer *)gesture
{
	[self detachViewToWindow:YES];
    UIPinchGestureRecognizer *pinch = [gesture isKindOfClass:[UIPinchGestureRecognizer class]] ? (UIPinchGestureRecognizer *)gesture : nil;
    _gesturesEnded = NO;
    if ( pinch ) {
        _scaleActive = YES;
    }
}

/*
 When one gesture ends, the whole view manipulation is ended. In case the user also started a pinch and the pinch is still active, we wait for the pinch to finish as we want to check for a fast pinch movement to open the view in fullscreen or not. If no pinch is active, we can end the manipulation as soon as the first gesture ended.
 */
- (void)endedGesture:(UIGestureRecognizer *)gesture
{
    if ( _gesturesEnded ) {
		return;
	}

    UIPinchGestureRecognizer *pinch = [gesture isKindOfClass:[UIPinchGestureRecognizer class]] ? (UIPinchGestureRecognizer *)gesture : nil;
    if ( _scaleActive == YES && pinch == nil ) {
		return;
	}

    _gesturesEnded = YES;
    if ( pinch ) {
        _scaleActive = NO;
        if ( pinch.velocity >= 2.0f ) {
            [self moveToFullscreenAnimated:YES bounces:YES];
        } else {
            [self alignViewAnimated:YES bounces:YES];
        }
    } else {
        [self alignViewAnimated:YES bounces:YES];
    }
}

- (void)modifiedGesture:(UIGestureRecognizer *)gesture
{
    if ( [gesture isKindOfClass:[UIPinchGestureRecognizer class]] ) {
        UIPinchGestureRecognizer *pinch = (UIPinchGestureRecognizer *)gesture;
        _scaleTransform = CGAffineTransformScale(CGAffineTransformIdentity, pinch.scale, pinch.scale);
    }
	
	else if ( [gesture isKindOfClass:[UIRotationGestureRecognizer class]] ) {
        UIRotationGestureRecognizer *rotate = (UIRotationGestureRecognizer *)gesture;
        _rotateTransform = CGAffineTransformRotate(CGAffineTransformIdentity, rotate.rotation);
    }
	
	else if ( [gesture isKindOfClass:[UIPanGestureRecognizer class]] ) {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gesture;
        CGPoint translation = [pan translationInView: self.superview];
        _panTransform = CGAffineTransformTranslate(CGAffineTransformIdentity, translation.x, translation.y);
    }

    self.transform = CGAffineTransformConcat(CGAffineTransformConcat(_scaleTransform, _rotateTransform), _panTransform);
}

// scale and rotation transforms are applied relative to the layer's anchor point
// this method moves a gesture recognizer's view's anchor point between the user's fingers
- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    if ( !_anchorPointUpdated ) {
        UIView *piece = gestureRecognizer.view;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];

        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperview;
        _anchorPointUpdated = YES;
    }
}

- (void)pinchPanRotate:(UIGestureRecognizer *)gesture
{
    switch ( gesture.state ) {
        case UIGestureRecognizerStateBegan: {
            [self adjustAnchorPointForGestureRecognizer:gesture];
            [self startedGesture:gesture];
            break; 
        }
        case UIGestureRecognizerStatePossible: { 
            break;
        }
        case UIGestureRecognizerStateCancelled: {
            [self endedGesture:gesture];
            _anchorPointUpdated= NO;
            break;
        } 
        case UIGestureRecognizerStateFailed: { 
            _anchorPointUpdated = NO;
            break; 
        } 
        case UIGestureRecognizerStateChanged: {
            [self modifiedGesture:gesture];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            _anchorPointUpdated = NO;
            [self endedGesture:gesture];
            break;
        }
    }
}

- (void)doubleTapped:(UITapGestureRecognizer *)gesture
{
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            self.beingDragged = YES;
            if ([self.delegate respondsToSelector:@selector(pushPopPressViewDidStartManipulation:)]) {
                [self.delegate pushPopPressViewDidStartManipulation:self];
            }
            break; 
        }
        case UIGestureRecognizerStatePossible: { 
            break; 
        }
        case UIGestureRecognizerStateCancelled: {
            self.beingDragged = NO;
            [self resetGestureRecognizers];
            if ([self.delegate respondsToSelector:@selector(pushPopPressViewDidFinishManipulation:)]) {
                [self.delegate pushPopPressViewDidFinishManipulation:self];
            }
            break;
        } 
        case UIGestureRecognizerStateFailed: {
            break;
        } 
        case UIGestureRecognizerStateChanged: {
            break;
        }
        case UIGestureRecognizerStateEnded: {
            self.beingDragged = NO;
            [self resetGestureRecognizers];
            if ([self.delegate respondsToSelector:@selector(pushPopPressViewDidFinishManipulation:)]) {
                [self.delegate pushPopPressViewDidFinishManipulation:self];
            }
            break;
        }
    }
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    if ( self.allowSingleTapSwitch ) {
        if ( tap.state == UIGestureRecognizerStateEnded ) {
            if ([self.delegate respondsToSelector:@selector(pushPopPressViewDidReceiveTap:)]) {
                [self.delegate pushPopPressViewDidReceiveTap:self];
            }

             if ( !self.isFullscreen ) {
                if ([self.delegate respondsToSelector:@selector(pushPopPressViewShouldAllowTapToAnimateToFullscreenWindowFrame:)]) {
                    if ([self.delegate pushPopPressViewShouldAllowTapToAnimateToFullscreenWindowFrame:self] == NO) return;
                }

                [self moveToFullscreenWindowAnimated:YES];
            } else {
                if ([self.delegate respondsToSelector:@selector(pushPopPressViewShouldAllowTapToAnimateToOriginalFrame:)]) {
                    if ([self.delegate pushPopPressViewShouldAllowTapToAnimateToOriginalFrame:self] == NO) return;
                }

                [self moveToOriginalFrameAnimated:YES];
            }
        }
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    // If the gesture recognizers's view isn't one of our pieces, don't allow simultaneous recognition.
    if ( gestureRecognizer.view != self ) {
        return NO;
	}

    // If the gesture recognizers are on different views, don't allow simultaneous recognition.
    if ( gestureRecognizer.view != otherGestureRecognizer.view ) {
        return NO;
	}

    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
	   shouldReceiveTouch:(UITouch *)touch
{
    if ( [gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]] &&
		 [touch.view isKindOfClass: [UIButton class]] ) {
        return NO;
    }
	
    return YES;
}

- (void)moveToFullscreenWindowAnimated:(BOOL)animated
{
    if ( self.isFullscreen ) {
		return;
	}

    [self moveToFullscreenAnimated:animated bounces:YES];
}

- (void)moveToOriginalFrameAnimated:(BOOL)animated
{
    if ( self.isFullscreen == NO ) {
		return;
	}

    [self moveViewToOriginalPositionAnimated:animated bounces:YES];
}

- (void)setAllowSingleTapSwitch:(BOOL)allowSingleTapSwitch
{
    if (_allowSingleTapSwitch != allowSingleTapSwitch) {
        _allowSingleTapSwitch = allowSingleTapSwitch;
        _tapRecognizer.enabled = allowSingleTapSwitch;
    }
}

@end
