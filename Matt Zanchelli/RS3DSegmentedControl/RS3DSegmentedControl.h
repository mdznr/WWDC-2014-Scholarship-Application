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

@protocol RS3DSegmentedControlDataSource <NSObject>

///	Asks the data source to return the number of segments in the segmented control.
///	@param segmentedControl An object representing the segmented control requesting this information.
///	@return The number of sections in segmented control.
- (NSUInteger)numberOfSegmentsInSegmentedControl:(RS3DSegmentedControl *)segmentedControl;

///	Asks the data source for the title of the header of the specified section of the table view.
///	@param segmentedControl The segmented control object asking for the title.
///	@param index An index number identifying a segment of segmented control.
///	@return A string to use as the title of the segment. If you return nil , the segment will have no title.
- (NSString *)segmentedControl:(RS3DSegmentedControl *)segmentedControl titleForSegmentAtIndex:(NSUInteger)index;

@end


@protocol RS3DSegmentedControlDelegate <NSObject>

///	Tells the delegate that the specified segment is now selected.
///	@param segmentedControl A segmented control object informing the delegate about the new segment selection.
///	@param index The index of the new selected segment in @c segmentedControl.
- (void)segmentedControl:(RS3DSegmentedControl *)segmentedControl didSelectSegmentAtIndex:(NSUInteger)index;

@end


@interface RS3DSegmentedControl : UIView

///	The object that acts as the data source of the receiving segmented control.
@property (nonatomic, weak) id<RS3DSegmentedControlDataSource> dataSource;

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


