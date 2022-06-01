//
//  LoadingViewController.swift
//  fmh
//
//  Created: 11.05.2022
//

import UIKit

class LoadingViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private let backgroundImage: UIImageView = {
       let backgroundImage = UIImageView()
//        backgroundImage.contentMode = .scaleAspectFit
        backgroundImage.image = UIImage.init(named: "2.png")
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    // UIView for background image
    private let viewForImage: UIView = {
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
        textLbl.textAlignment = .center
        return textLbl
    }()
        
    // MARK: - Properties
    
    var presenter: LoadingScreenPresenterProtocol!
    private let customColors = Colors()
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupLayout()
        setGreeting(greeting: "Ответственно и осознанно нести добро людям")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
}

extension LoadingViewController: LoadingScreenProtocol {
    func setGreeting(greeting: String) {
        textLbl.text = greeting
    }
}

    // MARK: - Constraints

extension LoadingViewController {
    
    func setupLayout() {
        
        var screenHeight: CGFloat {
            return UIScreen.main.bounds.height
        }
        
        // View for image
        self.view.addSubview(viewForImage)
        viewForImage.backgroundColor = customColors.colorForView1
        NSLayoutConstraint.activate([
            viewForImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            viewForImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewForImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewForImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3)
        ])
        
        // BackgroundImage
        self.viewForImage.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: viewForImage.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: viewForImage.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: viewForImage.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: viewForImage.bottomAnchor)
        ])
        
        self.view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(equalTo: viewForImage.bottomAnchor, constant: 70),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//            activityIndicator.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor)
           // activityIndicator.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -120)
        ])
        
        // UIView
        self.view.addSubview(viewForLabel)
        viewForLabel.backgroundColor = customColors.colorForView1
        NSLayoutConstraint.activate([
            viewForLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 70),
            viewForLabel.heightAnchor.constraint(equalToConstant: 100),
            viewForLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
            viewForLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])

        // TEXTLabel
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

/*
extension UILabel {
    func UIfontLabel(viewHeight: Double) {
        switch viewHeight {
        case 548.0...568.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 150)//iPhone 5S,SE
        case 647.0...667.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 180)//iPhone 6,7,8
        case 716.0...736.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 200)//iPhone 6+,7+,8+
        case 792...812.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 180)//iPhone X,XS,XR
        case 876.0...896.0:
            self.font = UIFont(name:  "signpainter-housescript", size: 180)//iPhone XS_Max
        default: print("_____")
        }
    }
    
==================================
 
    iPhone 13 Pro Max     2778
    iPhone 12 Pro Max     2778
     
    iPhone 11 Pro Max     2688
    iPhone XS Max         2688
     
    iPhone 13             2532
    iPhone 13 Pro         2532
    iPhone 12             2532
    iPhone 12 Pro         2532
     
    iPhone 11 Pro         2436
    iPhone XS             2436
    iPhone X              2436
     
    iPhone 12 mini        2340
    iPhone 13 mini        2340
      
    iPhone 8 Plus         1920
    iPhone 7 Plus         1920
    iPhone 6s Plus        1920
    iPhone 6 Plus         1920
     
    iPhone 11             1792
    iPhone XR             1792
     
    iPhone SE 2nd gen     1334
    iPhone 8              1334
    iPhone 7              1334
    iPhone 6s             1334
    iPhone 6              1334
     
    iPhone SE             1136
     
    iPhone 4s             960
    
    switch UIScreen.main.nativeBounds.height {
            case 960...1334:
                print("Screen Now - 960...1334")
            case 1920...2208:
                print("Screen Now - 1920...2208")
            case 2436...2778:
                print("Screen Now - 2426...2778")
            default:
                print("Screen Now - default")
            }

}
 */
