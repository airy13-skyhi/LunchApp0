//
//  DetailViewController.swift
//  LunchApp0
//
//  Created by Manabu Kuramochi on 2021/04/11.
//

import UIKit
import SDWebImage
import Cosmos

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var contentModel:ContentModel?
    var loadModel = LoadModel()
    
    var imageView = UIImageView()
    var blurEffectView = UIVisualEffectView()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        imageView.sd_setImage(with: URL(string: (contentModel?.imageURLString)!), completed: nil)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/2)
        
        tableView.tableHeaderView = imageView
        let blurEffect = UIBlurEffect(style: .light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = tableView.tableHeaderView!.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.tableHeaderView?.addSubview(blurEffectView)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let shopLabel = cell.contentView.viewWithTag(1) as! UILabel
        shopLabel.text = contentModel?.shopName
        
        let priceLabel = cell.contentView.viewWithTag(2) as! UILabel
        priceLabel.text = contentModel?.price
        
        let reviewTextView = cell.contentView.viewWithTag(3) as! UITextView
        reviewTextView.text = contentModel?.review
        
        let reviewView = cell.contentView.viewWithTag(4) as! CosmosView
        reviewView.rating = (contentModel?.rate)!
        
        let profileImageView = cell.contentView.viewWithTag(5) as! UIImageView
        
        
        
        return cell
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
