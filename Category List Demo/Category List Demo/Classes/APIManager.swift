//
//  APIManager.swift
//  Category List Demo
//
//  Created by MiTESH on 19/08/20.
//  Copyright © 2020 mitesh. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {

    private override init() {
        
    }
    
    static let shared  = APIManager()
    
    private let apiURL = "https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json"
    
    //MARK: Category Fetch
    func getCategoyList(completion: @escaping (_ result: [Category]) -> Void) {
        
        AF.request(apiURL, method: .get).responseJSON {   response in
            var categoryList = [Category]()
            //to get JSON return value
            if let result = response.data {
                let decoder = JSONDecoder()
                do {
                    
                    let categories = try decoder.decode([Category].self, from: result)
                    
                    //Clean last save data
                    DBManager.shared.deleteLocalData()
                    
                    //Save new data to local
                    DBManager.shared.addCategoryToLocal(categories)
                    
                    categoryList.append(contentsOf: categories)
                } catch {
                    debugPrint(error)
                }
            }
            
            completion(categoryList)
        }
    }
    
}
