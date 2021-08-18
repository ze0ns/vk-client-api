//
//  customHeader.swift
//  VK-Agent
//
//  Created by zeons on 28.07.2021.
//

import UIKit
final class customHeader: UITableViewHeaderFooterView {
    static let reusedIdentifier = "customHeader"
    var letter: String = ""

    //Добавим надпись
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = true //устанавливаем констрейны , отключили авторесайзинг
        label.textAlignment = .center  //выровняли текст по центру
        label.textColor = .orange  //установили цвет текста - оранжевый
        return label
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
    }
    func configure(title: String?){
        letter = title!
        label.text = letter

    }
    
    
    private func setViews(){
        contentView.addSubview(label)  //добавим наш текст на вьюшку
        //Установим констрейны
        //4 констрейны по периметру
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        
        ])
    }
}
