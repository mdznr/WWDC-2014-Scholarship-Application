//
//  MTZPasscodeProjectViewController.swift
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 6/5/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

import UIKit

class MTZPasscodeProjectViewController: MTZPageViewController {
	
	@IBOutlet var passcodeLabel: UILabel
	@IBOutlet var descriptionLabel : UILabel
	
	@IBOutlet var step1Label : UILabel
	@IBOutlet var step2Label : UILabel
	@IBOutlet var step3Label : UILabel
		
	@IBOutlet var secureByDesignLabel : UILabel
	@IBOutlet var itsAlgorithmicLabel : UILabel
	@IBOutlet var itsUbiquitousLabel : UILabel
	@IBOutlet var availableMultiPlatformLabel : UILabel
	@IBOutlet var freeAndOpenSourceLabel : UILabel
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view from its nib.
		
		// Apply the approprite styles to each set of labels.
		
		passcodeLabel.applyMTZStyle(.ProjectTitle)
		descriptionLabel.applyMTZStyle(.ProjectDescriptionCenter)
		
		step1Label.applyMTZStyle(.ProjectSectionDescription)
		step2Label.applyMTZStyle(.ProjectSectionDescription)
		step3Label.applyMTZStyle(.ProjectSectionDescription)
		
		secureByDesignLabel.applyMTZStyle(.ProjectSectionDescription)
		itsAlgorithmicLabel.applyMTZStyle(.ProjectSectionDescription)
		itsUbiquitousLabel.applyMTZStyle(.ProjectSectionDescription)
		availableMultiPlatformLabel.applyMTZStyle(.ProjectSectionDescription)
		freeAndOpenSourceLabel.applyMTZStyle(.ProjectSectionDescription)
	}
	
}
