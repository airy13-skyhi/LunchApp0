//
//  CameraViewController.swift
//  LunchApp0
//
//  Created by Manabu Kuramochi on 2021/04/08.
//

import UIKit
import YPImagePicker
import EMAlertController
import PKHUD

class CameraViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var reviewView: CosmosView!
    @IBOutlet weak var categoryButton: UIButton!
    
    var categoryString = String()
    var userDefaultsEX = UserDefaultsEX()
    var sendDBModel = SendDBModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.clipsToBounds = true
        
        imageView.layer.cornerRadius = 20
        textField.layer.cornerRadius = 20
        nameTextField.layer.cornerRadius = 20
        textView.layer.cornerRadius = 20
        categoryButton.layer.cornerRadius = 20
        
        
        if imageView.image != nil {
            
            
        }else {
            
            //無設定
            showCamera()
        }
        
    }
    
    
    func showCamera(){
        var config = YPImagePickerConfiguration()
        // [Edit configuration here ...]
        // Build a picker with your configuration
        config.isScrollToChangeModesEnabled = true
        config.onlySquareImagesFromCamera = true
        config.usesFrontCamera = false
        config.showsPhotoFilters = true
        config.showsVideoTrimmer = true
        config.shouldSaveNewPicturesToAlbum = true
        config.albumName = "DefaultYPImagePickerAlbumName"
        config.startOnScreen = YPPickerScreen.photo
        //        config.screens = [.photo]
        config.screens = [.library]
        config.showsCrop = .none
        config.targetImageSize = YPImageSize.original
        config.overlayView = UIView()
        config.hidesStatusBar = true
        config.hidesBottomBar = false
        config.hidesCancelButton = false
        config.preferredStatusBarStyle = UIStatusBarStyle.default
        config.maxCameraZoomFactor = 1.0
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                self.imageView.image = photo.image
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
        
    }
    
    
    @IBAction func retake(_ sender: Any) {
        
        showCamera()
        
    }
    
    
    @IBAction func showCategory(_ sender: Any) {
        
        //alert
        let alert = EMAlertController(title: "この料理の", message: "カテゴリを選択してください。")
        
        for i in 0 ..< Constants.menuArray.count {
            
            
            let categoryButton = EMAlertAction(title: Constants.titleArray[i], style: .normal){
                
            self.categoryString = Constants.menuArray[i]
            self.categoryButton.text(Constants.titleArray[i])
            }
         
            alert.addAction(categoryButton)
            
        }
        
        let closeButton = EMAlertAction(title: "やり直す", style: .cancel)
        alert.cornerRadius = 1.0
        alert.iconImage = UIImage(named: "ok")
        alert.addAction(closeButton)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func send(_ sender: Any) {
        
        //load画面
        HUD.show(.progress)
        HUD.dimsBackground = true
        
        //自分のプロフィールをアプリ内から取ってくる
        let profile:ProfileModel? = userDefaultsEX.codable(forkey: "profile")
        
        
        //コンテンツとともに送信
        if textField.text?.isEmpty != true && categoryString.isEmpty != true && nameTextField.text?.isEmpty != true && textView.text.isEmpty != true {
            
            
            
        }
        
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
