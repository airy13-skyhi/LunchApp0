//
//  ProfileViewController.swift
//  LunchApp0
//
//  Created by Manabu Kuramochi on 2021/04/12.
//

import UIKit
import FirebaseAuth
import SDWebImage
import Cosmos
import SSSpinnerButton


class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var followLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var follorButton: SSSpinnerButton!
    
    @IBOutlet weak var profileTextLabel: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var loadModel = LoadModel()
    var sendDBModel = SendDBModel()
    var contentModel:ContentModel?
    var contentModelArray = [ContentModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        imageView.layer.cornerRadius = imageView.frame.width/2
        tableView.register(UINib(nibName: "ContentsCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        //自分のプロフィールを表示する　タブ２
        if self.tabBarController?.selectedIndex == 2 {
            
            follorButton.isHidden = true
            
        }else {
            
            if contentModel?.userID == Auth.auth().currentUser?.uid {
                
                follorButton.isHidden = true
                
            }
            
        }
    }
    
    
    func setUp(id:String) {
        
        //プロフィールを受信
        
        //フォローの受信
        
        //フォロワーの受信
        
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
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
