//
//  TabBarController.swift
//  UITableView
//
//  Created by Shahnoza on 19/2/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let criptaVC = CriptaViewController()
        let financeVC = FinanceViewController()
        
        criptaVC.title = "Крипта"
        financeVC.title = "Финансы"
        
        setViewControllers([criptaVC,financeVC], animated: true)
        
        guard let items = self.tabBar.items else {return}
        
        let images = ["bitcoinsign.circle", "dollarsign.circle"]
        
        for i in 0 ... images.count - 1 {
            items[i].image = UIImage (systemName: images[i])
        }
    }
}
