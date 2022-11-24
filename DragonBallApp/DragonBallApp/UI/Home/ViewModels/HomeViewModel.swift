//
//  HomeViewModel.swift
//  DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 13/11/22.
//

import Foundation

//MARK: - PROTOCOLO -
protocol HomeViewModelProtocol {
    var dataCount: Int {get}
    func onViewsLoaded()
    func data(for index: Int) -> HomeCellModel?
    func onItemSelected(at index: Int)
}
//MARK: - CLASE -
final class HomeViewModel {
    
    //Para conectar el viewModel con la vista
    private weak var viewDelegate: HomeTableViewProtocol?
    private var viewData = [HomeCellModel]()
    
    init(viewDelegate: HomeTableViewProtocol) {
        self.viewDelegate = viewDelegate
    }
    
    private func loadData() {
        viewData = sampleHeroesData.compactMap {
            HomeCellModel(image: $0.image,
                          name: $0.name,
                          isVillain: $0.isVilain,
                          description: $0.description)
        }
        
        viewDelegate?.updateViews()
    }
}

//MARK: - EXTENSION -
extension HomeViewModel: HomeViewModelProtocol {
    func data(for index: Int) -> HomeCellModel? {
        guard index < dataCount else {return nil}
        return viewData[index]
    }
    
    var dataCount: Int {
        viewData.count
    }
    
    func onViewsLoaded() {
        loadData()
    }
    
    func onItemSelected(at index: Int) {
        guard let data = data(for: index) else {return}
        viewDelegate?.navigateToDetail(with: data)
    }
}
