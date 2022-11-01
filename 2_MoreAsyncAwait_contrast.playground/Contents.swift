import Foundation

// Older way of handling async functions:
func fetchWeatherHistory(completion: @escaping ([Double]) -> Void) {
    // Complex networking code here; we'll just send back 100,000 random temperatures
    DispatchQueue.global().async {
        let results = (1...100_000).map { _ in Double.random(in: -10...30) }
        completion(results)
    }
}
// New way in Swift 5.5:
func fetchWeatherHistory() async -> [Double] {
    (1...100_000).map { _ in Double.random(in: -10...30) }
}
   
// ______________________________________
// Older way of handling async functions:
func calculateAverageTemperature(for records: [Double], completion: @escaping (Double) -> Void) {
    // Sum our array then divide by the array size
    DispatchQueue.global().async {
        let total = records.reduce(0, +)
        let average = total / Double(records.count)
        completion(average)
    }
}
// New way in Swift 5.5:
func calculateAverageTemperature(for records: [Double]) async -> Double {
    let total = records.reduce(0, +)
    let average = total / Double(records.count)
    return average
}
  
// ______________________________________
// Older way of handling async functions:
func upload(result: Double, completion: @escaping (String) -> Void) {
    // More complex networking code; we'll just send back "OK"
    DispatchQueue.global().async {
        completion("OK")
    }
}
// Now in Swift 5.5:
func upload(result: Double) async -> String {
    "OK"
}


// MARK: Using these functions...
// ______________________________________
// Older way with multiple embedded completion block:
fetchWeatherHistory { records in
    calculateAverageTemperature(for: records) { average in
        upload(result: average) { response in
            print("Server response: \(response)")
        }
    }
}

// Newer way using async/await in Swift 5.5:
func processWeather() async {
    let records = await fetchWeatherHistory()
    let average = await calculateAverageTemperature(for: records)
    let response = await upload(result: average)
    print("Server response: \(response)")
}
