//
//  ContentView.swift
//  WeatherWidgetExample
//
//  Created by Jiwon Yoon on 2023/03/29.
//

import SwiftUI

struct ContentView: View {
    var weather = Weather()
    var body: some View {
        VStack {
            HStack{
                DegreeView()
                Spacer()
                WeatherIconView()
            }
            Divider()
            TimeCastView(weather: weather)

        }
        .padding()
        .foregroundColor(.white)
        .background(Color("lightBlue"))
    }
}

struct DegreeView: View {
    var cityName: String = "Cupertino"
    var degree: String = "63º"
    var body: some View {
        VStack(alignment: .leading) {
            Text(cityName)
                .font(.title3)
                .foregroundColor(.white)
            Text(degree)
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

struct WeatherIconView: View {
    var body: some View {
        VStack(alignment: .trailing) {
            Image(systemName: "sun.max.fill")
                .renderingMode(.original)
            Text("Sunny")
                .foregroundColor(.white)
            HStack {
                Text("H:68º")
                    .foregroundColor(.white)
                Text("L:42º")
                    .foregroundColor(.white)
            }
        }
    }
}

struct TimeCastView: View {
    var weather: Weather
    var body: some View {
        HStack(alignment: .top, spacing: 30) {
            ForEach(weather.hourlyForecast, id:\.hour) { forecase in
                DayView(forecase: forecase)
            }
        }
    }
}

struct DayView: View {
    let forecase: Weather.Forecast
    var body: some View {
        VStack {
            Text(forecase.hour)
                .foregroundColor(.white)
            forecase.conditions
                .renderingMode(.original)
                .frame(height: 50)
            Text(forecase.temperature)
                .foregroundColor(.white)
        }
    }
}

struct Weather {
    struct Forecast {
    let hour: String
    let conditions: Image
    let temperature: String
  }

  let hourlyForecast = [
    Forecast(hour: "8AM", conditions: Image(systemName: "sun.max.fill"), temperature: "63°"),
    Forecast(hour: "9AM", conditions: Image(systemName: "cloud.sun.fill"), temperature: "63°"),
    Forecast(hour: "10AM", conditions: Image(systemName: "sun.max.fill"), temperature: "64°"),
    Forecast(hour: "11AM", conditions: Image(systemName: "cloud.fill"), temperature: "61°"),
    Forecast(hour: "12PM", conditions: Image(systemName: "cloud.rain.fill"), temperature: "62°")
  ]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
