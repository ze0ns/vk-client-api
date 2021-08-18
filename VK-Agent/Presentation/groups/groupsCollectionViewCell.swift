//
//  groupsCollectionViewCell.swift
//  VK-Agent
//
//  Created by zeons on 11.07.2021.
//

import UIKit
final class groupsCollectionViewCell: UICollectionViewCell{
    static let identifier = "groupsCollectionViewCell"
    

    @IBOutlet  var imageGroupView: UIImageView!
    @IBOutlet private var nameGroupLabel: UILabel!
    @IBOutlet private var cityGroupLabel: UILabel!
    
    //когда хотим добавить статические элементы
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    // Вызывается когда макет загружен
    override class func awakeFromNib() {
        super.awakeFromNib()
        //округляем вьюшку по краям указывая радиус
 
    }
    
    
    //Вызывается когда размеры макета подсчитаны и установлены , когда система уже подсчитала все что вы разместили на сториборд
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2    //делаем круг
        layer.masksToBounds = false  //обрезаем по слою
        layer.shadowOffset = CGSize(width: 10, height: 10)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 5
        layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor

    }
    
    func configure(groups: groupModel){
        imageGroupView.image = UIImage(named:groups.avatar)
        nameGroupLabel.text = "\(groups.name)"
        cityGroupLabel.text = "\(groups.nameCity)"
    }
}
