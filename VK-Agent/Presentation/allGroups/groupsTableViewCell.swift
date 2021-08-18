//
//  groupsTableViewCell.swift
//  VK-Agent
//
//  Created by zeons on 21.07.2021.
//

import UIKit
final class groupsTableViewCell: UITableViewCell{
    static let reusedIdentifier = "groupsTableViewCell"
    

    @IBOutlet private var imageAllGroupView: UIImageView!
    @IBOutlet private var nameAllGroupLabel: UILabel!
    @IBOutlet private var descrAllGroupLabel: UILabel!
    
    func configure(allGroups: groupModel){
  
        imageAllGroupView.image = UIImage(named: allGroups.avatar)
        nameAllGroupLabel.text = "\(allGroups.name)"
        descrAllGroupLabel.text = "\(allGroups.nameCity)"
    
    }
}

