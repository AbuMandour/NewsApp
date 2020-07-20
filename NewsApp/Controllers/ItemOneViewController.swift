//
//  ItemOneViewController.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/19/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import UIKit

class ItemOneViewController: UIViewController {

    @IBOutlet weak var dayLabel: UILabel!
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E dd LLLL"
        return formatter
    }()
    
    private lazy var calendarPopup: CalendarPopUpView = {
        let frame = CGRect(
            x: 15,
            y: dayLabel.frame.maxY + 100,
            width: view.frame.width - 30,
            height: 365
        )
        let calendar = CalendarPopUpView(frame: frame)
        calendar.backgroundColor = .clear
        calendar.layer.shadowColor = UIColor.black.cgColor
        calendar.layer.shadowOpacity = 0.4
        calendar.layer.shadowOffset = .zero
        calendar.layer.shadowRadius = 5
        calendar.didSelectDay = { [weak self] date in
            self?.setSelectedDate(date)
        }

        return calendar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func selectDayClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            view.addSubview(calendarPopup)
        } else {
            calendarPopup.removeFromSuperview()
        }
    }
    private func setSelectedDate(_ date: Date) {
        dayLabel.text = formatter.string(from: date)
    }
}
