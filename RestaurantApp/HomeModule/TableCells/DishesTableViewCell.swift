//
//  DishesTableViewCell.swift
//  RestaurantApp
//
//  Created by webcodegenie on 19/06/24.
//

import UIKit

class DishesTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var dishesImages = ["pizza-dish", "pizza-dish-1", "idli-dish", "idli-dish-3", "dosa-dish", "dosa-dish-2", "burger-dish", "burger-dish-3", "burger-dish-1"]

    
    @IBOutlet weak var DishesCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        DishesCollectionView.delegate = self
        DishesCollectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dishesImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = DishesCollectionView.dequeueReusableCell(withReuseIdentifier: "DishesCollectionViewCell", for: indexPath) as! DishesCollectionViewCell
        
        cell.imageMainDish.image = UIImage(named: dishesImages[indexPath.item])
        
        cell.viewDishes.layer.cornerRadius = 16
        cell.viewDishes.clipsToBounds = true

        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 158, height: 127)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }

}
