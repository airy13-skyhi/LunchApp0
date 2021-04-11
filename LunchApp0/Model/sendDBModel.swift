//
//  sendDBModel.swift
//  LunchApp0
//
//  Created by Manabu Kuramochi on 2021/04/08.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import Firebase
import FirebaseStorage
import PKHUD

protocol SendProfileDone {
    
    func checkOK()
    
}

protocol DoneSendContents {
    
    func checkDone()
    
}


class SendDBModel {
    
    let db = Firestore.firestore()
    var sendProfileDone:SendProfileDone?
    var userDefaultsEX = UserDefaultsEX()
    var myProfile = [String]()
    var doneSendContents:DoneSendContents?
    
    
    //プロフィールをDBへ送信する
    func sendProfileDB(userName:String, profileText:String, imageData:Data) {
        
        //処理
        HUD.show(.progress)
        HUD.dimsBackground = true
        
        //pass url
        let imageRef = Storage.storage().reference().child("ProfileImage").child("\(UUID().uuidString + String(Date().timeIntervalSince1970)).jpg")
        
        
        imageRef.putData(imageData, metadata: nil) { (metaData, error) in
            
            if error != nil {
                return
            }
            
            imageRef.downloadURL { (url, error) in
                
                if url != nil {
                    
                    let profileModel = ProfileModel(imageURLString: url?.absoluteString, profileText: profileText, userName: userName, userID: Auth.auth().currentUser!.uid)
                    
                    
                    //アプリ内に自分のprofileを保存しておく
                    self.userDefaultsEX.set(value: profileModel, forkey: "profile")
                    
                    
                    //送信
                    self.db.collection("Users").document(Auth.auth().currentUser!.uid).setData(["userName":userName, "profileText":profileText, "userID":Auth.auth().currentUser!.uid, "image":url?.absoluteString, "Date":Date().timeIntervalSince1970])
                    
                    
                    
                    
                    //画面遷移をする
                    self.sendProfileDone?.checkOK()
                    
                }
                
            }
            
        }
        
    }
    
    //category,userのOwndContentsの中に入れるmethod(func)
    func sendDB(price:String, category:String, shopName:String, reView:String, userName:String, imageData:Data, sender:ProfileModel, rate:Double) {
        
        let imageRef = Storage.storage().reference().child("contentImage").child("\(UUID().uuidString + String(Date().timeIntervalSince1970)).jpg")
        
        imageRef.putData(imageData, metadata: nil) { (metaData, error) in
            
            if error != nil {
                return
            }
            
            imageRef.downloadURL{ (url, error) in
                
            
                if error != nil {
                    return
                }
                if url != nil {
                    
                    self.myProfile.append(sender.imageURLString!)
                    self.myProfile.append(sender.profileText!)
                    self.myProfile.append(sender.userID!)
                    self.myProfile.append(sender.userName!)
                    
                    
                    self.db.collection("Users").document(Auth.auth().currentUser!.uid).collection("ownContents").document().setData(["userName":userName, "userID":Auth.auth().currentUser!.uid, "price":price, "shopName":shopName, "review":reView, "image":url?.absoluteString, "sender":self.myProfile, "rate":rate, "date":Date().timeIntervalSince1970])
                    
                    self.db.collection(category).document().setData(["userName":userName, "userID":Auth.auth().currentUser!.uid, "price":price, "shopName":shopName, "review":reView, "image":url?.absoluteString, "sender":self.myProfile, "rate":rate, "date":Date().timeIntervalSince1970])
                    
                    self.doneSendContents?.checkDone()
                    
                }
                
                
            }
            
        }
        
    }
    
    
    
    
    
}
