//
//  NetworkManager.swift
//  test-temperatura
//
//  Created by Vincent Berihuete Paulino on 14/12/2024.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var sensorData: [SensorData] = []

    func fetchData() {
        guard let url = URL(string: "YOUR-SERVICE-URL") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }

            guard let data = data else { return }

            do {
                let decodedData = try JSONDecoder().decode([SensorData].self, from: data)
                DispatchQueue.main.async {
                    self.sensorData = decodedData
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}
