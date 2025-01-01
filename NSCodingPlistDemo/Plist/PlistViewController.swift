import UIKit

class PlistViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        saveDataInPlist()
        loadDataFromPlist()
    }

    private func saveDataInPlist() {
        let sampleData: [String: Any] = ["Name": "John Doe", "Age": 30, "IsRegistered": true]

        let fileManager = FileManager.default
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let plistPath = documentDirectory.appendingPathComponent("SampleData.plist")
            let dictionary = NSDictionary(dictionary: sampleData)

            do {
                try dictionary.write(to: plistPath)
                print("Data saved to plist at: \(plistPath)")
            } catch {
                print("Failed to save data to plist: \(error)")
            }
        }
    }

    private func loadDataFromPlist() {
        let fileManager = FileManager.default
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let plistPath = documentDirectory.appendingPathComponent("SampleData.plist").path
            if let dictionary = NSDictionary(contentsOfFile: plistPath) as? [String: Any] {
                print(dictionary)
            }
        }
    }
}
