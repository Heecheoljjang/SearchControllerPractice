//
//  ViewController.swift
//  SearchControllerPractice
//
//  Created by HeecheolYoon on 2022/08/07.
//

import UIKit

class ViewController: UIViewController {
    
    //ResultViewController에 따로 테이블뷰를 추가해서 하면 안되는듯
    @IBOutlet weak var tableView: UITableView!
    
    var searchController = UISearchController(searchResultsController: nil )
    
    let list = [Int](1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultTableViewCell")

        navigationItem.searchController = searchController
        title = "Test"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: nil)
        
        searchController.searchBar.scopeButtonTitles = ["1", "2", "3", "4"]

    }
}

extension ViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        
        //print(text)
        
        if searchController.searchBar.selectedScopeButtonIndex == 1 {
            searchController.searchResultsController
        }
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell else { return UITableViewCell() }
        
        cell.label.text = "\(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
}
