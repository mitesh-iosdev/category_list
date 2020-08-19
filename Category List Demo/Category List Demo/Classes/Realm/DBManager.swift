//
//  DBManager.swift
//  Category List Demo
//
//  Created by MiTESH on 19/08/20.
//  Copyright © 2020 mitesh. All rights reserved.
//

import UIKit
import RealmSwift

class DBManager: NSObject {
    
    private override init() {
        
    }
    static let shared = DBManager()
    
    private let realm = try! Realm()
    
    //MARK: Category Delete
    func deleteLocalData() {
        try! realm.write(){
            realm.deleteAll()
        }
    }
    
    //MARK: Category Insert
    func addCategoryToLocal(_ data: [Category]) {
        try! realm.write(){
            realm.add(data)
        }
        
    }
    
    //MARK: Category Fetcj
    func fetchCategoryFromLocal() -> [Category] {
        var listData = [Category]()
        let data = realm.objects(Category.self)
        if !data.isEmpty{
            listData.append(contentsOf: data)
        }
            
        return listData
    }
}
