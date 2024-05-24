//
//  ApiManager.swift
//  BreweryAPI
//
//  Created by Ouahchia, Mohamed (JD) on 24/05/2024.
//

import Foundation

class ApiManager: ObservableObject {
    
    static let shared = ApiManager()
    private init() {
    }
    
    private let baseURL: String = "https://api.openbrewerydb.org/v1/breweries"
    
    func searchFor(query: String, completion: @escaping ([AutocompleteResult]) -> Void) {
        let endpoint = "/autocomplete?query=\(query)"
        guard let url = URL(string: baseURL+endpoint) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let data = data,
                let results = try? decoder.decode([AutocompleteResult].self, from: data) else {
                    print("Error decoding")
                    return
                }
            completion(results)
        }
        task.resume()
    }
    
    func getBreweryDetails(id: String, completion: @escaping (Brewery) -> Void) {
        let endpoint = "/\(id)"
        guard let url = URL(string: baseURL+endpoint) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let data = data,
                let results = try? decoder.decode(Brewery.self, from: data) else {
                    print("Error decoding")
                    return
                }
            completion(results)
        }
        task.resume()
    }
    func getStoicQuote(completion: @escaping (StoicQuote) -> Void) {
        guard let url = URL(string: "https://stoic.tekloon.net/stoic-quote") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let data = data,
                let results = try? decoder.decode(StoicQuote.self, from: data) else {
                    print("Error decoding")
                    return
                }
            completion(results)
        }
        task.resume()
    }
}
