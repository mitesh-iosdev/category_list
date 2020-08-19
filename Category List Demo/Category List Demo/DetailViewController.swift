//
//  DetailViewController.swift
//  Category List Demo
//
//  Created by MiTESH on 19/08/20.
//  Copyright © 2020 mitesh. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    var category: Category = Category()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Register Custom Cell
        tableView.register(DetailTextCategoryTableViewCell.self, forCellReuseIdentifier: "textCategoryCell")
        tableView.register(DetailImageCategoryTableViewCell.self, forCellReuseIdentifier: "imageCategoryCell")
        tableView.tableFooterView = UIView()
        //Set navigation
        setupNavigationItem()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Navigation Items
    func setupNavigationItem() {
        self.navigationItem.title = "Category Detail"
    }

}

//MARK: Tableview Delegate and Datasource
extension DetailViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //As all data in single cell so returning single cell
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if category.type.lowercased() != "image"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "textCategoryCell", for: indexPath) as! DetailTextCategoryTableViewCell
            cell.category = category
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCategoryCell", for: indexPath) as! DetailImageCategoryTableViewCell
            cell.category = category
            return cell
        }
    }
}
