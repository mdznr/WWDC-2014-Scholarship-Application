//
//  PSPushPopPressView.h
//  PSPushPopPressView
//
//  Based on BSSPushPopPressView by Blacksmith Software.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class PSPushPopPressView;

@protocol PSPushPopPressViewDelegate <NSObject>
@optional

/// Manipulation has started.
///	@param pushPopPressView The instance of @c PSPushPopPressView.
/// @discussion The user has two or more fingers on the view.
- (void)pushPopPressViewDidStartManipulation:(PSPushPopPressView *)pushPopPressView;

///	Manipulation has sopped.
///	@param pushPopPressView The instance of @c PSPushPopPressView.
/// @discussion The user has less than two fingers on the view.
- (void)pushPopPressViewDidFinishManipulation:(PSPushPopPressView *)pushPopPressView;

///	The view will animate back to its original frame.
///	@param pushPopPressView The instance of @c PSPushPopPressView.
///	@param duration The duration of the animation.
- (void)pushPopPressViewWillAnimateToOriginalFrame:(PSPushPopPressView *)pushPopPressView
										  duration:(NSTimeInterval)duration;

///	The animation back to the receiver's original frame has completed.
///	@param pushPopPressView The instance of @c PSPushPopPressView.
- (void)pushPopPressViewDidAnimateToOriginalFrame:(PSPushPopPressView *)pushPopPressView;

///	The view will animate to fullscreen mode.
///	@param pushPopPressView The instance of @c PSPushPopPressView.
///	@param duration The duration of the animation.
- (void)pushPopPressViewWillAnimateToFullscreenWindowFrame:(PSPushPopPressView *)pushPopPressView
												  duration:(NSTimeInterval)duration;

///	The view did animate to fullscreen mode.
///	@param pushPopPressView The instance of @c PSPushPopPressView.
- (void)pushPopPressViewDidAnimateToFullscreenWindowFrame:(PSPushPopPressView *)pushPopPressView;

///	Whether or not the view should allow tapping to animate to the original frame.
///	@param pushPopPressView The instance of @c PSPushPopPressView.
///	@return Whether or not the view should animate back to the original frame due to a tap.
- (BOOL)pushPopPressViewShouldAllowTapToAnimateToOriginalFrame:(PSPushPopPressView *)pushPopPressView;

///	Whether or not the view should allow tapping to animate to fullscreen.
///	@param pushPopPressView The instance of @c PSPushPopPressView.
///	@return Whether or not the view should animate to fullscreen due to a tap.
- (BOOL)pushPopPressViewShouldAllowTapToAnimateToFullscreenWindowFrame:(PSPushPopPressView *)pushPopPressView;

///	The view received a tap.
///	@param pushPopPressView The instance of @c PSPushPopPressView.
/// @discussion This is only called when @c allowSingleTapSwitch is @c YES.
- (void)pushPopPressViewDidReceiveTap:(PSPushPopPressView *)pushPopPressView;

@end


@interface PSPushPopPressView : UIView <UIGestureRecognizerDelegate>

/// The delegate for the @c PushPopPressView.
@property (nonatomic, unsafe_unretained) id<PSPushPopPressViewDelegate> pushPopPressViewDelegate;

/// Determine if the receiver is currently being dragged/
/// @c YES if one or more fingers are on the view.
@property (nonatomic, readonly, getter=isBeingDragged) BOOL beingDragged;

/// Determine if the receiver is currently being displayed fullscreen.
@property (nonatomic, readonly, getter=isFullscreen) BOOL fullscreen;

/// The frame of the view when displayed normally.
/// @discussion set @c initialFrame if changing @c frame after calling @c initWithFrame:
@property (nonatomic, assign) CGRect initialFrame;

/// Allow switching between normal and fullscreen with a single tap. Default: @c YES.
@property (nonatomic, assign) BOOL allowSingleTapSwitch;

/// Ignore the status bar for orientation.
/// If @c YES, @c [UIScreen mainScreen] is used for coordinates instead of @c rootView.
@property (nonatomic, assign) BOOL ignoreStatusBar;

///	Show a shadow below the view. Default: @c YES.
@property (nonatomic, assign) BOOL showShadow;

///	Move the view to fullscreen mode.
///	@param animated Whether or not this change should be animated.
- (void)moveToFullscreenWindowAnimated:(BOOL)animated;

///	Move the view to the original, normal mode.
///	@param animated Whether nor not this change should be animated.
- (void)moveToOriginalFrameAnimated:(BOOL)animated;

///	Align the view based on the current size.
///	@param animated Whether or not this change should be animated.
///	@param bounces Whether or not this animation should bounce.
- (void)alignViewAnimated:(BOOL)animated bounces:(BOOL)bounces;

@end
