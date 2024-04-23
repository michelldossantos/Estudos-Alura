//
//  HomeViewModel.swift
//  Vollmed
//
//  Created by Michel Santos on 17/04/24.
//

import Foundation

struct HomeViewModel {
    //MARK: - Attibutes
    let service: HomeServiceable
    let authService: AuthenticationServiceable
    let auth = AuthenticatorManager.shared
    
    //MARK: Init
    init(service: HomeServiceable,authService: AuthenticationServiceable) {
        self.service = service
        self.authService = authService
    }

    //MARK: - Methods
    func getSpecialist() async throws -> [Specialist]? {
        let result = try await service.getSpecialist()
        
        switch result {
        case .success(let model):
            return model!
        case .failure(let error):
            throw error
        }
    }
    
    func logout() async {
        let result = await authService.logout()
        
        switch result {
        case .success:
            auth.removeToken()
            auth.removePatientID()
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
