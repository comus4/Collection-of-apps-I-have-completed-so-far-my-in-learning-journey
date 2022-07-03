//
//  ContentView.swift
//  BetterRest
//
//  Created by Comus Hardman following 100 Days of SwiftUI by Paul Hudson.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    init(){
            UITableView.appearance().backgroundColor = .clear
        }
    @State var value = ""
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false

    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 9
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    let gradient = Gradient(colors: [.black, .pink])


    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("When do you want to wake up?").font(.headline)) {
                

                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                

                Section(header: Text("Desired amount of sleep").font(.headline)) {

                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }

                Section(header: Text("Daily coffee intake").font(.headline)) {
            
                    
                    Picker("Coffee intake", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) { i in
                            Text("\(i) \(i == 1 ? "cup" : "cups")")
                        }
                    }
                    .id("coffee")
                    .labelsHidden()
                    .pickerStyle(WheelPickerStyle())

//                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                }
            }
            .foregroundColor(Color.black)
            .background(Color.init(Color.RGBColorSpace.sRGB, red: 0.2, green: 0.5, blue: 0.8, opacity: 0.6))
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
            
        }
    }

    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60

            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }

        showingAlert = true
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
