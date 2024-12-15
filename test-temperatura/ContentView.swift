//
//  ContentView.swift
//  test-temperatura
//
//  Created by Vincent Berihuete Paulino on 14/12/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var networkManager = NetworkManager()
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    var body: some View {
        NavigationView {
            VStack {
                if !networkManager.sensorData.isEmpty {
                    // Line Chart
                    LineChartView(data: networkManager.sensorData)
                        .padding(.horizontal)
                }

                // Sensor Data List
                List(networkManager.sensorData) { data in
                    VStack(alignment: .leading) {
                        Text("Temperature: \(numberFormatter.string(from: data.temperature as NSNumber) ?? "")°C")
                            .font(.headline)
                        Text("Humidity: \(numberFormatter.string(from: data.humidity as NSNumber) ?? "")%")
                            .font(.subheadline)
                        Text("Date: \(data.date)")
                            .font(.caption)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Sensor Data")
            .onAppear {
                networkManager.fetchData()
            }
        }
    }
}

#Preview {
    ContentView()
}
