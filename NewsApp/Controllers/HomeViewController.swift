//
//  ViewController.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/5/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var expandableTableView: UITableView!
    @IBOutlet weak var lastQueryDateLabel: UILabel!
    @IBOutlet weak var autoUpdatedLabel: UILabel!
    var selectedIndexPathSet : IndexSet = []
    var categories: [CategoryModel] = [
        CategoryModel("title 1",["item 1,1","item 2,1","item 3,1","item 4,1"],false),
        CategoryModel("title 2",["item 1,2","item 2,2","item 3,2"],false),
        CategoryModel("title 3",["item 1,3","item 2,3","item 3,3","item 4,3", "item 5,3"],false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        performRepeatedFunction()
        updateData()
        setupTable()
        self.tabBarController?.delegate = self
    }
    func setupTable() {
        expandableTableView.delegate = self
        expandableTableView.dataSource = self
        expandableTableView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: "categoryCellIdentifire")
    }
    @IBAction func pickVideoClicked(_ sender: Any) {
        openVideoPicker()
    }
    func performRepeatedFunction(){
        var timer = Timer()
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(updateData), userInfo: nil, repeats: true)
    }
    @objc func updateData() {
        HomeService.fetchCoronaData { (error, coronaDataModel) in
            if(error == nil){

                self.autoUpdatedLabel.text = "Total Cases: \(coronaDataModel?.totalCases ?? "0")"
                self.lastQueryDateLabel.text = "Last check date: \(coronaDataModel?.dateTimeNow ?? "no calls made")"
            }
            else{
                print(error!)
            }
        }
     }
}

//MARK: Pick Video
extension HomeViewController :UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    func openVideoPicker(){
        let imagePickerController = UIImagePickerController ()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        imagePickerController.mediaTypes = ["public.image", "public.movie"]
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var mediaURL: NSURL? = nil
        if let mediaType: String = info[UIImagePickerController.InfoKey.mediaType] as? String{
            if(mediaType == "public.image"){
                if let imageURL = info[UIImagePickerController.InfoKey.imageURL] as? NSURL{
                    mediaURL = imageURL
                }
            }
            else if(mediaType == "public.movie"){
                if let videoURL = info[UIImagePickerController.InfoKey.mediaURL] as? NSURL{
                    mediaURL = videoURL
                }
            }
         print(mediaURL!)
        }
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: Expandable Tableiew
extension HomeViewController :  UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let categoryCell = expandableTableView.dequeueReusableCell(withIdentifier: "categoryCellIdentifire", for: indexPath) as? CategoryCell else{
            print("faild to cast")
            return CategoryCell()
        }
        categoryCell.categoryTextLabel.text = categories[indexPath.row].title
        categoryCell.selectionStyle = .none
        categoryCell.items = self.categories[indexPath.row].items
        if selectedIndexPathSet.contains(indexPath.row){                
            categoryCell.innerTableView.isHidden = false
            categoryCell.innerTableView.reloadData()
            categoryCell.innerTableViewHeight.constant = CGFloat(self.categories[indexPath.row].items.count * 48)
        }
        else{
                categoryCell.innerTableView.isHidden = true
                categoryCell.innerTableViewHeight.constant = CGFloat(1)
        }
        return categoryCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndexPathSet.contains(indexPath.row){
            selectedIndexPathSet.remove(indexPath.row)
        }
        else{
            selectedIndexPathSet.insert(indexPath.row)
        }
        expandableTableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

//MARK: tab bar view controller
extension HomeViewController : UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //viewController.expandableTableView.reloadData()
    }
}
