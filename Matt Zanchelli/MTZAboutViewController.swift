//
//  MTZAboutViewController.swift
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 6/5/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

import UIKit

@objc(MTZAboutViewController)
class AboutViewController: UIViewController, SectionViewControllerProtocol {
	
	///	The label for my name.
	@IBOutlet var nameLabel: UILabel;
	
	///	The label for my personal description.
	@IBOutlet var personalDescriptionLabel: UILabel
	
	///	The label mentioning my other interests.
	@IBOutlet var interestsLabel: UILabel
	
	///	Labels below each interest.
	@IBOutlet var bikingInterestLabel : UILabel
	@IBOutlet var musicInterestLabel : UILabel
	@IBOutlet var photographyInterestLabel : UILabel
	
	init(coder aDecoder: NSCoder?) {
		super.init(coder: aDecoder)
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		nameLabel.applyMTZStyle(.Name)
		personalDescriptionLabel.applyMTZStyle(.PersonalDescription)
		interestsLabel.applyMTZStyle(.PersonalDescription)
		bikingInterestLabel.applyMTZStyle(.InterestDescription)
		musicInterestLabel.applyMTZStyle(.InterestDescription)
		photographyInterestLabel.applyMTZStyle(.InterestDescription)
    }
	
	func flashScrollIndicators() {
		
	}
	
	func scrollToTop() {
		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
