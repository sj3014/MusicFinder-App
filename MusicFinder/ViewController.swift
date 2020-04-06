//
//  ViewController.swift
//  MusicFinder
//
//  Created by Seong Moon Jo on 4/6/20.
//  Copyright © 2020 Seong Moon Jo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lyricField: UITextField!
    
    var results = [Detail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureTapGesture()
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    private func configureTextFields() {
        lyricField.delegate = self
    }

    
    @IBAction func searchTapped(_ sender: Any) {
        view.endEditing(true)
        let lyric:String = lyricField.text!
        
        if lyric.count == 0 {
            return
        }
        
        let request = MusicRequest(lyric: lyric)
        
        request.getMusic { [weak self] result in
            switch result {
            case .success(let res):
                self?.results = res
            case .failure(let error):
                print(error)
            }
            
        }
        print(results[0])
        
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
