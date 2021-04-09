//
//  CreateUserViewController.swift
//  LunchApp0
//
//  Created by Manabu Kuramochi on 2021/04/08.
//

import UIKit
import FirebaseAuth
import PKHUD

class CreateUserViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate ,SendProfileDone {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var profileTextView: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    
    var sendDBModel = SendDBModel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendDBModel.sendProfileDone = self
        imageView.layer.cornerRadius = imageView.frame.width/2
        userNameTextField.layer.cornerRadius = 20
        profileTextView.layer.cornerRadius = 20
        doneButton.layer.cornerRadius = 20
        
    }
    
    
    @IBAction func tap(_ sender: Any) {
        
        //カメラ立ち上げ
        openCamera()
    }
    
    func openCamera(){
        let sourceType:UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            cameraPicker.allowsEditing = true
//            cameraPicker.showsCameraControls = true
            present(cameraPicker, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if let pickedImage = info[.editedImage] as? UIImage
        {
            imageView.image = pickedImage
            //閉じる処理
            picker.dismiss(animated: true, completion: nil)
         }
 
    }
 
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func done(_ sender: Any) {
        
        //アカウントを作成する
        if userNameTextField.text?.isEmpty != true  {
            
            
            Auth.auth().signInAnonymously { [self] (result, error) in
                
                let data = imageView.image?.jpegData(compressionQuality: 0.1)
                
                if error != nil {
                    
                    print("エラーです")
                }else {
                    
                    sendDBModel.sendProfileDB(userName: userNameTextField.text!, profileText: profileTextView.text!, imageData: data!)
                    
                }
                
                
            }
            
        }
        
    }
    
    
    func checkOK() {
        
        //sendDBModel内で呼ばれたcheckOKが呼ばれる、タイミングで呼ばれる
        
        HUD.hide()
        
        
        
        
        //画面を戻る モーダル画面遷移
        self.dismiss(animated: true, completion: nil)
        
        
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
