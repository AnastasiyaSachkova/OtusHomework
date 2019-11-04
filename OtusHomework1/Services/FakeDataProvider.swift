//
//  FakeDataProvider.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 25/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation

struct FakeDataProvider {
    
    func loadFakeData() -> [FakeData] {
        if let url = Bundle.main.url(forResource: "FakeData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(FakeDatas.self, from: data)
                return jsonData.data
            } catch {
                print("error:\(error.localizedDescription)")
            }
        }
        return []
    }
}
