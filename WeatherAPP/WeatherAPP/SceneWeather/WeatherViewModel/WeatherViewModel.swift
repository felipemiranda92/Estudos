import Foundation

class WeatherViewModel {
    
    private var service: WeatherService = WeatherService()
    private var weather: Weather?
    
    func fetchWeather(cityName: String, completion: @escaping (String?) -> Void) {
        service.getWeatherURLSession(cityName: cityName) { result in
            switch result {
            case .success(let success):
                self.weather = success
                if let temperature = self.weather?.main?.temp {
                    let celsiusTemperature = temperature - 273.15
                    let formattedTemperature = String(format: "%.1f", celsiusTemperature)
                    completion("Temperatura: \(formattedTemperature) °C em \(self.formatCityName(cityName))")
                } else {
                    completion(nil)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
                completion(nil)
            }
        }
    }
    
    func formatCityName(_ cityName: String) -> String {
        return cityName.capitalizedFirstLetter()
    }
}

extension String {
    func capitalizedFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
