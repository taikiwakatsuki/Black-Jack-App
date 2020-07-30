//
//  Game3ViewController.swift
//  Black Jack
//
//  Created by Taiki Wakatsuki on 2020/01/31.
//  Copyright © 2020 Taiki Wakatsuki. All rights reserved.
//

import UIKit

class Game3ViewController: UIViewController {
    
    var argString_P:String = ""
    var argString_D:String = ""

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Again: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard var argInt_P = Int(argString_P) else {
            return
        }
        guard var argInt_D = Int(argString_D) else {
            return
        }
        
        if argInt_P > 21 && argInt_D > 21 {
            Label.text = "Draw"
            Label.textColor = UIColor.black
        } else if argInt_P < 22 && argInt_D > 21 {
            Label.text = "Win!"
            Label.textColor = UIColor.red
        } else if argInt_P > 21 && argInt_D < 22 {
            Label.text = "Lose..."
            Label.textColor = UIColor.blue
        } else if argInt_P > argInt_D {
            Label.text = "Win!"
            Label.textColor = UIColor.red
        } else if argInt_P == argInt_D {
            Label.text = "Draw"
            Label.textColor = UIColor.black
        } else {
            Label.text = "Lose..."
            Label.textColor = UIColor.blue
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Again(_ sender: Any) {
        changeView()
    }
    
    func changeView() {
        self.performSegue(withIdentifier: "restart", sender: nil)
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
