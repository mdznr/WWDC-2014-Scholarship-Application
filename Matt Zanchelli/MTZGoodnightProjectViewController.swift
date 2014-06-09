//
//  MTZGoodnightProjectViewController.swift
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 6/5/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

import UIKit

@objc(MTZGoodnightProjectViewController)
class GoodnightProjectViewController: MTZPageViewController, UIScrollViewDelegate {
	
	@IBOutlet var screenshot: UIImageView
	
	@IBOutlet var goodnight: UILabel
	@IBOutlet var descriptionLabel: UILabel
	
	@IBOutlet var haveAGoodNight: UILabel
	@IBOutlet var haveAGoodNight2: UILabel
		
	@IBOutlet var restEasy: UILabel
	@IBOutlet var restEasy2: UILabel
	
	@IBOutlet var goodMorning: UILabel
	@IBOutlet var goodMorning2: UILabel
	
	var page: Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view from its nib.
		
		// Apply the approprite styles to each set of labels.
		
		goodnight.applyMTZStyle(.ProjectTitle)
		descriptionLabel.applyMTZStyle(.ProjectDescription)
		
		haveAGoodNight.applyMTZStyle(.GoodnightSectionTitle)
		restEasy.applyMTZStyle(.GoodnightSectionTitle)
		goodMorning.applyMTZStyle(.GoodnightSectionTitle)
		
		haveAGoodNight2.applyMTZStyle(.GoodnightSectionSubtitle)
		restEasy2.applyMTZStyle(.GoodnightSectionSubtitle)
		goodMorning2.applyMTZStyle(.GoodnightSectionSubtitle)
	}
	
	
	// MARK: UIScrollViewDelegate Protocol
	
	override func scrollViewDidScroll(scrollView: UIScrollView!) {
		super.scrollViewDidScroll(scrollView)
		
		/*
		CGFloat offsetFromPage = fmodf(scrollView.contentOffset.y + (scrollView.frame.size.height/2), scrollView.frame.size.height);
		CGFloat percentage = offsetFromPage / scrollView.frame.size.height;
		self.screenshot.alpha = 2 * percentage;
		*/
		
		let p = Int(round(scrollView.contentOffset.y / scrollView.frame.size.height));
		
		if ( page != p ) {
			page = p;
			switch (page) {
				case 0:
					self.screenshot.image = UIImage(named: "Goodnight-Time Set")
				case 1:
					self.screenshot.image = UIImage(named: "Goodnight-Wake Times")
				case 2:
					self.screenshot.image = UIImage(named: "Goodnight-Alarm")
				case 3:
					self.screenshot.image = UIImage(named: "Goodnight-Good Morning")
				default:
					self.screenshot.image = nil;
			}
		}
	}

}
