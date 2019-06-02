//
//  MainTabBarVC.swift
//  InstagramV1
//
//  Created by Hitesh Nalamwar on 2019-06-02.
//  Copyright © 2019 Hitesh Nalamwar. All rights reserved.
//

import UIKit
import Firebase

class MainTabBarVC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = delegate
        configureViewControllers()
        checkUserIfLogin()

        // Do any additional setup after loading the view.
    }
    
    func configureViewControllers() {
        
       let feedVC = constructNavControllers(unselectedImage: UIImage(named: "home_unselected")!, selectedImage: UIImage(named: "home_selected")! , rootViewController: FeedVC(collectionViewLayout: UICollectionViewFlowLayout()))
        
       let searchVC = constructNavControllers(unselectedImage: UIImage(named: "search_unselected")!, selectedImage: UIImage(named: "search_selected")! , rootViewController: SearchVC())
        
       let uploadPostVC = constructNavControllers(unselectedImage: UIImage(named: "plus_unselected")!, selectedImage: UIImage(named: "plus_unselected")! , rootViewController: UploadPostVC())
        
       let notificationsVC = constructNavControllers(unselectedImage: UIImage(named: "like_unselected")!, selectedImage: UIImage(named: "like_selected")! , rootViewController: NotificationsVC())
        
       let userProfileVC = constructNavControllers(unselectedImage: UIImage(named: "profile_unselected")!, selectedImage: UIImage(named: "profile_selected")! , rootViewController: UserProfileVC(collectionViewLayout: UICollectionViewFlowLayout()))
        
      viewControllers = [feedVC, searchVC, uploadPostVC, notificationsVC, userProfileVC]
        
      tabBar.tintColor = .black
    }

  
    
    func constructNavControllers(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController{
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        navController.navigationBar.tintColor = .black
        
        return navController
        
    }
    
    func checkUserIfLogin() {
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let loginVC = LoginVC()
                let navController = UINavigationController(rootViewController: loginVC)
                self.present(navController, animated: true, completion: nil)
            }
            return
        } 
        
    }

}
