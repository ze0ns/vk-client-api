//
//  allNewsController.swift
//  VK-Agent
//
//  Created by zeons on 31.07.2021.
//

import UIKit
final class allNewsController: UIViewController{
  
    var news: [newsModel] = []

    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let newsStorege = newsStorage()
        news = newsStorege.news
        tableView.dataSource = self
        tableView.delegate = self

    }


}
extension allNewsController: UITableViewDelegate, UITableViewDataSource {
    //Определяем количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    //Определяем количество ячеек . Ячеек у нас будет столько же , сколько новостей.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count //количество новостей
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: allNewsTableViewCell.reusedIdentifier, for: indexPath) as? allNewsTableViewCell //метод который позволяет переиспользовать ячейку. мы принудельно указали ему тип переменной - наш тип
        else {
            return UITableViewCell()
        }
        let newsText = news[indexPath.row]
        cell.configure(news: newsText)
        return cell
    }

}

