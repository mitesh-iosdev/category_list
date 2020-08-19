//
//  CategoryTableViewCell.swift
//  Category List Demo
//
//  Created by MiTESH on 19/08/20.
//  Copyright © 2020 mitesh. All rights reserved.
//

import UIKit

class DetailCategoryTableViewCell: UITableViewCell {
    
    //Main container view
    let containerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    //Container view for first row items. For type content
    let firstRowView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.alignment = .top
        return stackView
    }()
    
    //Container view for second row items. For Id content
    let secnodRowView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.alignment = .top
        return stackView
    }()
    
    //Container view for third row items. For date content
    let thirdRowView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.alignment = .top
        return stackView
    }()
    
    //Container view for Fourth row items. For data content
    let fourthRowView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.alignment = .top
        return stackView
    }()
    
    var dateTitleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Date:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(UILayoutPriority.init(rawValue: 999), for: .horizontal)
        return label
    }()
    var dateLable: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var typeTitleLabl: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Type:"
        label.setContentHuggingPriority(UILayoutPriority.init(rawValue: 999), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var typeLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Other"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var idTitleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Id:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(UILayoutPriority.init(rawValue: 999), for: .horizontal)
        return label
    }()
    
    var idLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    var dataTitleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Data:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        firstRowView.addArrangedSubview(typeTitleLabl)
        firstRowView.addArrangedSubview(typeLable)
        
        secnodRowView.addArrangedSubview(idTitleLable)
        secnodRowView.addArrangedSubview(idLable)
        
        thirdRowView.addArrangedSubview(dateTitleLable)
        thirdRowView.addArrangedSubview(dateLable)
        
        fourthRowView.addArrangedSubview(dataTitleLable)
        
        containerView.addArrangedSubview(firstRowView)
        containerView.addArrangedSubview(secnodRowView)
        containerView.addArrangedSubview(thirdRowView)
        containerView.addArrangedSubview(fourthRowView)
        
        self.contentView.addSubview(containerView)
        
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
