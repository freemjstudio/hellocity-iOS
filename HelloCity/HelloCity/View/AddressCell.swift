//
//  AddressCell.swift
//  HelloCity
//
//  Created by 우민지 on 2023/06/16.
//

import UIKit

class AddressCell: UITableViewCell {
    let cellId = "cell"
    
    var myImage = UIImageView()
    var myButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        self.addSubview(myImage)
        self.addSubview(myButton)
        
//        myImage.translatesAutoresizingMaskIntoConstraints = false
//        myImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,
//                                         constant: 10).isActive = true
//        myImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        myImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
//        myImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
//
//        myButton.translatesAutoresizingMaskIntoConstraints = false
//        myButton.leadingAnchor.constraint(equalTo: myImage.trailingAnchor, constant: 10)
//        myButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("btn Tapped ! ")
  
    }

}
