//
//  TabBarController.swift
//  LunchApp0
//
//  Created by Manabu Kuramochi on 2021/04/15.
//

import UIKit

class TabBarController: UITabBarController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.items![0].image = UIImage(named: "tab1notSelected.png")?.withRenderingMode(.alwaysOriginal)
        tabBar.items![1].image = UIImage(named: "tab2notSelected.png")?.withRenderingMode(.alwaysOriginal)
        tabBar.items![2].image = UIImage(named: "tab3notSelected.png")?.withRenderingMode(.alwaysOriginal)
        
        tabBar.items![0].selectedImage = UIImage(named: "tab1.png")
        tabBar.items![1].selectedImage = UIImage(named: "tab2.png")
        tabBar.items![2].selectedImage = UIImage(named: "tab3.png")
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
