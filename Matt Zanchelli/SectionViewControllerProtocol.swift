//
//  SectionViewControllerProtocol.swift
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 6/5/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

import Foundation

@objc
protocol SectionViewControllerProtocol {
	///	Flash scroll indicators, if any.
	func flashScrollIndicators()
	
	///	Scroll to the top of the view controller.
	func scrollToTop()
}
