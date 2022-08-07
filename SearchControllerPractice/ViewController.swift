//
//  ViewController.swift
//  SearchControllerPractice
//
//  Created by HeecheolYoon on 2022/08/07.
//

import UIKit

class ViewController: UIViewController {
    
    var searchController = UISearchController(searchResultsController: ResultViewController() )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self

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

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        switch selectedScope {
//        case 0:
//            print("first")
//        case 1:
//            print("second")
//        case 2:
//            print("third")
//        case 3:
//            print("fourth")
//        default :
//            print("babo")
//        }
        print("123")
        if searchBar.selectedScopeButtonIndex == 2 {
            print("13")
        }
    }
    
    
}
