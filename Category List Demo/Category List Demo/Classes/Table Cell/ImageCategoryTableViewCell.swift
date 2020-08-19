//
//  ImageCategoryTableViewCell.swift
//  Category List Demo
//
//  Created by MiTESH on 19/08/20.
//  Copyright © 2020 mitesh. All rights reserved.
//

import UIKit
import Alamofire

class ImageCategoryTableViewCell: CategoryTableViewCell {

    let categoryImageView: UIImageView! = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.image = UIImage(systemName: "film")
        img.clipsToBounds = true
        return img
    }()
        
    var category: Category?{
        didSet{
            guard let categoryObj = category else { return }
            
            idLable.text = categoryObj.id
            typeLable.text = categoryObj.type.capitalized
            dateLable.text = categoryObj.date
            categoryImageView.downloadImage(for: categoryObj)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //Fix 150 height for image data in list cell
        categoryImageView.snp.makeConstraints { (make) in
            make.height.equalTo(150)
        }
        
        containerView.addArrangedSubview(categoryImageView)
            
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


