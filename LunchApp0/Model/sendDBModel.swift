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


class SendDBModel {
    
    let db = Firestore.firestore()
    var sendProfileDone:SendProfileDone?
    var userDefaultsEX = UserDefaultsEX()
    
    
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
    
    
}

