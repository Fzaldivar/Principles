import Foundation

// For this exercise, the relation is 1-1. Employee must have 1 IDCard and an IDCard must have one employee

final class Employee {
    var name: String
    var id: String
    var title: String
    var idCard: IdCard?
    
    init(name: String, id: String, title: String) {
        self.name = name
        self.id = id
        self.title = title
    }
    
    deinit {
        print("deinit - Employee \(name)")
    }
}

final class IdCard {
    var uniqueId: String
    // weak is not going to work here because Employee is not an optional
    unowned var employee: Employee
    
    init(uniqueId: String, employee: Employee) {
        self.uniqueId = uniqueId
        self.employee = employee
    }
    
    deinit {
        print("deinit - IdCard \(uniqueId)")
    }
}

var myself: Employee? = Employee(name: "Fernando", id: "1234", title: "iOS Developer")
var idCard: IdCard? = IdCard(uniqueId: "ID-1234", employee: myself!)
myself?.idCard = idCard


myself = nil
idCard = nil
