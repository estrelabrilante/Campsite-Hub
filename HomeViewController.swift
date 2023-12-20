//
//  HomeViewController.swift
//  Campsite Hub
//
//  Created by SHYNU MARY VARGHESE on 2023-12-02.
//

import UIKit

class HomeViewController: UIViewController{
    var email = String()
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = email
        // Do any additional setup after loading the view.
        //to set the dataSource and delegate property.
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        //register a UICollectionViewCell subclass for use with your homecollectionview
        homeCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
    }
}
//MARK: supply data to the cells
extension HomeViewController: UICollectionViewDataSource{
    // first method to return the number of items.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    //second method to return the cell to be displayed.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.backgroundColor = .blue
        
        return cell
    }
    
}
//MARK: interact with the view cells
//delegate object is responsible for managing selection behaviour and interactions with individual items.
extension HomeViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = homeCollectionView.cellForItem(at: indexPath) as! HomeCollectionViewCell
    }
}
