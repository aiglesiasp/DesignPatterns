//
//  DetailViewModel.swift
//  DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 13/11/22.
//

import Foundation


//MARK: - PROTOCOLO -
protocol DetailViewModelProtocol {
    func onViewsLoaded()
}
//MARK: - CLASE -
final class DetailViewModel {
    
    private var viewData: HomeCellModel
    
    private weak var viewDelegate: DetailViewProtocol?
    
    init(data: HomeCellModel,
         viewDelegate: DetailViewProtocol) {
        self.viewData = data
        self.viewDelegate = viewDelegate
    }
    
    
}


//MARK: - EXTENSION -
extension DetailViewModel: DetailViewModelProtocol {
    func onViewsLoaded() {
        viewDelegate?.updateView(data: viewData)
    }
    
    
}
