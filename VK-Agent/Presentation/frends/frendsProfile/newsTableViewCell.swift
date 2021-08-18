//
//  newsTableViewCell.swift
//  VK-Agent
//
//  Created by zeons on 25.07.2021.
//
import UIKit
final class newsTableViewCell: UITableViewCell {
    static let reusedIdentifier = "newsTableViewCell" //мы не сможем её вызвать дальше класса

    @IBOutlet var newsTextLabel: UITextView!
    @IBOutlet var dateOfNews: UILabel!
    
    func configure(news: newsModel){
        newsTextLabel.text = news.newsText
        dateOfNews.text = news.newsDate
    }

}

