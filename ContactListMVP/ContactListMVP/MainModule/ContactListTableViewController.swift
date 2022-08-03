//
//  ContactListTableViewController.swift
//  ContactListMVP
//
//  Created by Владимир on 23.05.2022.
//

import UIKit

//protocol ContactListTableViewProtocol: AnyObject {
//    func updateView()
//}

class ContactListTableViewController: UITableViewController {
    
    var presenter: ContactListPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ContactListPresenter(tableView: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.contactCount ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ContactCell
        cell.configure(with: person)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailContactVC = storyboard?.instantiateViewController(
            withIdentifier: "DetailViewController"
            ) as? DetailViewController {
            guard let person = presenter?.person(at: indexPath.row) else { return }
            detailContactVC.person = person
            detailContactVC.modalPresentationStyle = .fullScreen
            present(detailContactVC, animated: true)
        }
    }
    
    @IBAction func addNewContact(_ sender: UIBarButtonItem) {
        if let newContactVC = storyboard?.instantiateViewController(
            withIdentifier: "NewContactViewController"
            ) as? NewContactViewController {
            newContactVC.presenter = presenter
            newContactVC.modalPresentationStyle = .fullScreen
            present(newContactVC, animated: true)
        }
    }
}

//extension ContactListTableViewController: ContactListTableViewProtocol {
//    func updateView() {
//        tableView.reloadData()
//    }
//}
