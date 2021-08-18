//
//  frendsViewController.swift
//  VK-Agent
//
//  Created by Aleksandr Oschepkov on 09.07.2021.
//

import UIKit

class frendsViewController: UIViewController {
    
    @IBOutlet  var tableView: UITableView!

    var frendSection = [[frendModel]]()  //Храним масив масивов для секции
    private var firstLetters: [String] = []
    var frends = [frendModel]()
    var rows = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Для примера при запуске мы вызываем наше хранилище со списком друзей и их профелей
        
        frends = frendStorage().frends.sorted(by: {$0.name < $1.name}) //добавим в нашем массиве сортировку по алфавиту
        firstLetters = getFirstLetters(frends)
        frendSection = sortedForSection(frends, firstLetters: firstLetters)
        
        tableView.register(customHeader.self, forHeaderFooterViewReuseIdentifier: customHeader.reusedIdentifier) //регистрируем нашу секцию через класс
        
        
    }
    private func sortedForSection(_ frends: [frendModel], firstLetters: [String]) -> [[frendModel]] {
        var frendsSorted: [[frendModel]] = []
        //перебираем массив друзей, берем и заполняем наш новый массив сначала массивом друзей одну букву, следующий массив на другую букву и т.д.
        firstLetters.forEach{ letter in
         let frendForLetter = frends.filter {String($0.name.prefix(1)) == letter}
            frendsSorted.append(frendForLetter)
        }
        return frendsSorted
    }
    
    //Определяем первую букву в списке
    private func getFirstLetters(_ frends: [frendModel]) -> [String] {
        let frendName = frends.map { $0.name }
        let firstLetters = Array(Set(frendName.map { String($0.prefix(1)) })).sorted()
        return firstLetters
    }

    //определяем параметры для передачи в следующий контроллер по идентификатору сигвея
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                guard segue.identifier == "moveToProfile" else { return }
                guard let destination = segue.destination as? frendProfileController else { return }
              destination.frendRow = rows
    }

    @IBAction func addFrend(_ segue: UIStoryboardSegue){
        guard
            segue.identifier == "addFrend",
            let sourceController = segue.source as? findFrendsController,       //приведение к определенному типу
            let indexPath = sourceController.tableView.indexPathForSelectedRow // Опеределили ячейку которую нажали
            else {
           return
        }
        let frend = sourceController.frendSection[indexPath.section][indexPath.row]
        
       // Добавляем проверку, если друг с таким именем - не добавляем (func .contains)
        if !frends.contains(where: {$0.name == frend.name}){
           //frends.append(frend)
            frendSection[indexPath.section].append(frend)
            tableView.reloadData()
            
        }
    }
    
}

extension frendsViewController: UITableViewDelegate, UITableViewDataSource {
    //Определяем количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        frendSection.count
    }
    //Определяем количество ячеек . Ячеек у нас будет столько же , сколько друзей.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        frendSection[section].count //количество друзей
    }
    
    // cellForRowAt метод в котором мы должны вернуть тип ячейки
    // настраиваем нашу ячейку (подробнее 1:00:00 занаятие 3)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: frendTableViewCell.reusedIdentifier, for: indexPath) as? frendTableViewCell
        else {
            return UITableViewCell()
        }
        let frend = frendSection[indexPath.section][indexPath.row]
        cell.configure(frend: frend)
        return cell
    }
    //необходимо добавить у каждого друга ID , передавать его между контроллерами
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  let frend = frendSection[indexPath.section][indexPath.row]
        rows = indexPath.section
 
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
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //Если нажата кнопка - Удалить
        if editingStyle == .delete{
            //Удаляем друга из масива
            //frendSection[indexPath.section][indexPath.row].remove(at: indexPath.row)
            frendSection[indexPath.section].remove(at: indexPath.row)
            //Удаляем ячейку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
}
