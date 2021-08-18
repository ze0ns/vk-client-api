//
//  groupViewController.swift
//  VK-Agent
//
//  Created by zeons on 11.07.2021.
//

import UIKit
final class groupViewController: UIViewController{
    
    @IBOutlet var collectionView: UICollectionView!
    
    var groups: [groupModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let storage = groupsStorage()
        groups = storage.groups
        
    }
    @IBAction func addGroup(_ segue: UIStoryboardSegue){
        guard
            segue.identifier == "addGroup",
            let sourceController = segue.source as? findGroupController,       //приведение к определенному типу
            let indexPath = sourceController.tableView.indexPathForSelectedRow // Опеределили ячейку которую нажали
            else {
           return
        }
        let myGroup = sourceController.allGroups[indexPath.row]
        if !groups.contains(where: {$0.name == myGroup.name}){
            groups.append(myGroup)
            collectionView.reloadData()
            
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let group = groups[indexPath.item]

        let questionController = UIAlertController(title: "Изменения", message: nil, preferredStyle: .alert)
        //позже добавим функционал - отпкрыть группу
        questionController.addAction(UIAlertAction(title: "Переименовать группу", style: .default, handler: {

                (action:UIAlertAction!) -> Void in

            let ac = UIAlertController(title: "Переименовать группу", message: nil, preferredStyle: .alert)
            ac.addTextField(configurationHandler: nil)

            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            ac.addAction(UIAlertAction(title: "OK", style: .default) { [unowned self, ac] _ in
                    let newName = ac.textFields![0]
                        newName.text = group.name

                    self.collectionView.reloadData() })

                   //self.presentViewController(ac, animated: true, completion: nil)
                    self.present(ac, animated: true, completion: nil)
            }))

           questionController.addAction(UIAlertAction(title: "Удалить группу", style: .default, handler: {

                (action:UIAlertAction!) -> Void in

                print("delete")
                self.groups.remove(at: indexPath.item)
                collectionView.reloadData()

            }))

            self.present(questionController, animated: true, completion: nil)
    }
    
}

extension groupViewController: UICollectionViewDelegate{
    
}

extension groupViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: groupsCollectionViewCell.identifier, for: indexPath) as! groupsCollectionViewCell
        let group = groups[indexPath.item]
        cell.configure(groups: group)
        
        return cell
    }
    
   
}
