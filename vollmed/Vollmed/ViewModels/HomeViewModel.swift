//
//  HomeViewModel.swift
//  Vollmed
//
//  Created by Michel Santos on 17/04/24.
//

import Foundation

struct HomeViewModel {
    //MARK: - Attibutes
    let service = WebService()
    let auth = AuthenticatorManager.shared
    
    
    //MARK: - Methods
    func getSpecialist() async throws -> [Specialist] {
        do {
            let test = HomeEndpoint.getAllSpecialists
            let result = try await service.getAllSpecialists()
            
            switch result {
            case .success(let model):
                return model
            case .failure:
                return []
            }
        } catch {
            print("Ocorreu um problema ao obter os especielistas")
           throw error
        }
    }
    
    func logout() async {
        do {
            let logouutSuccesful = try await service.logoutPatient()
            if logouutSuccesful {
                auth.removeToken()
                auth.removePatientID()
            }
        } catch {
            print("error \(error.localizedDescription)")
        }
    }
}
