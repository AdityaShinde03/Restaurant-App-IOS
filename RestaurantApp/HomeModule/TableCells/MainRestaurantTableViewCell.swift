//
//  MainRestaurantTableViewCell.swift
//  RestaurantApp
//
//  Created by webcodegenie on 19/06/24.
//

import UIKit

class MainRestaurantTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var MainRestaurantCollectionView: UICollectionView!
    
    var restaurantImages = ["KFC-64", "starbucks-64", "mcdonalds-64","KFC-64", "starbucks-64", "mcdonalds-64","KFC-64", "starbucks-64", "mcdonalds-64"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        MainRestaurantCollectionView.delegate = self
        MainRestaurantCollectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        restaurantImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MainRestaurantCollectionView.dequeueReusableCell(withReuseIdentifier: "MainRestaurantsCollectionViewCell", for: indexPath) as! MainRestaurantsCollectionViewCell
        
        cell.imageRestaurantIcon.image = UIImage(named: restaurantImages[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 77, height: 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }

}
