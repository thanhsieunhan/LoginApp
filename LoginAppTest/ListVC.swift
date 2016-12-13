//
//  ListVC.swift
//  LoginAppTest
//
//  Created by Lê Hà Thành on 12/12/16.
//  Copyright © 2016 Lê Hà Thành. All rights reserved.
//

import UIKit
import OEANotification

class ListVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var myTableView: UITableView!
    var list = [User]()
    var nameUserCurrent = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        
        myTableView.accessibilityLabel = "List Table"
        myTableView.isAccessibilityElement = true
        title = "List member"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(infoUser))
        
    }
    
    
    
    func infoUser(){
        var us : User?
        for i in list {
            if i.user == nameUserCurrent {
                us = i
                break
            }
        }
        
        let detailVC = DetailVC(nibName: "DetailVC", bundle: nil)
        detailVC.u = us
        detailVC.nameUserCurrenet = nameUserCurrent
        navigationController?.pushViewController(detailVC, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        list = getData()
        myTableView.reloadData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        list = getData()
        myTableView.reloadData()
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "ListVC", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! CustomCell
        cell.nameLabel?.text = list[indexPath.row].name
        cell.roleLabel.text = list[indexPath.row].user
        cell.avatarImage.image = UIImage(named: list[indexPath.row].avatar)
        let viewDelete = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 90))
        viewDelete.backgroundColor = UIColor.red
        cell.editingAccessoryView = viewDelete
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let u = list[indexPath.row]
        let detailVC = DetailVC(nibName: "DetailVC", bundle: nil)
        detailVC.u = u
        detailVC.nameUserCurrenet = nameUserCurrent
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let userDelete = list[indexPath.row]
        if nameUserCurrent == "admin@gmail.com" {
            if userDelete.user == "admin@gmail.com" {
                OEANotification.notify("Delete Error", subTitle: "You can't remove yourself", type: .warning, isDismissable: true)
            } else {
                PlistManager.sharedInstance.removeItemForKey(userDelete.user)
                OEANotification.notify("Delete Success", subTitle: "Delete \(userDelete.user) successfully", type: .success, isDismissable: true)
                list = getData()
                tableView.reloadData()
            }
        } else {
            OEANotification.notify("Delete Error", subTitle: "You don't have permission to remove", type: .warning, isDismissable: true)
        }
    }
}
