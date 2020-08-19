//
//  Extensions.swift
//  Category List Demo
//
//  Created by MiTESH on 20/08/20.
//  Copyright © 2020 mitesh. All rights reserved.
//

import UIKit
import Alamofire

extension UIImage{
    func saveImage(for path: String){
        
        //Get data from UIImage
        guard let data = self.jpegData(compressionQuality: 1) ?? self.pngData() else {
            return
        }
       
        do {
            //Write to local path
            try data.write(to: URL(fileURLWithPath: path), options: .atomicWrite)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension String {
    var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }
    
    func appendingPathComponent(path: String) -> String {
        let nsSt = self as NSString
        return nsSt.appendingPathComponent(path)
    }
}

extension UIImageView{
    
    func downloadImage(for category: Category) {
        if let data = category.data{
            //Document Directory Path
            let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
            
            //Local file path
            // File name include category id + file name + .png extension
            let filePath = (documentPath?.appendingPathComponent(path: category.id + data.lastPathComponent + ".png"))!
            
            
            if FileManager.default.fileExists(atPath: filePath){
                //If image exist in local, get from local path
                self.image = UIImage(contentsOfFile: filePath)
            }else{
                //Download image from server
                AF.request(data).responseData(completionHandler: { (response) in
                    
                    DispatchQueue.main.async {
                        if let imageData = response.data, let image = UIImage(data: imageData){
                            //Save to local path
                            image.saveImage(for: filePath)
                            
                            //Update image in screen
                            self.image = image
                        }else{
                            //Set fail image
                            self.image = UIImage(systemName: "exclamationmark.circle.fill")
                        }
                    }
                    
                })
            }
        }
        
    }
}
