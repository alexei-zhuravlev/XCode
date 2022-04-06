//
//  MyCustomRoundView.swift
//  RoundGame
//
//  Created by Алексей Журавлев on 31.03.2022.
//

import UIKit

@IBDesignable class MyCustomRoundView: UIView {

    var workingView: UIView!
    var xibName = "MyCustomRoundView"
    
    let colorDarkBlue = UIColor(red: 51.0/255.0, green: 102.0/255.0, blue: 153.0/255.0, alpha: 1.0)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomView()
    }
    
    func getFromXib() -> UIView{
        
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    func setCustomView(){
        workingView = getFromXib()
        workingView.frame = bounds
        workingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        workingView.layer.cornerRadius = frame.size.width/2
        
        addSubview(workingView)
    }
    
    func changingSize(){
        let center = workingView.center
        workingView.frame.size.height += 10
        workingView.frame.size.width += 10
        workingView.layer.cornerRadius = workingView.frame.size.width/2
        workingView.center = center
    }
    
    func changingColor(){
        workingView.backgroundColor = colorDarkBlue
    }
    

}
