//
//  HomePresenter.swift
//  NTTDATA
//
//  Created Luis Fernando Flores Rivera on 31/07/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HomePresenter {
    //MARK: - Protocol Properties
    weak private var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    private let router: HomeWireframeProtocol

    //MARK: - Life Cycle
    init(interface: HomeViewProtocol, interactor: HomeInteractorProtocol?, router: HomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

//MARK: - Presenter Methods
extension HomePresenter: HomePresenterProtocol {
    func nextView(info: Product) {
        router.nextView(info: info)
    }
    
    func dataSource(data: dataInfo) {
        view?.dataSource(data: data)
    }
    
    
    func getInitData() {
        interactor?.getInitData()
    }
    
    
}

//MARK: - Private functions
extension HomePresenter {
    
}
