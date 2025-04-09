//
//  Pa.swift
//  AppDondeBanco
//
//  Created by William Brando Estrada Tepec on 11/15/24.
//

import Foundation
/*
protocol ServiceProtocol: AnyObject {
    func parse<T:Decodable>(_ input: Data?) -> T?
    func request<T:Decodable>(method: HTTPMethod,_ completion: @escaping (Result<T?, ErrorRequest>) -> Void)
    
}

extension ServiceProtocol {
    func request<T:Decodable>(method: HTTPMethod,_ completion: @escaping (Result<T?, ErrorRequest>) -> Void) {
    }
}


// Servicios para provedores externos | firebase, aws, etc.
protocol ServiceLayerExternal: ServiceProtocol {
    func parse<T:Decodable>(_ input: Data?) -> T?
    func parse<T:Decodable>(_ input: Data?, _ completion: @escaping (Result<T?, ErrorRequest>) -> Void)
    func requestConfig<T: Decodable>(_ completion: @escaping (Result<T?, ErrorRequest>) -> Void)
    func requestConfigForKey<T>(key: String,_ completion: @escaping (Result<T?, ErrorRequest>) -> Void)
    func requestConfigForKey<T:Decodable>(key: String ) async throws ->T?
    func requestConfigForKey2(key: String, needDecypher: Bool) async throws -> Data?

    
}

extension ServiceLayerExternal {
    
    func parse<T:Decodable>(_ input: Data?) -> T? {
        guard let data = input else {   return nil}
        
        do {
            let responnse = try JSONDecoder().decode(T.self, from: data)
            return responnse//completion(.success(responnse))
        } catch {
            print("Decoding error: \(error)")
            return nil//completion(.failure(.decodingError))
        }
    }
    
    func parse<T:Decodable>(_ input: Data?, _ completion: @escaping (Result<T?, ErrorRequest>) -> Void)  {
        guard let data = input else {   return }
        do {
            let responnse = try JSONDecoder().decode(T.self, from: data)
            completion(.success(responnse))
        } catch {
            print("Decoding error: \(error)")
             completion(.failure(.decodingError))
        }
    }
}

extension ServiceLayerExternal {
    func requestConfig<T: Decodable>(_ completion: @escaping (Result<T?, ErrorRequest>) -> Void) {
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        remoteConfig.configSettings = settings
        settings.minimumFetchInterval = 0
        remoteConfig.fetchAndActivate { [weak self] (status, error) in
            if status != .error {
                print("Config fetched!")
                //Obtencion de datos
                let getcK: String? = remoteConfig.configValue(forKey: Constants.cK).stringValue
                let geteK: String? = remoteConfig.configValue(forKey: Constants.eK).stringValue
                let showMLogin: Bool? = remoteConfig.configValue(forKey: Constants.iOSMaintenanceLogin).boolValue
                let showMEnroll: Bool? = remoteConfig.configValue(forKey: Constants.iOSMaintenanceEnroll).boolValue
                let versionFetch: String? = remoteConfig.configValue(forKey: Constants.iosVersion).stringValue
                // Salvado de valores
                SessionData.shared.saveHasMaintenanceLogin(manteinance: showMLogin)
                SessionData.shared.saveHasMaintenanceEnroll(manteinance: showMEnroll)
                
                guard let getcK, let geteK , let versionFetch  else { return }

                SessionData.shared.renewCKWith(cypherKey: getcK)
                SessionData.shared.renewCKWith(cypherKey: geteK.getAESGCMDecryptedString())
                
                // Decryp value
                let decriptedVersion = versionFetch.getAESGCMDecryptedString()
                let decodedData = Data(base64Encoded: decriptedVersion)
                let decodedString = String(data: decodedData!, encoding: .utf8)!
                let final = decodedString.data(using: .utf8)

                
                let versionModel: T? = self?.parse(final)
                
                if versionModel == nil {
                    completion(Result.failure(.decodingError))
                }
                
                completion(Result.success(versionModel))
            } else {
                
                print("Config not fetched")
                completion(.failure(.noResponse))
                
                
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
        }
    }
    func requestConfigForKey<T>(key: String,_ completion: @escaping (Result<T?, ErrorRequest>) -> Void) {
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        remoteConfig.configSettings = settings
        settings.minimumFetchInterval = 0
        remoteConfig.fetchAndActivate { [weak self] (status, error) in
            if status != .error {
                let versionFetch = remoteConfig.configValue(forKey: key)
                completion(.success(versionFetch as? T))
            } else {
                completion(.failure(.noResponse))
            }
        }
    }
    
    func requestConfigForKey<T:Decodable>(key: String) async throws ->T? {
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        remoteConfig.configSettings = settings
        settings.minimumFetchInterval = 0
        
        let fetchResult = try await withCheckedThrowingContinuation { [weak self] CheckedContinuation in
            remoteConfig.fetchAndActivate { [weak self]  (status, error) in
                
                if status != .error {
                    let versionFetch = remoteConfig.configValue(forKey: key)

                    let valueee: T? = self?.inferitType(value: versionFetch)
                    CheckedContinuation.resume(returning: valueee)
                    
                } else {
                    CheckedContinuation.resume(throwing: ErrorRequest.anyError(error!))
                }
            }
        }
        return fetchResult

    }
    
    func requestConfigForKey2<T:Decodable>(key: String, needDecypher: Bool = false) async throws -> T? {
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        remoteConfig.configSettings = settings
        settings.minimumFetchInterval = 0
        
        let fetchResult = try await withCheckedThrowingContinuation { [weak self] CheckedContinuation in
            remoteConfig.fetchAndActivate { [weak self]  (status, error) in
                
                if status != .error {
                    if needDecypher {
                        
                    }
                    let versionFetch = remoteConfig.configValue(forKey: key).dataValue
                    let value: T? = self?.parse(versionFetch)
                    CheckedContinuation.resume(returning: value)
                    
                } else {
                    CheckedContinuation.resume(throwing: ErrorRequest.anyError(error!))
                }
            }
        }
        print("Data Result: \(String(describing: fetchResult))")
        return fetchResult

    }
    
    private func getVersionData(from dataStr: String) -> DataVersion? {
            guard let data = dataStr.data(using: .utf8), let versionData = try? JSONDecoder().decode(DataVersion.self, from: data) else { return nil }
            return versionData
        }
    
    func inferitType<T: Decodable>(value: RemoteConfigValue) -> T? {
        switch T.self {
        case is String.Type: return value.stringValue as? T
        case is Double.Type: return value.numberValue as? T
        case is Bool.Type: return value.boolValue as? T
        
        default: return parse(value.dataValue)
            
        }
    }
    

}


enum ErrorRequest: Error {
    case invalidURL
    case invalidResponse
    case noResponse
    case decodingError
    case anyError(Error)
}

enum HTTPMethod {
case GET,POST,PUT,DELETE
}


extension String{
    func toHexaEncripTesting() -> String {
         return self.utf8.map { String(format: "%02x", $0) }.joined()
        }
    func fromBase64() -> String? {
            guard let data = Data(base64Encoded: self) else {
                return nil
            }

            return String(data: data, encoding: .utf8)
        }

    func toBase64() -> String {
            return Data(self.utf8).base64EncodedString()
    }
}
*/
