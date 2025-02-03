//
//  NetworkManager.swift
//  Stock App
//
//  Created by Apple on 01/02/25.
//

import Foundation



actor NetworkManager {
    
    func makeApiRequest<T: Decodable>(_ response: T.Type, url: String) async throws -> T {
        
        guard let finalUrl = URL(string: url) else {
            throw NetworkError.invalidUrl
        }
        
        do {
            
            let (data, _) = try await URLSession.shared.data(from: finalUrl)
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
            
        }catch {
            throw NetworkError.invalidData
        }
        
    }
    
}

