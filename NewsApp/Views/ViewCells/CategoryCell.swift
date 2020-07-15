//
//  CategoryCell.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/15/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import UIKit
import ExpandableCell

class CategoryCell: UITableViewCell {

    @IBOutlet weak var innerTableView: UITableView!
    @IBOutlet weak var categoryTextLabel: UILabel!
    var items: [String] = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        categoryTextLabel.isUserInteractionEnabled = true
        categoryTextLabel.addGestureRecognizer(tap)
        
        innerTableView.rowHeight = UITableView.automaticDimension
        innerTableView.estimatedRowHeight = 80
        innerTableView.isHidden = true
        innerTableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "itemCellIdentifier")
        innerTableView.delegate = self
        innerTableView.dataSource = self
        
        // Initialization code
    }
    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
        if(innerTableView.isHidden){
            innerTableView.isHidden = false
        }
        else{
            innerTableView.isHidden = true
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
//MARK inner table
extension CategoryCell : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = innerTableView.dequeueReusableCell(withIdentifier: "itemCellIdentifier", for: indexPath) as! ItemCell
        itemCell.itemTextLabel.text = items[indexPath.row]
        return itemCell
    }
    
}
