//
//  ServiceLocator.swift
//  OtusHomework1
//
//  Created by 7Winds on 16.12.2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation

protocol ServiceLocating {
    func getService<T>() -> T?
}

final class ServiceLocator: ServiceLocating {
    
    private lazy var services: Dictionary<String, Any> = [:]
    
    private init() {
        addService(service: Services.fakeDataProvider)
        addService(service: Services.algoProvider)
    }
    
    public static let shared = ServiceLocator()
    
    private func typeName(some: Any) -> String {
        return (some is Any.Type) ?
            "\(some)" : "\(type(of: some))"
    }
    
    func addService<T>(service: T) {
        let key = typeName(some: T.self)
        services[key] = service
    }
    
    func getService<T>() -> T? {
        let key = typeName(some: T.self)
        return services[key] as? T
    }
}
