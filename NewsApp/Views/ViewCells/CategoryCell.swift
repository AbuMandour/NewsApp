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
    @IBOutlet weak var stMain: UIStackView!
    static let identifier = "categoryCellIdentifire"
    var items: [String] = [String]()
    var isCategorySelected: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        innerTableView.delegate = self
        innerTableView.dataSource = self
        innerTableView.isHidden = true
        innerTableViewHeight.constant = CGFloat(0)
        innerTableView.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        innerTableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "itemCellIdentifier")
        stMain.customize(backgroundColor: UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1), radiusSize: 8)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
    
    func configure(with categoryText:String)   {
        self.categoryTextLabel.text = categoryText
    }
    static func nib () -> UINib
    {
        return UINib(nibName: "CategoryCell", bundle: nil)
    }
}
