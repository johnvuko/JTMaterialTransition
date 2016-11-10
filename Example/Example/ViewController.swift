//
//  ViewController.swift
//  Example
//
//  Created by Jonathan Tribouharet

import UIKit
import JTMaterialTransition

class ViewController: UIViewController {

    weak var presentControllerButton: UIButton?
    var transition: JTMaterialTransition?

    override func viewDidLoad() {
        super.viewDidLoad()

        createPresentControllerButton()
        self.transition = JTMaterialTransition(animatedView: self.presentControllerButton!)
    }

    func createPresentControllerButton () {
        
        let y: CGFloat = 300
        let width: CGFloat = 50
        let height: CGFloat = width
        let x: CGFloat = (self.view.frame.width - width) / 2.0
        
        let presentControllerButton = UIButton(frame: CGRect(x: x, y: y, width: width, height: height))
        presentControllerButton.layer.cornerRadius = width / 2.0
        presentControllerButton.backgroundColor = UIColor(colorLiteralRed: 86.0 / 256.0, green: 188.0 / 256.0, blue: 138 / 256.0, alpha: 1.0)
        
        presentControllerButton.setImage(UIImage(named: "plus"), for: .normal)
        presentControllerButton.addTarget(self, action: #selector(didPresentControllerButtonTouch), for: .touchUpInside)
        
        
        self.view.addSubview(presentControllerButton)
        self.presentControllerButton = presentControllerButton
    }

	func didPresentControllerButtonTouch () {
		 let controller = SecondViewController()

        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = self.transition

        self.present(controller, animated: true, completion: nil)
	}

}
