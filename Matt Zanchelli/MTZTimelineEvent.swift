//
//  MTZTimelineEvent.swift
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 6/7/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

import Foundation

class MTZTimelineEvent : NSObject {
	///	Date of the event (as a string).
	let date : String
	
	///	The title of the event.
	let title : String
	
	///	Description of the event.
	let descriptionString : String
	
	///	An image corresponding to the event.
	let image : UIImage?
	
	///	Create a timeline event with a date, title, and description.
	///	@param date A string representing the date of the event.
	///	@param title The title of the event.
	///	@param description The description of the event.
	/// @param image An image representing the event.
	///	@return A newly created @c MTZTimelineEvent with a date, title, description, and image.
	init(date: String, title: String, descriptionString: String, image: UIImage?) {
		self.date = date
		self.title = title
		self.descriptionString = descriptionString
		self.image = image
	}
}