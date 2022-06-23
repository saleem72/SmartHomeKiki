//
//  Bundle+Extension.swift
//  ArchitectureTestingApp
//
//  Created by Yousef on 10/26/21.
//

import Foundation

extension Bundle {
    func ObjectFromJson<T: Decodable>(type: T.Type,fileName: String) -> Result<T, Error> {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "") else {
            return .failure(BundleDecodingError.fileNotFound(fileName))
        }
        
        guard let data = try? Data(contentsOf: url) else {
            return .failure(BundleDecodingError.failToGetData)
        }
        
//        let serialized = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
//        print(serialized)
        
        let decoder = JSONDecoder()
        let dateFormatter = Date.dateFormatter()
        
        // "2022-03-16"
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        guard let result = try? decoder.decode(T.self, from: data) else {
            return .failure(BundleDecodingError.failToDecode)
        }
        
        return .success(result)
        
    }
    
    enum BundleDecodingError: Error, LocalizedError {
        case fileNotFound(String), failToGetData, failToDecode
        
        var errorDescription: String? {
            switch self {
            
            
            case .fileNotFound(let fileName):
                return "Can't find file: \(fileName)"
            case .failToGetData:
                return "Can't get data from file"
            case .failToDecode:
                return "Some of your data are corrpted"
            }
        }
    }
}
