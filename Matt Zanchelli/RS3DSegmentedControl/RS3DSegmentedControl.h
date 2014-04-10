//
//  RS3DSegmentedControl.h
//  RS3DSegmentedControl
//
//  Created by Ron Soffer on 12/15/13.
//  Copyright (c) 2013 Ron Soffer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "iCarousel/iCarousel.h"

@class RS3DSegmentedControl;

@protocol RS3DSegmentedControlDelegate <NSObject>

///	<#Description#>
///	@param segmentedControl <#segmentedControl description#>
///	@return <#return value description#>
- (NSUInteger)numberOfSegmentsIn3DSegmentedControl:(RS3DSegmentedControl *)segmentedControl;

///	<#Description#>
///	@param segmentIndex     <#segmentIndex description#>
///	@param segmentedControl <#segmentedControl description#>
///	@return <#return value description#>
- (NSString *)titleForSegmentAtIndex:(NSUInteger)segmentIndex segmentedControl:(RS3DSegmentedControl *)segmentedControl;

///	<#Description#>
///	@param segmentIndex     <#segmentIndex description#>
///	@param segmentedControl <#segmentedControl description#>
- (void)didSelectSegmentAtIndex:(NSUInteger)segmentIndex segmentedControl:(RS3DSegmentedControl *)segmentedControl;

@end


@interface RS3DSegmentedControl : UIView

///	The object that acts as the delegate of the receiving segmented control.
@property (nonatomic, weak) id<RS3DSegmentedControlDelegate> delegate;

///	The index number identifying the selected segment.
@property (nonatomic, assign) NSUInteger selectedSegmentIndex;


#pragma mark - Customization

///	The color of the text.
/// @discussion The default value for this property is a black color (set through the @c blackColor class method of @c UIColor).
@property (nonatomic, retain) UIColor *textColor;

///	The font of the text.
/// @discussion The default value for this property is the system font at a size of 17 points (using the @c systemFontOfSize: class method of @c UIFont).
@property (nonatomic, retain) UIFont *font;

@end


