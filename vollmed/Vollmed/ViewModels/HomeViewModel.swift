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
    
    
    //MARK: - Methods
    func getSpecialist() async throws -> [Specialist] {
        do {
            let result = try await service.getAllSpecialists()
            
            switch result {
            case .success(let model):
                return model
            case .failure(let error):
                return []
            }
        } catch {
            print("Ocorreu um problema ao obter os especielistas")
           throw error
        }
    }
}
