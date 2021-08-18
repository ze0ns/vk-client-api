//
//  findGroupController.swift


import UIKit
final class findGroupController: UIViewController{
  

    var allGroups: [groupModel] = []
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let storage = groupsStorage()
        allGroups = storage.allGroups
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToAllGroup"{
            segue.destination.title = "All Groups"
        }
    }
}
extension findGroupController: UITableViewDelegate, UITableViewDataSource {
        //Определяем количество секций
        func numberOfSections(in tableView: UITableView) -> Int {
            1
        }
        //Определяем количество ячеек . Ячеек у нас будет столько же , сколько друзей.
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            allGroups.count //количество друзей
        }
        
        // cellForRowAt метод в котором мы должны вернуть тип ячейки
        // настраиваем нашу ячейку (подробнее 1:00:00 занаятие 3)
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: groupsTableViewCell.reusedIdentifier, for: indexPath) as? groupsTableViewCell
            else {
                return UITableViewCell()
            }
            let group = allGroups [indexPath.row]
            cell.configure(allGroups: group)
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //пренудительно вызовем нашу сегу по иднетификатору
          //performSegue(withIdentifier: "addGroup", sender: nil)
        }
    
    
}

