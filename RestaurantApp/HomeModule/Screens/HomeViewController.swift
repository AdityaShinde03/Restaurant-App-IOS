//
//  ViewController.swift
//  RestaurantApp
//
//  Created by webcodegenie on 19/06/24.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    
    // Main Table View
    
    @IBOutlet weak var RestaurantTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RestaurantTableView.delegate = self
        RestaurantTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        RestaurantTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        if index == 0 {
            
            let cell = RestaurantTableView.dequeueReusableCell(withIdentifier: "DeliveryAndNotificationTableViewCell", for: indexPath) as! DeliveryAndNotificationTableViewCell
            
            return cell
            
        }else if index == 1 {
            let cell = RestaurantTableView.dequeueReusableCell(withIdentifier: "HeadlineTableViewCell", for: indexPath) as! HeadlineTableViewCell
            
            return cell
            
        }else if index == 2 {
            let cell = RestaurantTableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
            
            return cell
            
        } else if index == 3{
            let cell = RestaurantTableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as! BannerTableViewCell
            
            cell.BannerCollectionView.reloadData()
            
            return cell
            
        } else if index == 4{
            let cell = RestaurantTableView.dequeueReusableCell(withIdentifier: "FoodCategoryTableViewCell", for: indexPath) as! FoodCategoryTableViewCell
            
            return cell
        } else if index == 5{
            let cell = RestaurantTableView.dequeueReusableCell(withIdentifier: "MainRestaurantTableViewCell", for: indexPath) as! MainRestaurantTableViewCell
            
            return cell
        } else {
            let cell = RestaurantTableView.dequeueReusableCell(withIdentifier: "DishesTableViewCell", for: indexPath) as! DishesTableViewCell
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 57
        }else if indexPath.row == 1 {
            return 65
        }else if indexPath.row == 2 {
            return 65
        }else if indexPath.row == 3{
            return 125
        }else if indexPath.row == 4{
            return 97
        }else if indexPath.row == 5{
            return 111
        } else {
            return 191
        }
        
        
    }


}

