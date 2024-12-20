import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        saveData()
        loadData()
    }

    private func saveData() {
        let person = Person(name: "John Doe", age: 30)

        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let documentDirectory = urls.first {
            let filePath = documentDirectory.appendingPathComponent("person.data")

            do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: person, requiringSecureCoding: false)
                try data.write(to: filePath)
                print("Data saved successfully at \(filePath)")
            } catch {
                print("Failed to save data: \(error)")
            }
        }
    }

    private func loadData() {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let documentDirectory = urls.first {
            let filePath = documentDirectory.appendingPathComponent("person.data")

            do {
                let data = try Data(contentsOf: filePath)
                if let savedPerson = try NSKeyedUnarchiver.unarchivedObject(ofClass: Person.self, from: data) {
                    print("Loaded Person: \(savedPerson.name), Age: \(savedPerson.age)")
                }
            } catch {
                print("Failed to load data: \(error)")
            }
        }
    }
}


