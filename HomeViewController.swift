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
   // ********************************************************************
    //image as string and title as string
  // let data : [CampModel] = [CampModel(image: "alice lake", title: "alice lake"),CampModel(image: "Grasslands National Park, Saskatchewan", title: "Grasslands National Park, Saskatchewan"),CampModel(image: "Lake Superior Provincial Park, Ontario", title: "Lake Superior Provincial Park, Ontario"),CampModel(image: "manitoba-nopiming-park", title: "manitoba-nopiming-park"),CampModel(image: "Peter Lougheed Provincial Park, Alberta", title: "Peter Lougheed Provincial Park, Alberta")]
   // ***********************************************************************
    //image as imageliteral and title as String --> [CampModel(newImage: #imageLiteral(resourceName: "alice lake"), title: "alice lake")]
    let newData : [CampModel] = [CampModel(title: "Peter Lougheed Provincial Park, Alberta", newImage: #imageLiteral(resourceName: "Lake Superior Provincial Park, Ontario")),CampModel(title: "alice lake", newImage: #imageLiteral(resourceName: "Lake Superior Provincial Park, Ontario")),CampModel(title: "Grasslands National Park, Saskatchewan", newImage: #imageLiteral(resourceName: "manitoba-nopiming-park")),CampModel(title: "Lake Superior Provincial Park, Ontario", newImage: #imageLiteral(resourceName: "LoginImage")),CampModel(title: "manitoba-nopiming-park", newImage: #imageLiteral(resourceName: "campsiteHub.jpg"))]
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = email
    }

}
extension HomeViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return campTitle.count
       // return data.count
        return newData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeViewCellIdentifier", for: indexPath) as! homeCollectionViewCell
        //cell.campTitle.text = campTitle[indexPath.row]
        //cell.campImage.image = UIImage(named: image[indexPath.row])
      //  cell.configure(with: data[indexPath.row])
        
        cell.configure(with: newData[indexPath.row])
        return cell
    }
    
    
}
