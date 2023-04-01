//
//  RequestManager.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 21-07-22.
//  Edited by Nelson Hereveri on 30-03-2023.
//

import Foundation

protocol URLSessionProtocol {
  func dataTask<T>(with url: URL, completionHandler: @escaping (Result<(Data, URLResponse), Error>) -> T) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {
  func dataTask<T>(with url: URL, completionHandler: @escaping (Result<(Data, URLResponse), Error>) -> T) -> URLSessionDataTask {
    return dataTask(with: url) { (data, response, error) in
      if let data = data, let response = response {
        completionHandler(.success((data, response)))
      } else if let error = error {
        completionHandler(.failure(error))
      }
    }
  }
}

protocol JSONDecoderProtocol {
  func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
}

extension JSONDecoder: JSONDecoderProtocol {}

protocol Endpoint {
  var baseURL: String { get }
  var path: String { get }
  var url: URL? { get }
}

struct FruitsAPI: Endpoint {
  let baseURL = "https://run.mocky.io/v3/d7a4fad5-4c51-453b-87ed-602d7a026872"
  let path = "/all"
  
  var url: URL? {
    return URL(string: baseURL + path)
  }
}

class RequestManager {
  private var session: URLSessionProtocol
  public static let shared = RequestManager()
  
  init(session: URLSessionProtocol = URLSession(configuration: URLSessionConfiguration.default)) {
    self.session = session
  }
  
  private func decodeJSON(with decoder: JSONDecoderProtocol, from data: Data, completion: @escaping (([FruitModel?]?, Error?) -> Void)) {
    do {
      let decodedObject = try decoder.decode([FruitModel].self, from: data)
      completion(decodedObject, nil)
    } catch {
      completion(nil, NSError())
    }
  }
}

protocol FruitDataProvider {
  func getAllFruits(_ completion: @escaping ([FruitModel?]?, Error?) -> Void)
}

extension RequestManager: FruitDataProvider {
  func getAllFruits(_ completion: @escaping (([FruitModel?]?, Error?) -> Void)) {
    let endpoint = FruitsAPI()
    
    guard let url = endpoint.url else {
      completion(nil, NSError())
      return
    }
    
    session.dataTask(with: url) { (result: Result<(Data, URLResponse), Error>) in
      switch result {
      case .success(let (data, _)):
        let decoder = JSONDecoder()
        self.decodeJSON(with: decoder, from: data, completion: completion)
        
      case .failure(let error):
        completion(nil, error)
      }
    }.resume()
  }
}
