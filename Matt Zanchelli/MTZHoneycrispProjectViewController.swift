//
//  MTZHoneycrispProjectViewController.swift
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 6/5/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

import UIKit
import QuartzCore

class MTZHoneycrispProjectViewController: MTZPageViewController, UIScrollViewDelegate {
	
	@IBOutlet var honeycrisp: UILabel
	@IBOutlet var descriptionLabel: UILabel
	
	@IBOutlet var abstract: UILabel
	
	@IBOutlet var contextHeader: UILabel
	@IBOutlet var contextDescription: UILabel
	@IBOutlet var context1: UILabel
	@IBOutlet var contextualVibrationAmplification: UIButton
	@IBOutlet var context2: UILabel;
	@IBOutlet var adaptiveVisualContrastHigh: UIImageView
	@IBOutlet var adaptiveVisualContrastDarknessView: UIView

	@IBOutlet var contentHeader: UILabel
	@IBOutlet var contentDescription: UILabel
	@IBOutlet var contentQuote: UILabel
	@IBOutlet var content1: UILabel
	@IBOutlet var photoCropper: UIView
	@IBOutlet var photoCropLeft: UIView
	@IBOutlet var photoCropRight: UIView
	@IBOutlet var photoCrop: UIImageView
	@IBOutlet var content2: UILabel

	@IBOutlet var interactionHeader: UILabel
	@IBOutlet var interactionDescription: UILabel
	@IBOutlet var interaction1: UILabel
	@IBOutlet var interaction1Annotation: UILabel
	@IBOutlet var interaction2: UILabel
	@IBOutlet var interaction2Annotation: UILabel
	@IBOutlet var pushBackButton: MTZAppIcon
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view from its nib.
		
		// Apply the approprite styles to each set of labels.
		
		honeycrisp.applyMTZStyle(.ProjectTitle)
		descriptionLabel.applyMTZStyle(.ProjectDescription)
		
		// Setting the font and paragraph style for `abstract`.
		abstract.font = UIFont(name: "MyriadSetPro-Thin", size: 18)
		let attributedString = NSMutableAttributedString(string: abstract.text)
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 8
		paragraphStyle.alignment = .Center
		attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
		abstract.attributedText = attributedString;
		
		contextHeader.applyMTZStyle(.ProjectSectionHeader)
		contextDescription.applyMTZStyle(.ProjectSectionDescription)
		context1.applyMTZStyle(.ProjectSectionDescription)
		context2.applyMTZStyle(.ProjectSectionDescription)
		
		contentHeader.applyMTZStyle(.ProjectSectionHeader)
		contentHeader.applyMTZStyle(.ProjectSectionHeader)
		contentDescription.applyMTZStyle(.ProjectSectionDescription)
		contentQuote.applyMTZStyle(.ProjectSectionQuote)
		content1.applyMTZStyle(.ProjectSectionDescription)
		content2.applyMTZStyle(.ProjectSectionDescription)
		
		interactionHeader.applyMTZStyle(.ProjectSectionHeader)
		interactionDescription.applyMTZStyle(.ProjectSectionDescription)
		interaction1.applyMTZStyle(.ProjectSectionDescription)
		interaction1Annotation.applyMTZStyle(.ProjectSectionAnnotation)
		interaction2.applyMTZStyle(.ProjectSectionDescription)
		interaction2Annotation.applyMTZStyle(.ProjectSectionAnnotation)
		
		// TODO: Make handedness interactive.
		
		pushBackButton.iconImage = UIImage(named:"Honeycrisp - AppIcon")
	}
	
	@IBAction func didTapVibratingPhone(sender: UIButton) {
		// TODO: Playback vibration sound.
		
		// Reset transform.
		sender.layer.transform = CATransform3DIdentity
		
		UIView.animateKeyframesWithDuration(NSTimeInterval(5), delay: NSTimeInterval(0), options: nil, animations: {
			// Rotate clockwise.
			
			UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.33, animations: {
				sender.layer.transform = CATransform3DRotate(sender.layer.transform, 12 * (M_PI_4/90), 0, 0, 1)
			})
			
			// Vibrate.
			let duration = 0.001
			for (var startTime = 0.0; startTime < 0.33; startTime += duration) {
				UIView.addKeyframeWithRelativeStartTime(startTime, relativeDuration: duration/2, animations: {
					sender.layer.transform = CATransform3DRotate(sender.layer.transform, M_PI_4/10, 0, 0, 1);
				})
				UIView.addKeyframeWithRelativeStartTime(startTime+(duration/2), relativeDuration: duration/2, animations: {
					sender.layer.transform = CATransform3DRotate(sender.layer.transform, M_PI_4/10, 0, 0, -1);
				})
			}
			
			// Rotate back (counter-clockwise).
			UIView.addKeyframeWithRelativeStartTime(0.66, relativeDuration: 0.33, animations: {
				sender.layer.transform = CATransform3DRotate(sender.layer.transform, 12*(M_PI_4/90), 0, 0, -1);
			})
			
			// Vibrate.
			for ( var startTime = 0.66; startTime < 0.33; startTime += duration ) {
				UIView.addKeyframeWithRelativeStartTime(startTime, relativeDuration: duration/2, animations: {
					sender.layer.transform = CATransform3DRotate(sender.layer.transform, M_PI_4/10, 0, 0, 1);
				})
				UIView.addKeyframeWithRelativeStartTime(startTime+(duration/2), relativeDuration: duration/2, animations: {
					sender.layer.transform = CATransform3DRotate(sender.layer.transform, M_PI_4/10, 0, 0, -1);
				})
			}
		}, completion: nil)
	}
	
	@IBAction func didChangeContrast(sender: UISegmentedControl) {
		var brightness = 0.0, contrast = 0.0
		switch sender.selectedSegmentIndex {
			case 1: // Outdoors
				brightness = 0.7
				contrast = 1.0
			case 0: // Indoors
				fallthrough
			default:
				brightness = 0.0
				contrast = 0.0
		}
		
		UIView.animateKeyframesWithDuration(1, delay: 0, options: .BeginFromCurrentState, animations: {
			UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.75, animations: {
				self.adaptiveVisualContrastDarknessView.alpha = brightness;
			})
			UIView.addKeyframeWithRelativeStartTime(0.75, relativeDuration: 0.25, animations: {
				self.adaptiveVisualContrastHigh.alpha = contrast;
			})
		}, completion: nil)
	}
	
	@IBAction func didChangeCropType(sender: UISegmentedControl) {
		// Hardcoded positions for performance.
		// Honeycrisp slightly too slow for effective demo.
		func animations() {
			switch ( sender.selectedSegmentIndex ) {
				case 2: // Honeycrisp
					// Shift photo.
					self.photoCrop.frame = CGRectOffset(photoCropper.bounds, 27, 0);
					// Bring in crop.
					self.photoCropLeft.frame = CGRect(x: 0, y: 0, width: 55, height: photoCropper.bounds.size.height)
					self.photoCropRight.frame = CGRect(x:photoCropper.bounds.size.width-55, y: 0, width: 55, height: photoCropper.bounds.size.height);
				case 1: // Center
					// Reset photo position.
					self.photoCrop.frame = self.photoCropper.bounds;
					// Bring in crop.
					self.photoCropLeft.frame = CGRect(x: 0, y: 0, width: 55, height: photoCropper.bounds.size.height);
					self.photoCropRight.frame = CGRect(x: self.photoCropper.bounds.size.width-55, y: 0, width: 55, height: photoCropper.bounds.size.height);
				case 0: // Original
					// Reset photo position.
					self.photoCrop.frame = self.photoCropper.bounds;
					// Pull back crop.
					self.photoCropLeft.frame = CGRect(x: 0, y: 0, width: 0, height: photoCropper.bounds.size.height);
					self.photoCropRight.frame = CGRect(x: photoCropper.bounds.size.width, y: 0, width: 0, height: photoCropper.bounds.size.height);
				default:
					break
			}
		}
		
		// Animate.
		UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.BeginFromCurrentState|UIViewAnimationOptions.CurveEaseInOut, animations: animations, completion: nil)
	}
}
