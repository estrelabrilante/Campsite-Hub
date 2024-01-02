//
//  homeCollectionViewCell.swift
//  Campsite Hub
//
//  Created by SHYNU MARY VARGHESE on 2024-01-01.
//

import UIKit

class homeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var campImage: UIImageView!
    
    @IBOutlet weak var campTitle: UILabel!
    //function to pass in these models into each cell in the view controller via the configure function.
    func configure(with model: CampModel){
        campTitle.text = model.title
        //campImage.image = UIImage(named: model.image)
        campImage.image = model.newImage
    }
    
}
