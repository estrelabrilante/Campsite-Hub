//
//  HomeViewController.swift
//  Campsite Hub
//
//  Created by SHYNU MARY VARGHESE on 2024-01-01.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var email = String()
    let campTitle : [String] = ["alice lake","Grasslands National Park, Saskatchewan","Lake Superior Provincial Park, Ontario","manitoba-nopiming-park","Peter Lougheed Provincial Park, Alberta"]
     let image : [String] = ["alice lake","Grasslands National Park, Saskatchewan","Lake Superior Provincial Park, Ontario","manitoba-nopiming-park","Peter Lougheed Provincial Park, Alberta"]
    @IBOutlet weak var homeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = email
    }

}
extension HomeViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return campTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeViewCellIdentifier", for: indexPath) as! homeCollectionViewCell
        cell.campTitle.text = campTitle[indexPath.row]
        cell.campImage.image = UIImage(named: image[indexPath.row])
        
        
        return cell
    }
    
    
}
