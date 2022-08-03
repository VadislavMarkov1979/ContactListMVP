//
//  ContactListPresenter.swift
//  ContactListMVP
//
//  Created by Владимир on 23.05.2022.
//

import Foundation

protocol ContactListPresenterProtocol {
    init(tableView: ContactListTableViewController)
    
    var persons: [Person] { get set }
    var contactCount: Int { get }
    
    func add(person: Person)
    func person(at index: Int) -> Person
    
}

class ContactListPresenter: ContactListPresenterProtocol {
    required init(tableView: ContactListTableViewController) {
            self.tableView = tableView
        }
    unowned var tableView: ContactListTableViewController?
    var persons: [Person] = []
    
    var contactCount: Int {
        persons.count
    }
    
    func add(person: Person) {
        if !persons.contains(person) {
            persons.append(person)
        }
    }
    
    func person(at index: Int) -> Person {
        persons[index]
    }
}
