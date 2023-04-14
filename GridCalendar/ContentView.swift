//
//  ContentView.swift
//  GridCalendar
//
//  Created by Mia on 14/4/2023.
//

import SwiftUI

struct ContentView: View {
    
    let layout = [
        // creates single fixed column of width 40 in lazyVgrid, or fixed row of height 40 in lazyHgrid
        GridItem(.flexible(minimum: 40)),
                GridItem(.flexible(minimum: 40)),
                GridItem(.flexible(minimum: 40)),
                GridItem(.flexible(minimum: 40)),
                GridItem(.flexible(minimum: 40)),
                GridItem(.flexible(minimum: 40)),
                GridItem(.flexible(minimum: 40))
    ]
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: layout, pinnedViews: [.sectionHeaders]) {
                    ForEach(year, id: \.name){ month in
                        Section(header: Text(verbatim: month.name).font(.headline)) {
                            ForEach(month.days) { day in
                                Capsule()
                                    .overlay(Text("\(day.value)").foregroundColor(.white))
                                    .foregroundColor(.blue)
                                    .frame(height: 40)
                            }
                        }
                    }
                }
            }
        }
}


// Day structure
struct Day: Identifiable {
    let id = UUID()
    let value: Int // order of each day of month eg 2nd of June
}

// month structure
struct Month {
    let name: String
    let numberOfDays: Int
    var days: [Day]
    
    // initialiser assigns the correct vals of name and numberofdays to itself and initialises days with an empty array
    init(name: String, numberOfDays: Int) {
        self.name = name
        self.numberOfDays = numberOfDays
        self.days = []
        
        // iterate over range from 1 to numberOfDays
        for n in 1...numberOfDays {
            // initialise day structure for each value in the range and append it to the days array
            self.days.append(Day(value: n))
        }
    }
}

// entire year array
// initialising a month structure for each month in the year
let year = [
        Month(name: "January", numberOfDays: 31),
        Month(name: "February", numberOfDays: 28),
        Month(name: "March", numberOfDays: 31),
        Month(name: "April", numberOfDays: 30),
        Month(name: "May", numberOfDays: 31),
        Month(name: "June", numberOfDays: 30),
        Month(name: "July", numberOfDays: 31),
        Month(name: "August", numberOfDays: 31),
        Month(name: "September", numberOfDays: 30),
        Month(name: "October", numberOfDays: 31),
        Month(name: "November", numberOfDays: 30),
        Month(name: "December", numberOfDays: 31),
    ]


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
