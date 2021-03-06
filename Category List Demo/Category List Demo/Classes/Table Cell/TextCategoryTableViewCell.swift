//
//  CategoryTableViewCell.swift
//  Category List Demo
//
//  Created by MiTESH on 19/08/20.
//  Copyright © 2020 mitesh. All rights reserved.
//

import UIKit
import SnapKit

class TextCategoryTableViewCell: CategoryTableViewCell {
    
    var dataLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        //Fix 4 lines showing in list
        label.numberOfLines = 4
        
        return label
    }()
        
    var category: Category?{
        didSet{
            guard let categoryObj = category else { return }
            
            idLable.text = categoryObj.id
            typeLable.text = categoryObj.type.capitalized
            dateLable.text = categoryObj.date
            dataLable.text = categoryObj.data
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //Add data lable in list
        containerView.addArrangedSubview(dataLable)
            
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
