//
//  homeViewController.swift
//  drinkNotification
//
//  Created by Apple on 11/02/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import CoreData
class homeViewController: UIViewController,UISearchBarDelegate,UISearchControllerDelegate {
    
    @IBOutlet weak var txtSearhField: UITextField!
    @IBOutlet weak var tableView: UITableView!
   
    
//    let searchController = UISearchController(searchResultsController: nil)
    var drinkName = ["GG","A1","ABC","Kir","747"]
    var drinkDescription = ["Pour the galliano liqued","Pour all ingredients","Layered ina shot glass","Add the cream cass","Pour kaluha, then ballie"]
    var drinkImages = [#imageLiteral(resourceName: "imgGG"),#imageLiteral(resourceName: "imgA1"),#imageLiteral(resourceName: "imgABC"),#imageLiteral(resourceName: "imgKir"),#imageLiteral(resourceName: "img747")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let searchImage = UIImage(named: "down")!
        addLeftImageTo(textField: txtSearhField, andImage: searchImage)
    }


    
    func addLeftImageTo(textField: UITextField,andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.contentMode = .scaleAspectFit
        leftImageView.image = img
        textField.leftView = leftImageView
        textField.leftViewMode = .always
    }
}

extension homeViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinkDescription.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! homeTableViewCell
        cell.drinkImage.image = drinkImages[indexPath.row]
        cell.nameLabel.text = drinkName[indexPath.row]
        cell.descriptionLabel.text = drinkDescription[indexPath.row]
        cell.btnAddFavourite.tag = indexPath.row
        cell.btnAddFavourite.addTarget(self, action: #selector(cellbtnTapp), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @objc func cellbtnTapp(sender: UIButton){
        let index = sender.tag
        let name = drinkName[index]
        let description = drinkDescription[index]
        let image = drinkImages[index].pngData()!
        
        let dict = ["name": name,"description": description,"image": image] as [String : Any]
        DataBaseHelper.sharedInstance.saveToFavourite(saveDict: dict)
    }
}
