//
//  Home.swift
//  TiempoApp
//
//  Created by Cony Pierola on 17-12-24.
//

import SwiftUI

struct Home: View {
    
    @StateObject var tiempo = WeatherViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(tiempo.cityName)")
                .font(.system(size: 35))
                .bold()
            Text("\(Date().formatted(date: .complete, time: .omitted))")
                .font(.system(size: 18))
            Text(tiempo.weatherEmoji)
                .font(.system(size: 180))
                .shadow(radius: 65)
            Text("\(tiempo.currentTemp)°C")
                .font(.system(size: 70))
                .bold()
            Text("\(tiempo.conditionText)")
                .font(.system(size: 22))
                .bold()
            Spacer()
            List(tiempo.results) { forecast in
                HStack(alignment: . center, spacing: nil) {
                    Text("\(tiempo.getShortDate(epoch: forecast.date_epoch))")
                        .frame(maxWidth: 50, alignment: .leading)
                        .bold()
                    Text("\(tiempo.getWeatherEmoji(text: forecast.day.condition.text))")
                        .frame(maxWidth: 30, alignment: .leading)
                    Text("\(Int(forecast.day.avgtemp_c))°C")
                    Spacer()
                    Text("\(forecast.day.condition.text)")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .listRowBackground(Color.white.blur(radius: 75).opacity(0.5))
            }
            .contentMargins(.vertical, 0)
            .scrollContentBackground(.hidden)
            .preferredColorScheme(.dark)
            Spacer()
            Text("Data supplied by Weather API")
                .font(.system(size: 16))
                .foregroundStyle(.white)
        }
        .background(tiempo.backgroundColor)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .task {
            await tiempo.fetchWeather()
        }
    }
}

#Preview {
    Home()
}
