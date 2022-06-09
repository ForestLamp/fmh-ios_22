//
//  LoadingScreenPresenter.swift
//  fmh
//
//  Created: 11.05.2022
//

import Foundation

struct LoadingScreenModel {
    
    let backgroundImage: String
    let textDescription: String
}


protocol LoadingScreenProtocol: class {
    func setGreeting(greeting: LoadingScreenModel)
}

protocol LoadingScreenPresenterProtocol: class {
    init(view: LoadingScreenProtocol, model: LoadingScreenModel)
    func showGreeting()
}

class LoadingScreenPresenter: LoadingScreenPresenterProtocol {
    
    let view: LoadingScreenProtocol
    var data: [LoadingScreenModel] = [] {
        didSet {
            view.setGreeting(greeting: data)
        }
    }
    
    required init(view: LoadingScreenProtocol) {
        self.view = view
        
        data = getData()
    }
    
    func showGreeting() {
        let greeting = self.model.textDescription
        self.view.setGreeting(greeting: greeting)
    }
}

extension LoadingScreenPresenter {
    private func getData() -> [LoadingScreenModel] {
        [
            LoadingScreenModel(backgroundImage: "", textDescription: "wefefwe feeefwe"),
            LoadingScreenModel(backgroundImage: "", textDescription: "")
        ]
    }
}
