//
//  ViewController.swift
//  IDFA
//
//  Created by Maximilian Blochberger on 2017-02-28.
//  Copyright © 2017 Universität Hamburg. All rights reserved.
//

import AdSupport
import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var adTrackingInfoTextField: UILabel!
	@IBOutlet weak var idfaTextField: UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()

		refresh()
	}

	@IBAction func refresh() {
		let identifierManager = ASIdentifierManager()
		let idfa = identifierManager.advertisingIdentifier

		if identifierManager.isAdvertisingTrackingEnabled {
			adTrackingInfoTextField.text = "Ad tracking is enabled."
		} else {
			adTrackingInfoTextField.text = "Ad tracking is not enabled."
		}

		idfaTextField.text = idfa?.uuidString
	}

}

