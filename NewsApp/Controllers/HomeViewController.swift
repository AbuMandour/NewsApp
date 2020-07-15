//
//  ViewController.swift
//  NewsApp
//
//  Created by Muhammad Abu Mandour on 7/5/20.
//  Copyright © 2020 iHorizons. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {

    @IBOutlet weak var lastQueryDateLabel: UILabel!
    @IBOutlet weak var autoUpdatedLabel: UILabel!
    var count: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        performRepeatedFunction()
    }
    @IBAction func pickVideoClicked(_ sender: Any) {
        openVideoPicker()
    }
    func performRepeatedFunction(){
        var timer = Timer()
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateData), userInfo: nil, repeats: true)
    }
    @objc func updateData() {
        HomeService.fetchCoronaData { (error, coronaDataModel) in
            if(error == nil){

                self.autoUpdatedLabel.text = coronaDataModel?.totalCases
                print(coronaDataModel?.totalCases! ?? "error found")
                self.lastQueryDateLabel.text = coronaDataModel?.dateTimeNow
            }
            else{
                print(error!)
            }
        }
     }
}

//MARK: pick video
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
