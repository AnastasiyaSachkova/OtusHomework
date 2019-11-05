//
//  SuffixIterator.swift
//  OtusHomework1
//
//  Created by 7Winds on 04.11.2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation

struct SuffixIterator: IteratorProtocol {
    
    let string: String
    var last: String.Index
    var offset: String.Index
    
    init(string: String) {
        self.string = string
        self.last = string.endIndex
        self.offset = string.startIndex
    }
    
    mutating func next() -> Substring? {
        guard offset < last else { return nil }
        
        let sub: Substring = string[offset..<last]
        string.formIndex(after: &offset)
        return sub
    }
}

struct SuffixSequence: Sequence {
    let string: String
    
    func makeIterator() -> SuffixIterator {
        return SuffixIterator(string: string)
    }
}


struct SuffixArray {
    let dataSource = AlgoProvider()
    var suffixes: [(String, String)] = []
    
    mutating func getSuffixes() {
        for string in dataSource.all {
            let sequence = SuffixSequence(string: string)
            for suffix in sequence {
                suffixes.append((String(suffix), string))
            }
        }
    }
    
    mutating func sortSuffixes(){
        suffixes.sort { $0.0 < $1.0 }
    }
}
