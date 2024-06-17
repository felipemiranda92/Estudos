//
//  LoginViewModel.swift
//  TesteProjetoAPI
//
//  Created by Felipe Miranda Santos on 17/06/24.
//

import Foundation

class LoginViewModel {
    
    private var service: LoginService = LoginService()
    private var countryActivies: CountryActivies?
    private var activities: [Activity]?
    private var listEmbassyAbroadDetail: [EmbassyAbroadDetail] = []
    
    func fetchEmbassyAbroad() {
        service.getEmbassyAbroadURLSession { result in
            switch result {
            case .success(let success):
                print(success)
                self.listEmbassyAbroadDetail = success.data ?? []
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    
    func fetchCountryActivies(country: String) {
        service.getCountryActiviesURLSession(country: country) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    print(success)
                    self.activities = success.data.activities 
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}
