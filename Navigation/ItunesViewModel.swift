//
//  ItunesViewModel.swift
//  Navigation
//
//  Created by Finartz on 25.07.2024.
//

import Foundation
protocol ItunesViewModelDelegate: AnyObject {
    func updateUI()
}
class ItunesViewModel {
    weak var delegate: ItunesViewModelDelegate?
    var onUpdate: (()-> Void)?
    var products: [ResultData]? {
        didSet {
            onUpdate?()
        }
    }
    func searchTerm(term: String)  {
        Network.shared.request(url: "https://itunes.apple.com/search?term=\(term)") {
            result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async { [weak self] in
                    print(success)
                    self?.products = success.results
                    self?.delegate?.updateUI()
                    
                    
                }
                
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
}
