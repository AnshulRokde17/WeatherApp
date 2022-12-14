//
//  NetworkManager.swift
//  weatherApp
//
//  Created by Anshul Rokade on 22/07/22.
//

import Foundation
import SwiftUI

final class NetworkManager<T: Codable> {
    static func fetch(for url: URL,completion: @escaping(Result<T, NetworkError>) -> Void){
        URLSession.shared.dataTask(with: url){(data, response, error) in
            guard error == nil else{
                print(error)
                completion(.failure(.error(err: error!.localizedDescription)))
                return}
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                completion(.failure(.invalidResponse))
                return}
            guard let data = data else{
                completion(.failure(.invalidData))
                return}
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            }catch let err {
                print(String(describing: err))
                completion(.failure(.decodingerror(err: err.localizedDescription)))
            }
            
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error(err: String)
    case decodingerror(err: String)
}
