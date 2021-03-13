//
//  LocalFilesViewModel.swift
//  Tik Tok
//
//  Created by Rhulani Ndhlovu on 3/13/21.
//  Copyright © 2021 Codenamerhu. All rights reserved.
//

import Foundation

class LocalFilesViewModel {
    
    var toks = [TikToks]()
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    var numOfItems = 0
    func numberOfItemsInCollection() -> Int {
        return numOfItems
    }
    
    func readJsonFile(completion: @escaping (Toks?, Error?) -> Void ){
        if let path = Bundle.main.path(forResource: "Toks", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let tiktoks = try self.jsonDecoder.decode(Toks.self, from: data)
                DispatchQueue.main.async {
                    self.numOfItems = tiktoks.toks.count
                    completion(tiktoks, nil)
                }
              } catch {
                   // handle error
                print(error)
              }
        }
    }
}
