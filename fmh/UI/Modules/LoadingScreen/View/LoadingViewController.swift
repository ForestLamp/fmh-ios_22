//
//  LoadingViewController.swift
//  fmh
//
//  Created: 11.05.2022
//

import UIKit

class LoadingViewController: UIViewController {
    
    // MARK: Properties
    private let screen = UIScreen.main.bounds
    lazy var screenHeight = screen.size.height
    
    // MARK: Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        view().setupLayout()
        view().constraintForLabel(viewHeight: screenHeight)
    }
    
    override func loadView() {
        self.view = Layer()
    }
    
    func view() -> Layer {
       return self.view as! Layer
    }
}

