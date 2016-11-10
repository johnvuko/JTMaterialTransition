//
//  SecondViewController.swift
//  Example
//
//  Created by Jonathan Tribouharet

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(colorLiteralRed: 54.0 / 256.0, green: 70.0 / 256.0, blue: 93 / 256.0, alpha: 1.0)
        
        createCloseButton()
    }
    
    func createCloseButton () {
        let y: CGFloat = 300.0
        let width: CGFloat = 50.0
        let height: CGFloat = width
        let x: CGFloat = (375.0 - width) / 2.0
        
        let closeButton = UIButton(frame: CGRect(x: x, y: y, width: width, height: height))
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        closeButton.addTarget(self, action: #selector(didCloseButtonTouch), for: .touchUpInside)
        self.view.addSubview(closeButton)
    }
    
    func didCloseButtonTouch () {
        self.dismiss(animated: true, completion: nil)
    }

}
