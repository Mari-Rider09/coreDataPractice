//
//  favouriteViewController.swift
//  drinkNotification
//
//  Created by Apple on 15/02/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import CoreData
 
class favouriteViewController: UIViewController {
    
   
    var favJuices = [FavouriteJuices]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        navigationItem.title = "DWC"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favJuices.removeAll()
        favJuices = DataBaseHelper.sharedInstance.getFavouriteData()
        self.tableView.reloadData()
    }
}

extension favouriteViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favJuices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! favouriteTableViewCell
        cell.juiceName.text = favJuices[indexPath.row].juiceName
        if let imageData = favJuices[indexPath.row].juiceImage as NSData? {
            if let image = UIImage(data:imageData as Data) {
                cell.juiceImage.image = image//UIImage(data: abc[indexPath.row].juiceImage!)
            }
        }
        
        cell.juiceDescription.text = favJuices[indexPath.row].juiceDescription
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "detailTableViewController") as! detailTableViewController
        vc.juiceDetailss = favJuices[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
  
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            favJuices = DataBaseHelper.sharedInstance.deleteFavouriteJuice(index: indexPath.row)
            favJuices.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
           
        }
    }
}
