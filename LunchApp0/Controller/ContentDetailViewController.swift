//
//  ContentDetailViewController.swift
//  LunchApp0
//
//  Created by Manabu Kuramochi on 2021/04/14.
//

import UIKit

class ContentDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GetDataProtocol {
    
    
    
    var loadModel = LoadModel()
    
    var contentModel:ContentModel?
    var contentModelArray = [ContentModel]()
    var userID = String()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        loadModel.getDataProtocol = self
        
        tableView.register(UINib(nibName: "ContentsCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        loadModel.loadOwnContents(id: userID)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentModelArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ContentsCell
        
        cell.selectionStyle = .none
        
        cell.contentImageView.sd_setImage(with: URL(string: contentModelArray[indexPath.row].imageURLString!), completed: nil)
        
        cell.shopNameLabel.text = contentModelArray[indexPath.row].shopName
        cell.priceLabel.text = contentModelArray[indexPath.row].price
        cell.reviewLabel.text = contentModelArray[indexPath.row].review
        cell.reviewView.rating = contentModelArray[indexPath.row].rate!
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 327
    }
    
    
    func getData(dataArray: [ContentModel]) {
        
        contentModelArray = []
        contentModelArray = dataArray
        tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
