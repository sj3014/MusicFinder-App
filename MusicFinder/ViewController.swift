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
    
    var infoArtist = ""
    var infoTitle = ""
    
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
                self?.infoArtist = res[0].artist
                self?.infoTitle = res[0].title
            case .failure(let error):
                print(error)
            }
            
        }
  //      performSegue(withIdentifier: "showResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SecondViewController
        vc.infoArtist = self.infoArtist
        vc.infoTitle = self.infoTitle
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
