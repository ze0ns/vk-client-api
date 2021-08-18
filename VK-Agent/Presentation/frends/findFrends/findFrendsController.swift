//
//  findFrendsController.swift
//  VK-Agent
//
//  Created by zeons on 11.07.2021.
//

import UIKit
final class findFrendsController: UIViewController{
  
    @IBOutlet var tableView: UITableView!
    
    //var frends = [frendModel]()
    var frendSection = [[frendModel]]()  //Храним масив масивов для секции
    private var firstLetters: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frends = frendStorage().findFrends.sorted(by: {$0.name < $1.name}) //добавим в нашем массиве сортировку по алфавиту
        firstLetters = getFirstLetters(frends)
        //подпишем нашу вьюху на делегат и датасоурс вручную
        //методы которые заставляют нашу таблицу работать
        
        frendSection = sortedForSection(frends, firstLetters: firstLetters) //Заполняем наш масси отсортировав его
        tableView.delegate = self
        tableView.dataSource = self
        
        //зарегистрируем ячейку, нарисованную в xib
        //установим высоту ячейки вручную 230
        tableView.register(UINib(nibName:customFrendCell.reusedIdentifier, bundle: nil), forCellReuseIdentifier: customFrendCell.reusedIdentifier)
        
        tableView.register(customHeader.self, forHeaderFooterViewReuseIdentifier: customHeader.reusedIdentifier) //регистрируем нашу секцию через класс
        
        
    }
    private func sortedForSection(_ frends: [frendModel], firstLetters: [String]) -> [[frendModel]] {
        var frendsSorted: [[frendModel]] = []
        //перебираем массив городов, берем и заполняем наш новый массив сначала массивом городов на одну букву, следующий массив на другую букву и т.д.
        firstLetters.forEach{ letter in
         let frendForLetter = frends.filter {String($0.name.prefix(1)) == letter}
            frendsSorted.append(frendForLetter)
        }
        return frendsSorted
    }
    private func getFirstLetters(_ frends: [frendModel]) -> [String] {
        let frendName = frends.map { $0.name }
        let firstLetters = Array(Set(frendName.map { String($0.prefix(1)) })).sorted()
        return firstLetters
    }


}

extension findFrendsController: UITableViewDelegate, UITableViewDataSource {
    //Определяем количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        frendSection.count
    }
    //Определяем количество ячеек . Ячеек у нас будет столько же , сколько друзей.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        frendSection[section].count
    }
    
    // cellForRowAt метод в котором мы должны вернуть тип ячейки
    // настраиваем нашу ячейку (подробнее 1:00:00 занаятие 3)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: customFrendCell.reusedIdentifier, for: indexPath) as? customFrendCell //метод который позволяет переиспользовать ячейку. мы принудельно указали ему тип переменной - наш тип
        else {
            return UITableViewCell()
        }
        let frend = frendSection[indexPath.section][indexPath.row]
        cell.configure(frend: frend)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: customHeader.reusedIdentifier) as? customHeader
            else {
            return nil
        }
        header.configure(title: firstLetters[section])
        return header
    }
    
    
    //добавили принудительный вызов нашего унвин сигвея при нажатии на ячейку (для добавления друзей в список)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addFrend", sender: nil)
    }
    
}
