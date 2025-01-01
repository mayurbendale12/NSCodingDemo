import UIKit

class ViewController: UIViewController {
    @IBAction private func didTapNSCodingButton(_ sender: Any) {
        performSegue(withIdentifier: "NSCoding", sender: nil)
    }

    @IBAction private func didTapPlistButton(_ sender: Any) {
        performSegue(withIdentifier: "Plist", sender: nil)
    }
}
