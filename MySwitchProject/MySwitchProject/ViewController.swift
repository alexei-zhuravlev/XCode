//
//  ViewController.swift
//  MySwitchProject
//
//  Created by Алексей Журавлев on 05.05.2022.
//

import UIKit






class ViewController: UIViewController {
    
    @IBOutlet var myView: UIView!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myButton: UIButton!

    
    func setUserData(colorName:String, imageName:String, buttonTitle:String){
        let defaultValue = UserDefaults.standard
        defaultValue.set(imageName, forKey: "ImageName")
        defaultValue.set(colorName, forKey: "Background")
        defaultValue.set(buttonTitle, forKey: "Button")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageForShow = UserDefaults.standard.string(forKey: "ImageName")
        let colorForShow = UserDefaults.standard.string(forKey: "Background")
        let buttonTitle = UserDefaults.standard.string(forKey: "Button")
        
        myImageView.image = UIImage(named: imageForShow ?? "light")
        myView.backgroundColor = UIColor(named: colorForShow ?? "lightBackground")
        
        myButton.layer.cornerRadius = 12
        myButton.layer.borderWidth = 2
        myButton.layer.borderColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        myButton.setTitle(buttonTitle ?? "Switch to dark", for: .normal)
    }

    @IBAction func myButtonAction(_ sender: Any) {
        if let text = myButton.titleLabel?.text{
            switch text{
            case "Switch to dark":
                myButton.setTitle("Switch to light", for: .normal)
                myImageView.image = UIImage(named: "dark")
                myView.backgroundColor = UIColor(named: "darkBackground")
                setUserData(colorName: "darkBackground", imageName: "dark", buttonTitle: "Switch to light")
            case "Switch to light":
                myButton.setTitle("Switch to dark", for: .normal)
                myImageView.image = UIImage(named: "light")
                myView.backgroundColor = UIColor(named: "lightBackground")
                setUserData(colorName: "lightBackground", imageName: "light", buttonTitle: "Switch to dark")
            default: break
            }
        }
        
    }
    
}

