//
//  ContentView.swift
//  Prayer
//
//  Created by Karim Hassan on 06/12/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var prayerTimings = ["Fajr":"06:00",
                                "Duhur":"12:21",
                                "Asr":"3:14",
                                "Maghrib":"5:32",
                                "Isha":"8:00"]
    var body: some View {
        VStack{
            HStack{
                ForEach(prayerTimings.reversed(), id: \.key) { key, value in
                    VStack{
                        Text(key)
                        Text(value)
                    }
                }
                
            }
            Button("pwess") {
                Task.init(priority: .background) {
                    await PrayerAPI().getPrayerTimes(completion: { PrayerAPIResponse in
                        prayerTimings["Fajr"] = PrayerAPIResponse.fajr
                    })
                }
            }
            
        }.padding().frame(minWidth: 400).onAppear {
            initialLoad()
        }
        
    }
    func initialLoad(){//Shout out iyas
        Task.init(priority: .background) {
            await PrayerAPI().getPrayerTimes(completion: { PrayerAPIResponse in
                prayerTimings["Fajr"] = PrayerAPIResponse.fajr
                prayerTimings["Duhur"] = PrayerAPIResponse.dhuhr
                prayerTimings["Asr"] = PrayerAPIResponse.asr
                prayerTimings["Maghrib"] = PrayerAPIResponse.maghrib
                prayerTimings["Isha"] = PrayerAPIResponse.isha
                
            })
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
