import AdSupport
import Cocoa

class ViewController: NSViewController {

	@IBOutlet weak var statusLabel: NSTextField!
	@IBOutlet weak var idfaTextField: NSTextField!
	
	@IBAction func refreshButtonClicked(_ sender: NSButton) {
		refresh()
	}

	@IBAction func clearButtonClicked(_ sender: NSButton) {
		clear()
	}

	func refresh() {
		let identifierManager = ASIdentifierManager.shared()
		let idfa = identifierManager.advertisingIdentifier

		if identifierManager.isAdvertisingTrackingEnabled {
			statusLabel.stringValue = "Ad tracking is enabled."
		} else {
			statusLabel.stringValue = "Ad tracking is not enabled."
		}

		idfaTextField.stringValue = idfa.uuidString
	}

	func clear() {
		let identifierManager = ASIdentifierManager.shared()
		identifierManager.clearAdvertisingIdentifier()
		refresh()
	}

	// MARK: NSViewController

	override func viewDidLoad() {
		super.viewDidLoad()

		refresh()
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}

}
