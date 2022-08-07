//
//  ResultViewController.swift
//  SearchControllerPractice
//
//  Created by HeecheolYoon on 2022/08/07.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    let list = [Int](1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        
//        myTableView.delegate = self
//        myTableView.dataSource = self
//        
//        myTableView.register(UINib(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultTableViewCell")
        
    }
    
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTabelViewCell", for: indexPath) as? ResultTableViewCell else { return UITableViewCell() }
        
        cell.label.text = "\(list[indexPath.row])"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return list.count
    }
}
