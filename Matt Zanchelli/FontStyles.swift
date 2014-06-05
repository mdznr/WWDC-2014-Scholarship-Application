//
//  MTZStyles.swift
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 6/5/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

import UIKit

extension UIFont {
	
	// MARK: Navigation Bar
	
	///	The font used for buttons for each section in the navigation bar.
	class func fontForSectionButton() -> UIFont! {
		return UIFont(name: "MyriadPro-Regular", size: 16)
	}
	
	
	// MARK: About
	
	///	The font used for my name.
	class func fontForName() -> UIFont! {
		return UIFont(name:"MyriadPro-Regular", size: 55)
	}
	
	/// The font used for my personal description.
	class func fontForPersonalDescription() -> UIFont! {
		return UIFont(name:"MyriadSetPro-Thin", size:21)
	}
	
	///	The font used for each interest's description.
	class func fontForInterestDescription() -> UIFont! {
		return UIFont(name:"MyriadPro-Regular", size:14)
	}
	
	
	// Mark: Background
	
	///	The font used for the date in the timeline.
	class func fontForEventDate() -> UIFont! {
		return UIFont(name:"MyriadSetPro-Thin", size:18)
	}
	
	///	The font used for the event title in the timeline.
	class func fontForEventTitle() -> UIFont! {
		return UIFont(name:"MyriadPro-Bold", size:18)
	}
	
	///	The font used for the event detail in the timeline.
	class func fontForEventDetail() -> UIFont! {
		return UIFont(name:"MyriadPro-Regular", size:18)
	}
	
	
	// Mark: Projects
	
	///	The font used for project titles.
	class func fontForProjectTitle() -> UIFont! {
		return UIFont(name:"MyriadPro-Regular", size:55)
	}
	
	///	The font used for project descriptions.
	class func fontForProjectDescription() -> UIFont! {
		return UIFont(name:"MyriadSetPro-Thin", size:21)
	}
	
	///	The font used for heading project sections.
	class func fontForSectionHeader() -> UIFont! {
		return UIFont(name:"MyriadSetPro-Thin", size:34)
	}
	
	///	The font used for the first line of a section description.
	class func fontForSectionDescriptionFirstLine() -> UIFont! {
		return UIFont(name:"MyriadPro-Bold", size:18)
	}
	
	///	The font used for the description of a project section.
	class func fontForSectionDescription() -> UIFont! {
		return UIFont(name:"MyriadPro-Regular", size:18)
	}
	
	///	The font used for a quote in a section.
	class func fontForSectionQuote() -> UIFont! {
		return UIFont(name:"MyriadSetPro-Thin", size:18)
	}
	
	/// The font used for an annotation.
	class func fontForSectionAnnotation() -> UIFont! {
		// TODO: Italics?
		return UIFont(name:"MyriadPro-Regular", size:13)
	}
}
