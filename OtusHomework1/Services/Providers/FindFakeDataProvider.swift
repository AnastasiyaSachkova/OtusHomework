//
//  FindFakeDataProvider.swift
//  OtusHomework1
//
//  Created by 7Winds on 16.12.2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation

class FindFakeDataProvider {
    
var suffixArray = [(suffix: String, data: FakeData)]()
    
func findDataByName(_ findString: String) -> [FakeData] {
        let findArray = suffixArray.filter { var result = false
            if $0.suffix.count >= findString.count
            { result = $0.suffix.contains(findString.lowercased()) }
            else if $0.suffix.count < findString.count
            { result = false }
            return result
        }.map{ $0.data }
        
        return findArray
    }
    
func updateSuffixArray() {
        if suffixArray.count > 0 {
            suffixArray.removeAll()
        }
        
        for data in FakeDataProvider().loadFakeData() {
            addSuffixToArrayFrom(data: data)
        }
        self.suffixArray.sort { $0.suffix > $1.suffix }
    }
    
    private func addSuffixToArrayFrom(data: FakeData) {
        for suffix in SuffixSequence(string: data.name) {
            self.suffixArray.append((suffix: String(suffix).lowercased(), data: data))
        }
    }
}
