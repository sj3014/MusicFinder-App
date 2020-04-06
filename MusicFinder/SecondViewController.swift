//
//  SecondViewController.swift
//  MusicFinder
//
//  Created by Seong Moon Jo on 4/6/20.
//  Copyright © 2020 Seong Moon Jo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var infoArtist:String = ""
    var infoTitle:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artistLabel.text = infoArtist
        titleLabel.text = infoTitle
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
