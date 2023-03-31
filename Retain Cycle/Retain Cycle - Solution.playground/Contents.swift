import Foundation

final class Employee {
    var name: String
    var id: String
    var title: String
    var macBook: MacBook?
    
    init(name: String, id: String, title: String) {
        self.name = name
        self.id = id
        self.title = title
    }
    
    deinit {
        print("deinit - Employee \(name)")
    }
}

final class MacBook {
    var serialNumber: String
    weak var assinee: Employee?
    
    init(serialNumber: String) {
        self.serialNumber = serialNumber
    }
    
    deinit {
        print("deinit - MacbBook \(serialNumber)")
    }
}

var myself: Employee? = Employee(name: "Fernando", id: "1234", title: "iOS Developer")
var macBook: MacBook? = MacBook(serialNumber: "Serial12345")
myself?.macBook = macBook
macBook?.assinee = myself

// Now deinits methods are called
myself = nil
macBook = nil
