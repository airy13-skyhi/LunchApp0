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


class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GetDataProtocol, GetProfileDataProtocol, DoneSendContents0 {
    
    
    
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var followLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followButton: SSSpinnerButton!
    
    
    
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
        
        sendDBModel.doneSendContents0 = self
        
        //自分のプロフィールを表示する　タブ２
        if self.tabBarController?.selectedIndex == 2 {
            
            followButton.isHidden = true
            setUp(id: Auth.auth().currentUser!.uid)
            
            
        }else {
            
            if contentModel?.userID == Auth.auth().currentUser?.uid {
                
                followButton.isHidden = true
                
            }
            //setUp
            setUp(id: (contentModel?.userID)!)
            imageView.sd_setImage(with: URL(string: (contentModel?.sender![0])!), completed: nil)
            imageView.layer.cornerRadius =  20
            imageView.clipsToBounds = true
            label.text = contentModel?.sender![3]
            profileTextLabel.text = contentModel?.sender![1]
        }
        
    }
    
    
    func setUp(id:String) {
        
        loadModel.getDataProtocol = self
        loadModel.getProfileDataProtocol = self
        
        //プロフィールを受信
        loadModel.loadProfile(id: id)
        
        //フォローの受信
        
        
        //フォロワーの受信
        
        //コンテンツを受信する
        loadModel.loadOwnContents(id: id)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func getData(dataArray: [ContentModel]) {
        
        contentModelArray = dataArray
        
        tableView.reloadData()
    }
    
    @IBAction func follow(_ sender: Any) {
        
        followButton.startAnimate(spinnerType: .ballClipRotate, spinnercolor: .red, spinnerSize: 20) {
            
            if self.followButton.titleLabel?.text == "フォローをする" {
                
                self.sendDBModel.followAction(id: (self.contentModel?.userID)!, followOrNot: true, contentModel: self.contentModel!)
                
            }else if self.followButton.titleLabel?.text == "フォローをやめる" {
                
                self.sendDBModel.followAction(id: (self.contentModel?.userID)!, followOrNot: false, contentModel: self.contentModel!)
                
            }
            
            
        }
        
    }
    
    func checkDone0(flag: Bool) {
        
        if flag == true {
            
            self.followButton.stopAnimatingWithCompletionType(completionType: .none) {
                
                self.followButton.setTitle("フォローをやめる", for: .normal)
            }
        }else {
            
            self.followButton.stopAnimatingWithCompletionType(completionType: .none) {
                
                self.followButton.setTitle("フォローをする", for: .normal)
            }
            
        }
        
        
        
    }
    
    
    
    func getProfileData(dataArray: [ProfileModel]) {
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
