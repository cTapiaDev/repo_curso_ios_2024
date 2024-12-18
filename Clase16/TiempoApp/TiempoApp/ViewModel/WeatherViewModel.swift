//
//  WeatherViewModel.swift
//  TiempoApp
//
//  Created by Cony Pierola on 17-12-24.
//

import Foundation
import SwiftUI
import Alamofire

class WeatherViewModel: ObservableObject {
    
    let blueSky = Color.init(red: 135/255, green: 206/255, blue: 235/255)
    let greySky = Color.init(red: 47/255, green: 79/255, blue: 79/255)
    
    @Published var backgroundColor = Color.init(red: 135/255, green: 206/255, blue: 235/255)
    
    @Published var results = [ForecastDay]()
    
    @Published var weatherEmoji = "☀️"
    @Published var currentTemp = 0
    @Published var conditionText = "Slightly Overcast"
    @Published var cityName = "Talca"
    @Published var loading = true
    
    
    func fetchWeather() async {
        let request = AF.request("http://api.weatherapi.com/v1/forecast.json?key=559db2696411422eb8a185347241612&q=temuco&days=3&aqi=no&alerts=no")
        request.responseDecodable(of: Weather.self) { [self] response in
            switch response.result {
            case .success(let weather):
                dump(weather)
                cityName = weather.location.name
                results = weather.forecast.forecastday
                currentTemp = Int(results[0].day.avgtemp_c)
                backgroundColor = getBackgroundColor(text: results[0].day.condition.text)
                weatherEmoji = getWeatherEmoji(text: results[0].day.condition.text)
                conditionText = results[0].day.condition.text
                loading = false
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getWeatherEmoji(text: String) -> String {
        var weatherEmoji = "☀️"
        let conditionText = text.lowercased()
        
        if conditionText.contains("snow") || conditionText.contains("blizzard") {
            weatherEmoji = "🌨️"
        } else if conditionText.contains("rain") {
            weatherEmoji = "🌧️"
        } else if conditionText.contains("partly cloudy") {
            weatherEmoji = "🌤️"
        } else if conditionText.contains("cloudy") || conditionText.contains("overcast") {
            weatherEmoji = "☁️"
        } else if conditionText.contains("cloudy") || conditionText.contains("sunny") {
            weatherEmoji = "☀️"
        }
        
        return weatherEmoji
    }
    
    
    func getBackgroundColor(text: String) -> Color {
        var backgroundColor = blueSky
        let conditionText = text.lowercased()
        if !(conditionText.contains("clear") || conditionText.contains("sunny")) {
            backgroundColor = greySky
        }
        
        return backgroundColor
    }
    
    func getShortDate(epoch: Int) -> String {
        return Date(timeIntervalSince1970:TimeInterval(epoch)).formatted(Date.FormatStyle().weekday(.abbreviated))
    }
    
}
