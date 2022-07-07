//
//  LoadingViewController.swift
//  fmh
//
//  Created: 11.05.2022
//

import UIKit

class LoadingViewController: UIViewController {
    
    // MARK: - Properties
    
    // Презентер:
    private let presenter = Presenter()
    private var testData: [LoadingScreenModel] = []
    private weak var viewOutputDelegate: ViewOutputDelegate?
    
    private var count = Int.random(in: 0...12)
    private let customColors = Colors()
    private let screen = UIScreen.main.bounds
    lazy var screenHeight = screen.size.height
    
    // MARK: - UI Elements
    
    //Background image
    private let backgroundImage: UIImageView = {
       let backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    // UIView for background image
    private let viewForBackgroundImage: UIView = {
       let viewForImage = UIView()
        viewForImage.translatesAutoresizingMaskIntoConstraints = false
        return viewForImage
    }()
    
    private var activityIndicator : UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor(named: "AccentColor")
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.isHidden = false
        return activityIndicator
    }()
    
    // UIView
    private var viewForLabel : UIView = {
        let viewForLabel = UIView()
        viewForLabel.translatesAutoresizingMaskIntoConstraints = false
        viewForLabel.layer.cornerRadius = 10
        return viewForLabel
    }()
    
    //TextLabel
    private let textLbl: UILabel = {
        let textLbl = UILabel()
        textLbl.translatesAutoresizingMaskIntoConstraints = false
        textLbl.numberOfLines = 0
        textLbl.adjustsFontSizeToFitWidth = true
        textLbl.minimumScaleFactor = 0.5
        textLbl.textAlignment = .center
        return textLbl
    }()
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        presenter.setViewInputDelegate(viewInputDelegate: self)
        self.viewOutputDelegate = presenter
        self.viewOutputDelegate?.getData()
        
        setupLayout()
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        constraintForLabel(viewHeight: screenHeight)
    }
}

    // MARK: - Constraints

extension LoadingViewController {
    
    func constraintForLabel(viewHeight: CGFloat) {
        
        // UIView for label
        self.view.addSubview(viewForLabel)
        viewForLabel.backgroundColor = customColors.colorForView1
        switch viewHeight {
        case 548.0...568.0: //iPhone 5S,SE
            NSLayoutConstraint.activate([
                viewForLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
                viewForLabel.heightAnchor.constraint(equalToConstant: 100),
                viewForLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
                viewForLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        case 647.0...667.0: //iPhone 6,7,8
            NSLayoutConstraint.activate([
                viewForLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
                viewForLabel.heightAnchor.constraint(equalToConstant: 100),
                viewForLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
                viewForLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        case 716.0...736.0: //iPhone 6+,7+,8+
            NSLayoutConstraint.activate([
                viewForLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
                viewForLabel.heightAnchor.constraint(equalToConstant: 100),
                viewForLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
                viewForLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        case 792...875.0: //iPhone X,XS,XR
            NSLayoutConstraint.activate([
                viewForLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
                viewForLabel.heightAnchor.constraint(equalToConstant: 100),
                viewForLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
                viewForLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        case 876.0...1896.0: //iPhone XS_Max
            NSLayoutConstraint.activate([
                viewForLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
                viewForLabel.heightAnchor.constraint(equalToConstant: 100),
                viewForLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
                viewForLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        default: print("_____")
        }
    }
    
    func setupLayout() {
        
        // View for background image
        self.view.addSubview(viewForBackgroundImage)
        viewForBackgroundImage.backgroundColor = customColors.colorForView1
        NSLayoutConstraint.activate([
            viewForBackgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            viewForBackgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewForBackgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewForBackgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3)
        ])
        
        // BackgroundImage
        self.viewForBackgroundImage.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: viewForBackgroundImage.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: viewForBackgroundImage.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: viewForBackgroundImage.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: viewForBackgroundImage.bottomAnchor)
        ])
        
        self.view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 50),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//            activityIndicator.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor)
           // activityIndicator.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -120)
        ])
                
        // TextLabel
        self.viewForLabel.addSubview(textLbl)
        textLbl.textColor = customColors.colorForTextLbl1
        NSLayoutConstraint.activate([
            textLbl.topAnchor.constraint(equalTo: viewForLabel.topAnchor, constant: 10),
            textLbl.leadingAnchor.constraint(equalTo: viewForLabel.leadingAnchor, constant: 10),
            textLbl.trailingAnchor.constraint(equalTo: viewForLabel.trailingAnchor, constant: -10),
            textLbl.bottomAnchor.constraint(equalTo: viewForLabel.bottomAnchor, constant: -20)
        ])
    }
}

extension LoadingViewController: ViewInputDelegate {
    
    func setupInitialState() {
        displayData(i: count)
    }
    
    func setupData(with testData: ([LoadingScreenModel])) {
        self.testData = testData
    }
    
    func displayData(i: Int) {
        if testData.count >= 0 && count <= (testData.count - 1) && count >= 0 {
            textLbl.text = testData[i].textDescription
            if let image = UIImage.init(named: testData[i].backgroundImage) {
                backgroundImage.image = image
            }
        } else {
            print("No data!")
        }
    }
    
}
