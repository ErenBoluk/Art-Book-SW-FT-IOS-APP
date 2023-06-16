//
//  ViewController.swift
//  ArtBook
//
//  Created by midDeveloper on 7.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
                
    }
    @objc func addButtonClicked(){
            performSegue(withIdentifier: "toDetailVC", sender: nil)
        }



}

