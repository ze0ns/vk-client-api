//
//  frendProfileController.swift
//  VK-Agent
//
//  Created by zeons on 25.07.2021.
//
import UIKit
final class frendProfileController: UIViewController{
  
    var news: [newsModel] = []
    var myFrend: [frendModel] = []
    var frendRow: Int = 0  //Переменная для сохранения выбора ячейки
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var nameTest: UILabel!
    @IBOutlet private var liveCityLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var imageName: avatatImage!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let storage = frendStorage()
        let newsStorege = newsStorage()
        myFrend = storage.frends
        news = newsStorege.news
        
        imageName.image = UIImage(named:myFrend[frendRow].avatar)
        liveCityLabel.text! = myFrend[frendRow].frendProfile.City
        birthdayLabel?.text = myFrend[frendRow].frendProfile.birthday
        nameTest.text = myFrend[frendRow].name
        
        
        tableView.dataSource = self
        tableView.delegate = self

        
    }
 
}
extension frendProfileController: UITableViewDelegate, UITableViewDataSource {
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
            let cell = tableView.dequeueReusableCell(withIdentifier: newsTableViewCell.reusedIdentifier, for: indexPath) as? newsTableViewCell //метод который позволяет переиспользовать ячейку. мы принудельно указали ему тип переменной - наш тип
        else {
            return UITableViewCell()
        }
        let newsText = news[indexPath.row]
        cell.configure(news: newsText)
        print(newsText)
        return cell
    }

}
