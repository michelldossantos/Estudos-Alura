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
    let auth = AuthenticatorManager.shared
    
    //MARK: Init
    init(service: HomeServiceable) {
        self.service = service
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
//        do {
//            let logouutSuccesful = try await service.logoutPatient()
//            if logouutSuccesful {
//                auth.removeToken()
//                auth.removePatientID()
//            }
//        } catch {
//            print("error \(error.localizedDescription)")
//        }
    }
}
