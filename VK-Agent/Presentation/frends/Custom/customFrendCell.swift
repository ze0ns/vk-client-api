//
//  customFrendCell.swift
//  VK-Agent
//
//  Created by Oschepkov Aleksandr on 27.07.2021.
//

import UIKit
final class customFrendCell: UITableViewCell {
    static let reusedIdentifier = "customFrendCell"

  
    @IBOutlet  var customAvatar: customAvatarView!
    
    @IBOutlet  var customLabel: UILabel!
    
    //функция конфигурирования ячейки
    func configure(frend: frendModel){
        let image = UIImage(named: frend.avatar)
        customAvatar.setImage(image)
        customLabel.text = frend.name
    }
}
