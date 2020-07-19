//
//  OnBoardViewController.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/19/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import UIKit


class OnBoradViewController: UIViewController{
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var menuBarCollectionView: UICollectionView!
    let menuItems: [String] = ["menu item 1" , "menu item 2" , "menu item 3" , "menu item 4" ,"menu item 5" , "menu item 6","menu item 7"]
    
    override func viewDidLoad() {
        menuBarCollectionView.delegate = self
        menuBarCollectionView.dataSource = self
        menuBarCollectionView.showsHorizontalScrollIndicator = false
        menuBarCollectionView.decelerationRate = .fast
        
        let indexPath = IndexPath(item: 3, section: 0)
        menuBarCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        menuBarCollectionView.register(UINib(nibName: "MenuBarViewCell", bundle: nil), forCellWithReuseIdentifier: "MenuItemCellID")
    }
    func centerCell () {
        let centerPoint = CGPoint(x: menuBarCollectionView.contentOffset.x + menuBarCollectionView.frame.midX, y: 20)
        if let path = menuBarCollectionView.indexPathForItem(at: centerPoint) {
            menuBarCollectionView.scrollToItem(at: path, at: .centeredHorizontally, animated: true)
        }
    }
}

//MARK: collection view delegate
extension OnBoradViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       centerCell()
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        centerCell()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            centerCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let menuBarItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuItemCellID", for: indexPath) as? MenuBarViewCell else {
            return MenuBarViewCell()
        }
        menuBarItemCell.menuBarItemLabel.text = menuItems[indexPath.row]
        return menuBarItemCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = menuItems[indexPath.row]
        if selectedItem == "menu item 1"{
            guard let itemOneViewController  = storyboard?.instantiateViewController(withIdentifier: "ItemOneViewControllerID") as? ItemOneViewController else{
                fatalError("Failed to laod view controller")
            }
            self.addChild(itemOneViewController)
            containerView.addSubview(itemOneViewController.view)
            itemOneViewController.didMove(toParent: self)
        }
        else if selectedItem == "menu item 2"{
            guard let itemTwoViewController  = storyboard?.instantiateViewController(withIdentifier: "ItemTwoViewControllerID") as? ItemTwoViewController else{
                fatalError("Failed to laod view controller")
            }
            self.addChild(itemTwoViewController)
            containerView.addSubview(itemTwoViewController.view)
            itemTwoViewController.didMove(toParent: self)
            itemTwoViewController.mainLabel.text = "menu item 2"
        }
        else if selectedItem == "menu item 3"{
            guard let itemTwoViewController  = storyboard?.instantiateViewController(withIdentifier: "ItemTwoViewControllerID") as? ItemTwoViewController else{
                fatalError("Failed to laod view controller")
            }
            self.addChild(itemTwoViewController)
            containerView.addSubview(itemTwoViewController.view)
            itemTwoViewController.didMove(toParent: self)
            itemTwoViewController.mainLabel.text = "menu item 3"
        }
        else if selectedItem == "menu item 4"{
            guard let itemTwoViewController  = storyboard?.instantiateViewController(withIdentifier: "ItemTwoViewControllerID") as? ItemTwoViewController else{
                fatalError("Failed to laod view controller")
            }
            
            self.addChild(itemTwoViewController)
            containerView.addSubview(itemTwoViewController.view)
            itemTwoViewController.didMove(toParent: self)
            itemTwoViewController.mainLabel.text = "menu item 4"
        }
        else if selectedItem == "menu item 5"{
            guard let itemTwoViewController  = storyboard?.instantiateViewController(withIdentifier: "ItemTwoViewControllerID") as? ItemTwoViewController else{
                fatalError("Failed to laod view controller")
            }
            self.addChild(itemTwoViewController)
            containerView.addSubview(itemTwoViewController.view)
            itemTwoViewController.didMove(toParent: self)
            itemTwoViewController.mainLabel.text = "menu item 5"
        }
        else if selectedItem == "menu item 6"{
            guard let itemTwoViewController  = storyboard?.instantiateViewController(withIdentifier: "ItemTwoViewControllerID") as? ItemTwoViewController else{
                fatalError("Failed to laod view controller")
            }
            self.addChild(itemTwoViewController)
            containerView.addSubview(itemTwoViewController.view)
            itemTwoViewController.didMove(toParent: self)
            itemTwoViewController.mainLabel.text = "menu item 6"
        }
        else if selectedItem == "menu item 7"{
            guard let itemTwoViewController  = storyboard?.instantiateViewController(withIdentifier: "ItemTwoViewControllerID") as? ItemTwoViewController else{
                fatalError("Failed to laod view controller")
            }
            self.addChild(itemTwoViewController)
            containerView.addSubview(itemTwoViewController.view)
            itemTwoViewController.didMove(toParent: self)
            itemTwoViewController.mainLabel.text = "menu item 7"
        }
    }
}


