//
//  SensorData.swift
//  test-temperatura
//
//  Created by Vincent Berihuete Paulino on 14/12/2024.
//

import Foundation

struct SensorData: Identifiable, Decodable {
    let id: String
    let temperature: Double
    let humidity: Double
    let date: String
}
