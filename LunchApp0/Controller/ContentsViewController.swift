//
//  CameraViewController.swift
//  LunchApp0
//
//  Created by Manabu Kuramochi on 2021/04/08.
//

import UIKit
import SDWebImage
import Cosmos


class ContentsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, GetDataProtocol {
    
    
    
    var index = Int()
    var contentModelArray = [ContentModel]()
    var loadModel = LoadModel()
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch index {
        
        case index:
            
            //loadを変更する
            loadModel.getDataProtocol = self
            loadModel.loadContents(category: "\(Constants.menuArray[index])")
            
            collectionView.delegate = self
            collectionView.dataSource = self
            
            break
        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch index {
        case index:
            return contentModelArray.count
        default:
            return contentModelArray.count
            
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        //cellの影
        cell.layer.cornerRadius = 15.0
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 1
        cell.layer.masksToBounds = false
        
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        imageView.sd_setImage(with: URL(string: contentModelArray[indexPath.row].imageURLString!), completed: nil)
        imageView.layer.cornerRadius = 20
        
        
        let label = cell.contentView.viewWithTag(2) as! UILabel
        label.text = contentModelArray[indexPath.row].shopName
        
        let reviewView = cell.contentView.viewWithTag(3) as! CosmosView
        reviewView.rating = contentModelArray[indexPath.row].rate!
        
        
        return cell
        
    }
    
    
    func getData(dataArray: [ContentModel]) {
        
        print(dataArray)
        contentModelArray = dataArray
        collectionView.reloadData()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "detailVC", sender: indexPath.row)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailVC = segue.destination as! DetailViewController
        detailVC.contentModel = contentModelArray[sender as! Int]
        
        
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
