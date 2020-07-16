//
//  CategoryCell.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/16/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var innerTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var categoryTextLabel: UILabel!
    @IBOutlet weak var innerTableView: UITableView!
    var items: [String] = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        innerTableView.delegate = self
        innerTableView.dataSource = self
        innerTableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "itemCellIdentifier")        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension CategoryCell : UITableViewDelegate ,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: "itemCellIdentifier", for: indexPath) as! ItemCell
        itemCell.itemTextLabel.text = items[indexPath.row]        
        return itemCell
    }
}
