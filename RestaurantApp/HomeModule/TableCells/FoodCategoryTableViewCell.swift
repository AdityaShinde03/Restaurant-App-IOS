//
//  FoodCategoryTableViewCell.swift
//  RestaurantApp
//
//  Created by webcodegenie on 19/06/24.
//

import UIKit

class FoodCategoryTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    

    @IBOutlet weak var FoodCategoryCollectionView: UICollectionView!
    
    var foodCategoryImages = ["pizza-32", "burger-32", "cola-32", "nachos-32", "hotdog-32", "pizza-32", "burger-32", "cola-32", "nachos-32", "hotdog-32"]
    var foodCategoryNames = ["pizza", "burger", "cola", "nachos", "hotdog", "pizza", "burger", "cola", "nachos", "hotdog"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        FoodCategoryCollectionView.delegate = self
        FoodCategoryCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        foodCategoryNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = FoodCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "FoodCategoryCollectionViewCell", for: indexPath) as! FoodCategoryCollectionViewCell
        
        cell.imageFoodCategory.image = UIImage(named: foodCategoryImages[indexPath.item])
        
        cell.lbFoodCategoryName.text = foodCategoryNames[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 51, height: 86)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }

}
