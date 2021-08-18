//
//  allNewsTableViewCell.swift
//  VK-Agent
//
//  Created by zeons on 31.07.2021.
//

import UIKit
final class allNewsTableViewCell: UITableViewCell {
    static let reusedIdentifier = "allNewsTableViewCell" //мы не сможем её вызвать дальше класса
 
    @IBOutlet var newsAvatarImage: avatatImage!
    @IBOutlet var newsNameAvtor: UILabel!
    @IBOutlet var newsDate: UILabel!
    @IBOutlet var newsText: UITextView!
    
   func configure(news: newsModel){
        newsAvatarImage.image = UIImage(named: news.newsImage)
        newsNameAvtor.text = news.newsAvtor
        newsDate.text = news.newsDate
        newsText.text = news.newsText
    }

}
