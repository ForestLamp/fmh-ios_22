//
//  CoordinatorProtocols.swift
//  fmh
//
//  Created: 10.05.2022
//

import Foundation
import UIKit


// MARK: - Coordinatable
protocol Coordinatable: AnyObject {
    func start()
}


// MARK: - Presentable
protocol Presentable {
    var toPresent: UIViewController? { get }
}


// MARK: - Routable
protocol Routable: Presentable {
    
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?, animated: Bool, completion: CompletionBlock?)
    
    func popModule()
    func popModule(animated: Bool)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: CompletionBlock?)
    
    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
    
    func popToRootModule(animated: Bool)
}
