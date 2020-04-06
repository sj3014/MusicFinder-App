//
//  MusicRequest.swift
//  MusicFinder
//
//  Created by Seong Moon Jo on 4/6/20.
//  Copyright © 2020 Seong Moon Jo. All rights reserved.
//

import Foundation

enum MusicError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct MusicRequest {
    let resourceURL: URL
    let API_KEY = "4da7fec5c145aaeeb7767f467bd4a3e4"
    let lyric: String
    
    init(lyric: String) {
        guard let resourceURL = URL(string: "https://api.audd.io/findLyrics/") else {fatalError()}
        
        self.resourceURL = resourceURL
        self.lyric = lyric
    }
    
    func getMusic (completion: @escaping(Result<[Detail], MusicError>) -> Void) {
        var request = URLRequest(url: resourceURL)
        let header = ["Content-Type": "multipart/form-data"] as [String: String]
        let jsonObject = ["q": lyric,
                          "api_token": "4da7fec5c145aaeeb7767f467bd4a3e4"] as [String: String]
        
        request.allHTTPHeaderFields = header
        request.httpMethod = "POST"
        
        do {
            let requestBody = try JSONSerialization.data(withJSONObject: jsonObject, options: .fragmentsAllowed)
            
            request.httpBody = requestBody
        }
        catch {
            print("Error creating the data object from json")
        }
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let res = try JSONDecoder().decode(MusicResponse.self , from: jsonData)
                let results = res.result
                completion(.success(results))
            }
            catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
        
    }
}


