//
//  LineChart.swift
//  test-temperatura
//
//  Created by Vincent Berihuete Paulino on 14/12/2024.
//
import SwiftUI
import Charts

struct LineChartView: View {
    let data: [SensorData]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Temperature") // Chart title
                .font(.caption)
                .padding(.bottom, 8)
            
            Chart {
                ForEach(data.indices, id: \.self) { index in
                    LineMark(
                        x: .value("Index", index),
                        y: .value("Temperature", data[index].temperature)
                    )
                    .foregroundStyle(.red)
                    .symbol(Circle()) // Adds a circle symbol at each data point
                }
            }
            .chartYScale(domain: 0...100) // Adjust domain as needed for your data
            .frame(height: 100)

            Text("Humidity") // Chart title
                .font(.caption)
                .padding(.bottom, 8)

            Chart {
                ForEach(data.indices, id: \.self) { index in
                    BarMark(
                        x: .value("Index", index),
                        y: .value("Humidity", data[index].humidity)
                    )
                    .foregroundStyle(.blue)
                }
            }
            .chartYScale(domain: 0...100) // Adjust domain as needed for your data
            .frame(height: 100)
        }
    }
}
