//
//  MTZTimelineEventView.swift
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 6/5/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

import UIKit

protocol MTZTimelineEventViewInterface {
	///	Set up a timeline event view with a timeline event object.
	///	@param timelineEvent The timeline event object to create the view from.
	func setUpWithTimelineEvent(timelineEvent: MTZTimelineEvent)
	
	///	Date of the event (as a string).
	var date : NSString { get set }
	
	///	The title of the event.
	var title : NSString { get set }
	
	///	Description of the event.
	var descriptionString : NSString { get set }
	
	///	An image corresponding to the event.
	var image : UIImage? { get set }
}

class MTZTimelineEventView: UIView, MTZTimelineEventViewInterface {
	
	// MARK: Public
	
	var date : NSString = "Feb 1993" {
	didSet {
		dateLabel.text = date
		dateLabel.applyMTZStyleEventDate()
	}
	}
	
	var title : NSString = "Event Title." {
	didSet {
		titleLabel.text = title
		titleLabel.applyMTZStyleEventTitle()
	}
	}
	
	var descriptionString : NSString = "Event description." {
	didSet {
		descriptionLabel.text = descriptionString
		descriptionLabel.applyMTZStyleEventDetail()
	}
	}
	
	var image : UIImage? {
	didSet {
		if let img = image {
			photoView.image = img
			let imageRect = CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height)
			pushPopPressView.frame = CGRectScaledRectToFitInRect(imageRect, pushPopPressViewFrame)
		} else {
			photoView.image = nil
		}
	}
	}
	
	func setUpWithTimelineEvent(timelineEvent: MTZTimelineEvent) {
		date = timelineEvent.date;
		title = timelineEvent.title;
		descriptionString = timelineEvent.description;
		image = timelineEvent.image;
	}
	
	
	// MARK: Initializers
	
	init(frame: CGRect) {
		var modifiedFrame = frame
		modifiedFrame.size.width = 1024
		modifiedFrame.size.height = 130
		super.init(frame: modifiedFrame)
		setup()
	}
	
	func setup() {
		addSubview(timelineStripeView)
		addSubview(dotView)
		addSubview(pushPopPressView)
		pushPopPressView.addSubview(photoView)
		addSubview(dateLabel)
		addSubview(titleLabel)
		addSubview(descriptionLabel)
	}
	
	
	// MARK: Private
	
	///	Label for the date.
	let dateLabel : UILabel = {
		let view = UILabel(frame:CGRect(x: 21, y: 5, width: 88, height: 25))
		view.backgroundColor = UIColor.whiteColor()
		view.opaque = true
		view.numberOfLines = 1
		return view
	}()
	
	///	Label for the title.
	let titleLabel : UILabel = {
		let view = UILabel(frame:CGRect(x: 148, y: 5, width: 472, height: 25))
		view.backgroundColor = UIColor.whiteColor()
		view.opaque = true
		view.numberOfLines = 1
		return view
	}()
	
	///	Label for the description.
	let descriptionLabel : UILabel = {
		let view = UILabel(frame:CGRect(x: 148, y: 29, width: 472, height: 100))
		view.backgroundColor = UIColor.whiteColor()
		view.opaque = true
		view.numberOfLines = 0
		return view
	}()
	
	///	The view to load content to expand/manipulate.
	let pushPopPressView : PSPushPopPressView = {
//		let view = PSPushPopPressView(frame:pushPopPressViewFrame)
		let view = PSPushPopPressView(frame:CGRect(x: 660, y: 0, width: 344, height: 150))
		view.delegate = UIApplication.sharedApplication().keyWindow.rootViewController as PSPushPopPressViewDelegate
		view.backgroundColor = UIColor.whiteColor()
		view.retainAspectRatio = true
		return view
	}()
	
	///	The original frame for @c pushPopPressView.
	let pushPopPressViewFrame : CGRect = CGRect(x: 660, y: 0, width: 344, height: 150)
	
	///	The image view to put the image in.
	let photoView : UIImageView = {
//		let view = UIImageView(frame:pushPopPressView.bounds)
		let view = UIImageView(frame:CGRect(x: 0, y: 0, width: 344, height: 150))
		view.backgroundColor = UIColor.whiteColor()
		view.opaque = true
		view.clipsToBounds = true
		view.autoresizingMask = .FlexibleWidth | .FlexibleHeight;
		view.contentMode = .ScaleAspectFit
		return view
	}()
	
	///	The mark on the timeline for the event.
	let dotView : UIImageView = {
		let view = UIImageView(frame:CGRect(x: 123, y: 11, width: 11, height: 11))
		view.image = UIImage(named:"Timeline-Dot")
		view.backgroundColor = UIColor.whiteColor()
		view.opaque = true
		return view
	}()
	
	///	The vertical stripe representing the timeline.
	let timelineStripeView : UIView = {
		let view = UIView(frame:CGRect(x: 128, y: 0, width: 1, height: 130))
		view.backgroundColor = UIColor(white:0.85, alpha:1)
		view.opaque = true
		return view
	}()
	
}
