//
//  ViewController.swift
//  ASimpleTestWithTwoScreens
//
//  Created by Алексей Журавлев on 31.07.2022.
//

import UIKit

class ViewController: UIViewController {

    var textForLabel:String = "Some First Text"
    
    @IBOutlet weak var labelOnFirstScreen: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        labelOnFirstScreen.text = textForLabel

    }


    @IBAction func enterBtnPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        present(secondVC, animated: true)
    }
    
}

extension ViewController:SaveText{
    func saveText(item: String) {
        textForLabel = item
        print("########")
       print(textForLabel)
    }
}

