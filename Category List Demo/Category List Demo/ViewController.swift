//
//  ViewController.swift
//  Category List Demo
//
//  Created by MiTESH on 19/08/20.
//  Copyright © 2020 mitesh. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UITableViewController {
    
    var categoryList = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    //MARK: View Setup
    func setupView() {
        
        //Register Custom Cell
        tableView.register(TextCategoryTableViewCell.self, forCellReuseIdentifier: "textCategoryCell")
        tableView.register(ImageCategoryTableViewCell.self, forCellReuseIdentifier: "imageCategoryCell")
        
        //Fetch category list
        fetchCategoryList()
        
        //Set navigation
        setupNavigationItem()
    }
    
    //MARK: Navigation Items
    func setupNavigationItem() {
        self.navigationItem.title = "Category List"
    }
    
    //MARK: API Call
    func fetchCategoryList() {
        APIManager.shared.getCategoyList(completion: { reslts in
            self.categoryList = reslts
            if reslts.isEmpty{
                //Fetch from local if data empty
                self.categoryList = DBManager.shared.fetchCategoryFromLocal()
            }
            self.categoryList = self.categoryList.sorted(by: { $0.type < $1.type })
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        })
    }
}

//MARK: Tableview Delegate and Datasource
extension ViewController{
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = categoryList[indexPath.row]
        
        if category.type.lowercased() != "image"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "textCategoryCell", for: indexPath) as! TextCategoryTableViewCell
            cell.category = categoryList[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCategoryCell", for: indexPath) as! ImageCategoryTableViewCell
            cell.category = categoryList[indexPath.row]
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Open Detail View Control
        let detailVC = DetailViewController(style: .plain)
        detailVC.category = categoryList[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

