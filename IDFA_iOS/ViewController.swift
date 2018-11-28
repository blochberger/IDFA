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
		let identifierManager = ASIdentifierManager.shared()
		let idfa = identifierManager.advertisingIdentifier

		if identifierManager.isAdvertisingTrackingEnabled {
			adTrackingInfoTextField.text = "Ad tracking is enabled."
		} else {
			adTrackingInfoTextField.text = "Ad tracking is not enabled."
		}

		idfaTextField.text = idfa.uuidString
	}

}
