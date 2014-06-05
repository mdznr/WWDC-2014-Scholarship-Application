//
//  LabelStyles.swift
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 6/5/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

import UIKit

/// Defines the style of labels in particular sections of the app.
enum MTZStyle {
	// About
	case Name
	case PersonalDescription
	case InterestDescription
	
	// Background
	case EventDate
	case EventTitle
	case EventDetail
	
	// Projects
	case ProjectTitle
	case ProjectDescription
	case ProjectDescriptionCenter
	case ProjectSectionHeader
	case ProjectSectionDescription
	case ProjectSectionQuote
	case ProjectSectionAnnotation
	case GoodnightSectionTitle
	case GoodnightSectionSubtitle
}

protocol UILabel_MTZStyle {
	
	/// Apply a prticular style to an instance of @c UILabel .
	func applyMTZStyle(style: MTZStyle)
	
}

extension UILabel: UILabel_MTZStyle {
	
	// Mark: Public API
	
	func applyMTZStyle(style: MTZStyle) {
		switch style {
			case .Name:                      applyMTZStyleName()
			case .PersonalDescription:       applyMTZStylePersonalDescription()
			case .InterestDescription:       applyMTZStyleInterestDescription()
			case .EventDate:                 applyMTZStyleEventDate()
			case .EventTitle:                applyMTZStyleEventTitle()
			case .EventDetail:               applyMTZStyleEventDetail()
			case .ProjectTitle:              applyMTZStyleProjectTitle()
			case .ProjectDescription:        applyMTZStyleProjectDescription()
			case .ProjectDescriptionCenter:  applyMTZStyleProjectDescriptionCentered()
			case .ProjectSectionHeader:      applyMTZStyleProjectSectionHeader()
			case .ProjectSectionDescription: applyMTZStyleProjectSectionDescription()
			case .ProjectSectionQuote:       applyMTZStyleProjectSectionQuote()
			case .ProjectSectionAnnotation:  applyMTZStyleProjectSectionAnnotation()
			case .GoodnightSectionTitle:     applyMTZStyleGoodnightSectionTitle()
			case .GoodnightSectionSubtitle:  applyMTZStyleGoodnightSectionSubtitle()
		}
	}
	
	
	// Mark: Private API
	
	func applyMTZStyleName() {
		// Set the proper font.
		font = UIFont.fontForName()
		
		// Set the proper text color.
		textColor = UIColor.blackColor()
		
		// Get the attributed string.
		let attributedString = NSMutableAttributedString(string: text)
		
		// Add the paragraph style.
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 0
		paragraphStyle.alignment = .Center
		attributedString.addAttribute(NSParagraphStyleAttributeName,
								value:paragraphStyle,
								range:NSRange(location: 0, length: attributedString.length))
		self.attributedText = attributedString;
	}
	
	func applyMTZStylePersonalDescription() {
		// Set the proper font.
		font = UIFont.fontForPersonalDescription()
		
		// Set the proper text color.
		textColor = UIColor(white: 0.5, alpha: 1)
		
		// Get the attributed string.
		let attributedString = NSMutableAttributedString(string: text)
		
		// Add the paragraph style.
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 5 // 26 - 21
		paragraphStyle.alignment = .Center
		attributedString.addAttribute(NSParagraphStyleAttributeName,
			                    value:paragraphStyle,
								range:NSRange(location: 0, length: attributedString.length))
		self.attributedText = attributedString;
	}
	
	func applyMTZStyleInterestDescription() {
		// Set the proper font.
		font = UIFont.fontForInterestDescription()
		
		// Set the proper text color.
		textColor = UIColor(white: 0.5, alpha: 1)
		
		// Get the attributed string.
		let attributedString = NSMutableAttributedString(string: text)
		
		// Add the paragraph style.
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 2 // 16 - 14
		paragraphStyle.alignment = .Center
		attributedString.addAttribute(NSParagraphStyleAttributeName,
			                    value:paragraphStyle,
			                    range:NSRange(location:0, length:attributedString.length))
		self.attributedText = attributedString;
	}
	
	func applyMTZStyleEventDate() {
		// Set the proper font.
		font = UIFont.fontForEventDate()
		
		// Set the proper text color.
		textColor = UIColor(white: 0.65, alpha: 1)
		
		// Get the attributed string.
		let attributedString = NSMutableAttributedString(string: text)
		
		// Add the paragraph style.
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 7 // 25 - 18
		paragraphStyle.alignment = .Right
		attributedString.addAttribute(NSParagraphStyleAttributeName,
			                    value:paragraphStyle,
			                    range:NSRange(location:0, length:attributedString.length))
		self.attributedText = attributedString;
	}
	
	func applyMTZStyleEventTitle() {
		// Set the proper font.
		font = UIFont.fontForEventTitle()
		
		// Set the proper text color.
		textColor = UIColor(white: 0.1, alpha: 1)
		
		// Get the attributed string.
		let attributedString = NSMutableAttributedString(string: text)
		
		// Add the paragraph style.
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 7 // 25 - 18
		attributedString.addAttribute(NSParagraphStyleAttributeName,
			                    value:paragraphStyle,
								range:NSRange(location:0, length:attributedString.length))
		self.attributedText = attributedString;
	}
	
	func applyMTZStyleEventDetail() {
		// Set the proper font.
		font = UIFont.fontForEventDetail()
		
		// Set the proper text color.
		textColor = UIColor(white: 0.33, alpha: 1)
		
		// Get the attributed string.
		let attributedString = NSMutableAttributedString(string: text)
		
		// Add the paragraph style.
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 7 // 25 - 18
		attributedString.addAttribute(NSParagraphStyleAttributeName,
								value:paragraphStyle,
								range:NSRange(location:0, length:attributedString.length))
		self.attributedText = attributedString;
	}
	
	func applyMTZStyleProjectTitle() {
		// Set the proper font.
		font = UIFont.fontForProjectTitle()
	}
	
	func applyMTZStyleProjectDescription() {
		// Set the proper font.
		font = UIFont.fontForProjectDescription()
		
		// Get the attributed string.
		let attributedString = NSMutableAttributedString(string: text)
		
		// Add the paragraph style.
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 5 // 26 - 21
		attributedString.addAttribute(NSParagraphStyleAttributeName,
								value:paragraphStyle,
								range:NSRange(location:0, length:attributedString.length))
		self.attributedText = attributedString;
	}
	
	func applyMTZStyleProjectDescriptionCentered() {
		// Set the proper font.
		font = UIFont.fontForProjectDescription()
		
		// Get the attributed string.
		let attributedString = NSMutableAttributedString(string: text)
		
		// Add the paragraph style.
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 5 // 26 - 21
		paragraphStyle.alignment = .Center
		attributedString.addAttribute(NSParagraphStyleAttributeName,
								value:paragraphStyle,
								range:NSRange(location:0, length:attributedString.length))
		self.attributedText = attributedString;
	}
	
	func applyMTZStyleProjectSectionHeader() {
		// Set the proper font.
		font = UIFont.fontForSectionHeader()
		
		// Get the attributed string.
		let attributedString = NSMutableAttributedString(string: text)
		
		// Add the paragraph style.
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = -8 // 26 - 34
		paragraphStyle.alignment = .Left
		attributedString.addAttribute(NSParagraphStyleAttributeName,
			value:paragraphStyle,
			range:NSRange(location:0, length:attributedString.length))
		self.attributedText = attributedString;
	}
	
	func applyMTZStyleProjectSectionDescription() {
		// Set the proper font.
		font = UIFont.fontForSectionDescription()
		
		// Get the attributed string.
		let attributedString = NSMutableAttributedString(string: text)
		
		// Add the paragraph style.
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 8 // 26 - 18
		paragraphStyle.alignment = .Left
		attributedString.addAttribute(NSParagraphStyleAttributeName,
			value:paragraphStyle,
			range:NSRange(location:0, length:attributedString.length))
		self.attributedText = attributedString;
		
		// Make the first line bold.
		let firstNewLine = (text as NSString).rangeOfString("\n")
		let firstLine = NSRange(location:0, length:firstNewLine.location-1)
		attributedString.addAttribute(NSFontAttributeName, value:UIFont.fontForSectionDescriptionFirstLine(), range:firstLine)
		self.attributedText = attributedString
	}
	
	func applyMTZStyleProjectSectionQuote() {
		// Set the proper font.
		font = UIFont.fontForSectionQuote()
		
		// Get the attributed string.
		let attributedString = NSMutableAttributedString(string: text)
		
		// Add the paragraph style.
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 7
		paragraphStyle.alignment = .Center
		attributedString.addAttribute(NSParagraphStyleAttributeName,
			                    value:paragraphStyle,
			                    range:NSRange(location: 0, length: attributedString.length))
		self.attributedText = attributedString;
	}
	
	func applyMTZStyleProjectSectionAnnotation() {
		// Set the proper font.
		font = UIFont.fontForSectionAnnotation()
		
		// Set the proper text color.
		textColor = UIColor(white: 0.5, alpha: 1)
		
		// Get the attributed string.
		let attributedString = NSMutableAttributedString(string: text)
		
		// Add the paragraph style.
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 4.0
		paragraphStyle.alignment = .Center
		attributedString.addAttribute(NSParagraphStyleAttributeName,
			                    value:paragraphStyle,
			                    range:NSRange(location: 0, length: attributedString.length))
		self.attributedText = attributedString;
	}
	
	func applyMTZStyleGoodnightSectionTitle() {
		// Set the proper font.
		font = UIFont(name: "MyriadSetPro-Thin", size:48)
		
		// Get the attributed string.
		let attributedString = NSMutableAttributedString(string: text)
		
		// Add the paragraph style.
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 16 // 64 - 48
		attributedString.addAttribute(NSParagraphStyleAttributeName,
			                    value:paragraphStyle,
			                    range:NSRange(location: 0, length: attributedString.length))
		self.attributedText = attributedString;
	}
	
	func applyMTZStyleGoodnightSectionSubtitle() {
		// Set the proper font.
		font = UIFont(name: "MyriadSetPro-Thin", size: 24)
		
		// Set the proper text color.
		textColor = UIColor(white: 1, alpha: 0.8)
		
		// Get the attributed string.
		let attributedString = NSMutableAttributedString(string: text)
		
		// Add the paragraph style.
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 8 // 32 - 24
		attributedString.addAttribute(NSParagraphStyleAttributeName,
			                    value:paragraphStyle,
			                    range:NSRange(location: 0, length: attributedString.length))
		self.attributedText = attributedString;
	}
	
}