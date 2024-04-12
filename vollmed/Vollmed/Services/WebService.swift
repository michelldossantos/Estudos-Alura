//
//  WebService.swift
//  Vollmed
//
//  Created by Giovanna Moeller on 12/09/23.
//

import UIKit

enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
    case imageNil
}

let patientID = "b26a74c0-44ce-4084-8585-a16aff125d18"

struct WebService {
    func getAllAppointments(patientID: String) async throws -> Result<[AppointmentResult], APIError> {
        let endpoint = SpecialistEndpoint.getAllAppointments(patientID: patientID)
        
        guard let url = URL(string: endpoint) else {
            return .failure(.invalidURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let appointments = try JSONDecoder().decode([AppointmentResult].self, from: data)
        
        return .success(appointments)
    }
    
    func scheduleAppointment(specialistID: String,
                             patientID: String,
                             date: String) async throws -> Result<ScheduleAppointmentResponse, APIError> {
        let endpoint = SpecialistEndpoint.postAppointment()
        
        guard let url = URL(string: endpoint) else {
            return .failure(.invalidURL)
        }
        
        let appointment = ScheduleAppointmentRequest(specialistID: specialistID,
                                                     patientID: patientID,
                                                     date: date)
        
        let jsonData = try JSONEncoder().encode(appointment)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let appointmentReponse = try JSONDecoder().decode(ScheduleAppointmentResponse.self, from: data)
        
        return .success(appointmentReponse)
    }
    
    func getImages(from urlImage: String) async throws -> Result<UIImage?, APIError> {
        guard let url = URL(string: urlImage) else {
            return .failure(.invalidURL)
        }
        
        
        if let cachedResponse = URLSession.shared.configuration.urlCache?.cachedResponse(for: URLRequest(url: url)) {
            let image = UIImage(data: cachedResponse.data)
            return .success(image)
        }
        
        //    if let cachedImage = imageCache.object(forKey: urlImage as NSString) {
        //        return .success(cachedImage)
        //    }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                return .failure(.requestFailed)
            }
            
            guard let image = UIImage(data: data) else {
                return .failure(.imageNil)
            }
            
            // Cache the image
            let cachedResponse = CachedURLResponse(response: response, data: data)
            URLSession.shared.configuration.urlCache?.storeCachedResponse(cachedResponse, for: URLRequest(url: url))
            //        imageCache.setObject(image, forKey: urlImage as NSString)
            
            return .success(image)
        } catch {
            return .failure(.decodingFailed)
        }
    }
    
    func getAllSpecialists() async throws -> Result<[Specialist], APIError> {
        let endpoint = SpecialistEndpoint.getAllSpecialists()
        
        guard let url = URL(string: endpoint) else {
            return .failure(.invalidURL)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                return .failure(.requestFailed)
            }
            
            let specialists = try JSONDecoder().decode([Specialist].self, from: data)
            
            return .success(specialists)
        } catch {
            return .failure(.decodingFailed)
        }
    }
    
    func rescheduleAppointment(appointmentID: String, date: String) async throws -> Result<ScheduleAppointmentResponse, APIError> {
        let endpoint = SpecialistEndpoint.rescheduleAppointment(appointmentID: appointmentID)
        guard let url = URL(string: endpoint) else {
            return .failure(.invalidURL)
        }
        
        let requestData: [String: String] = ["data": date]
        let jsonData = try JSONSerialization.data(withJSONObject: requestData)

        var request = URLRequest(url: url)
        request.httpMethod = "Patch"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        let (data, _) = try await URLSession.shared.data(for: request)
        let appointmentReponse = try JSONDecoder().decode(ScheduleAppointmentResponse.self, from: data)

        return .success(appointmentReponse)
    }

    func cancelAppointment(appointmentID: String, reasonToCancel: String) async throws -> Result<String, APIError> {
        let endpoint = SpecialistEndpoint.cancelAppointment(appointmentID: appointmentID)
        guard let url = URL(string: endpoint) else {
            return .failure(.invalidURL)
        }
        
        let requestData: [String: String] =  ["motivo_cancelamento": reasonToCancel]
        let jsonData = try JSONSerialization.data(withJSONObject: requestData)
        

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            return .failure(.requestFailed)
        }

        guard let responseString = String(data: data, encoding: .utf8) else {
            return .failure(.decodingFailed)
        }

        return .success(responseString)
    }
    
    func registerPatient(patient: PatientModel) async throws -> Result<PatientModel, APIError> {
        let endpoint = SpecialistEndpoint.registerPatient()
        guard let url = URL(string: endpoint) else {
            return .failure(.invalidURL)
        }
        
        let jsonData = try JSONEncoder().encode(patient)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let patient = try JSONDecoder().decode(PatientModel.self, from: data)
        
        return .success(patient)
    }
}

struct SpecialistEndpoint {
    static let baseURL = "http://localhost:3000"
    
    static func getAllSpecialists() -> String {
        return ("\(baseURL)/especialista")
    }
    
    static func postAppointment() -> String {
        return ("\(baseURL)/consulta")
    }
    
    static func getAllAppointments(patientID: String) -> String {
        return ("\(baseURL)/paciente/\(patientID)/consultas")
    }
    
    static func rescheduleAppointment(appointmentID: String) -> String {
        return ("\(baseURL)/consulta/\(appointmentID)")
    }

    static func cancelAppointment(appointmentID: String) -> String {
        return ("\(baseURL)/consulta/\(appointmentID)")
    }
    
    static func registerPatient() -> String {
        return ("\(baseURL)/paciente/")
    }
}
