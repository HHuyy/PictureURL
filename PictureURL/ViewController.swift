//
//  ViewController.swift
//  PictureURL
//
//  Created by tham gia huy on 6/8/18.
//  Copyright © 2018 tham gia huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
//    let imgURL = "https://img00.deviantart.net/b252/i/2017/324/4/6/shinjuku_incident_by_kawacy-dbudchn.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pokedex")!)
        updateSaveButtonState()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        button.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loadButton(_ sender: UIButton) {
        let loadURL = textField.text
        if let url = URL(string: loadURL ?? ""){
            do {
                let data = try Data(contentsOf: url)
                self.imageView.image = UIImage(data: data)
            }catch let error {
                print("Error : \(error.localizedDescription)")
            }
        }
    }
    
    private func updateSaveButtonState() {
        let text = textField.text ?? ""
        button.isEnabled = !text.isEmpty
    }
}

