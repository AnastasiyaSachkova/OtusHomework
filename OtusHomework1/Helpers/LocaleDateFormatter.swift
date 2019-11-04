//
//  LocaleDateFormatter.swift
//  OtusHomework1
//
//  Created by 7Winds on 01.11.2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
//class Enums {

    enum locale: String {
        //    static let en = "en_US"
        //    static let fr = "fr"
        //    static let es = "es"
        //    static let zh = "zh_CN"
        //    static let current = Locale.current.languageCode
        case en
        case fr
        case es
        case zh
        case current
        
        func getLocale() -> String {
            switch self {
            case .en: return "en_US"
            case .fr: return "fr"
            case .es: return "es"
            case .zh: return "zh_CN"
            default: return Locale.current.languageCode ?? "ru"
                
            }
        }
        //    func getLocale() -> Locale {
        //        switch self {
        //        case .en: return Locale(identifier: "en")
        //        case .fr: return Locale(identifier: "fr")
        //        case .es: return Locale(identifier: "es")
        //        case .zh: return Locale(identifier: "zh_CN")
        //        default: return Locale.current
        //
        //        }
        //    }
    }

enum DateFormatterEnum {
    case date
    case time
   
    
    func getFormatter() -> String {
        switch self {
        case .date: return "dd MMM yyyy"
        case .time: return "HH:mm"
        default: return "dd MMM yyyy HH:mm"
            
        }
    }
}
//}
