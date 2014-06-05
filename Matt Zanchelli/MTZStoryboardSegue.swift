//
//  MTZStoryboardSegue.swift
//  Matt Zanchelli
//
//  Created by Matt Zanchelli on 6/4/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

import UIKit

class MTZStoryboardSegue: UIStoryboardSegue {
	
	override func perform() {
		(self.sourceViewController as MTZViewController).containingViewController = self.destinationViewController as UIViewController
	}
   
}
