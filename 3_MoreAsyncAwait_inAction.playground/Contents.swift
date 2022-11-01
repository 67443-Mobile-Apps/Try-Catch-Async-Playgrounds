import Foundation

func fetchWeatherHistory() async -> [Double] {
    (1...1_000_000).map { _ in Double.random(in: -10...30) }
}
   
func calculateAverageTemperature(for records: [Double]) async -> Double {
    let total = records.reduce(0, +)
    let average = total / Double(records.count)
    return average
}
  
func upload(result: Double) async -> String {
    "OK"
}


// MARK: Using these functions...
func processWeather() async {
    print("fetch weather data")
    let records = await fetchWeatherHistory()
    print("calculate average temp")
    let average = await calculateAverageTemperature(for: records)
    print("upload average data")
    let response = await upload(result: average)
    print("Server response: \(response)")
}

Task {
  print("Start task")
  await processWeather()
  print("End task")
}
print("Outside of task")
