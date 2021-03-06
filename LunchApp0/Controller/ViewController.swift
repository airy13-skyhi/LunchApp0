//
//  ViewController.swift
//  LunchApp0
//
//  Created by Manabu Kuramochi on 2021/04/07.
//

import UIKit
import AMPagerTabs
import FirebaseAuth

class ViewController: AMPagerTabsViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings.tabBackgroundColor = #colorLiteral(red: 0.2819149196, green: 0.7462226748, blue: 0.6821211576, alpha: 1)
        settings.tabButtonColor = #colorLiteral(red: 0.2819149196, green: 0.7462226748, blue: 0.6821211576, alpha: 1)
        
        isTabButtonShouldFit = true
        
        settings.tabHeight = 100
        
        tabFont = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        //ここにcontrollerを入れるとtabが生成される
        self.viewControllers = getTabs()
        
        if Auth.auth().currentUser != nil {
            
            //サインイン画面遷移
            performSegue(withIdentifier: "signInVC", sender: nil)
            
        }else {
            //新規登録
            performSegue(withIdentifier: "createVC", sender: nil)
            
            
            
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    func getTabs() -> [UIViewController] {
        
        
        var vcArray = [UIViewController]()
        
        for i in 0 ..< 5 {
            
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "view1") as! ContentsViewController
            viewController.title = "\(Constants.titleArray[i])"
            viewController.index = i
            vcArray.append(viewController)
        }
        
        return vcArray
    }
    
    
    
    
    
}

