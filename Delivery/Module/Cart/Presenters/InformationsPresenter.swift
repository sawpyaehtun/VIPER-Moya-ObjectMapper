//
//  InformationsPresenter.swift
//  Delivery
//
//  Created by iMac on 4/25/21.
//

import RxSwift

protocol InformationsPresentation {
   
}

class InformationsPresenter {
    weak var view : InformationsView?
    var router : InformationsRouting?
    var interactor : InformationsUserCase?
    
    let disposableBag = DisposeBag()
    
    init(view : InformationsView, router : InformationsRouting, interactor : InformationsUserCase) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension  InformationsPresenter: InformationsPresentation{

}
