//
//  ContentView.swift
//  Prayer
//
//  Created by Karim Hassan on 06/12/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var loading = true
    @State var dayInstance = Day()
    var body: some View {
        VStack{
            if(!loading){
            HStack{
                ForEach(dayInstance.getPrayerTimes()) { aPrayer in
                    VStack{
//                        Text(aPrayer.prayerName)
                        Text(aPrayer.startTime)
                    }.padding()
                }
                
                
            }
            }else{
                VStack{
                    ProgressView().progressViewStyle(.circular)
                    Text("Loading Prayers")
                }
            }
            Button("pwess") {
                getBearing()
            }
            
        }.padding().frame(minWidth: 400).onAppear {
            initialLoad()
        }
        
    }
    func initialLoad(){//Shout out iyas
        Task.init(priority: .background) {
            await PrayerAPI().getPrayerTimes(completion: { PrayerAPIResponse in
                var prayers:[Prayer] = []
                prayers.append(Prayer(pName: prayerType.Fajr, pStart: PrayerAPIResponse.fajr))
                prayers.append(Prayer(pName: prayerType.Duhur, pStart: PrayerAPIResponse.dhuhr))
                prayers.append(Prayer(pName: prayerType.Asr, pStart: PrayerAPIResponse.asr))
                prayers.append(Prayer(pName: prayerType.Maghrib, pStart: PrayerAPIResponse.maghrib))
                prayers.append(Prayer(pName: prayerType.Isha, pStart: PrayerAPIResponse.isha))
                dayInstance.setPrayersOfTheDay(prayerArr: prayers)
                loading = false
            })
        }
    }
    func getBearing(){
        let formatingDate = getFormattedDate(date: Date(), format: "HH:MM")
//        for timing in prayerTimings{
//            print(timing.key,":",timing.value)
//        }
                print(formatingDate)
    }
    func getFormattedDate(date: Date, format: String) -> String {
            let dateformat = DateFormatter()
            dateformat.dateFormat = format
            return dateformat.string(from: date)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
