//
//  frendTableViewCell.swift
//  VK-Agent
//
//  Created by zeons on 11.07.2021.
//

import UIKit
final class frendTableViewCell: UITableViewCell {
    static let reusedIdentifier = "frendTableViewCell" //мы не сможем её вызвать дальше класса
    
    @IBOutlet private var avatarImageView: UIImageView!
    
    @IBOutlet private var frendMood: UIImageView!
    
    @IBOutlet private var frendName: UILabel!
    @IBOutlet private var city: UILabel!
    @IBOutlet private var birthday: UILabel!
    
    
    //функция для создания ячейки
    func configure(frend: frendModel){
        avatarImageView.image = UIImage(named: frend.avatar)
        city.text! = frend.frendProfile.City
        birthday?.text = frend.frendProfile.birthday
        frendMood.image = UIImage(named: frend.frendProfile.mood)
        frendName.text = frend.name
    }
}
