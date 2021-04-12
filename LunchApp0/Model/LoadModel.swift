//
//  LoadModel.swift
//  LunchApp0
//
//  Created by Manabu Kuramochi on 2021/04/09.
//

import Foundation
import Firebase


protocol GetDataProtocol {
    
    func getData(dataArray:[ContentModel])
}

class LoadModel {
    
    let db = Firestore.firestore()
    
    //受信された値のブロックが入る配列
    var contentModelArray:[ContentModel] = []
    var getDataProtocol:GetDataProtocol?
    
    
    
    //コンテンツを受信するメソッド
    func loadContents(category:String) {
        
        db.collection(category).order(by: "date").addSnapshotListener { (snapShot, error) in
            
            self.contentModelArray = []
            
            if let snapShotDoc = snapShot?.documents {
                
                for doc in snapShotDoc {
                    
                    let data = doc.data()
                    if let userID = data["userID"] as? String, let userName = data["userName"] as? String,let image = data["image"] as? String, let shopName = data["shopName"] as? String, let review = data["review"] as? String, let sender = data["sender"] as? [String], let price = data["price"] as? String, let rate = data["rate"] as? Double, let date = data["date"] as? Double {
                        
                        let contentModel = ContentModel(imageURLString: image, price: price, shopName: shopName, review: review, userName: userName, userID: userID, sender: sender, rate: rate)
                        
                        self.contentModelArray.append(contentModel)
                        self.getDataProtocol?.getData(dataArray: self.contentModelArray)
                        
                        
                    }
                    
                    
                }
                
            }
            
        }
        
    }
    
    
    func loadOwnContents(id:String) {
        
        db.collection("Users").document(id).collection("ownContens").order(by: "data").addSnapshotListener { (snapShot, error) in
            <#code#>
        }
        
    }
    
    
    
}

