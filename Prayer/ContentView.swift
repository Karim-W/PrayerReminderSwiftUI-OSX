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
    @State var nextPrayer:String = ""
    @State var currentPrayer:String = ""
    @State var TimeUntil:String = ""
    @State var nextTime:String = ""
    @State var remaining:String = ""
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    //    let currentTime = getFormattedDate(date: Date(), format: "HH:mm")
    var body: some View {
        VStack{
            if(!loading){
                HStack{
                    ForEach(dayInstance.getPrayerTimes()) { aPrayer in
                        VStack{
                            Text(aPrayer.getPrayerName())
                            Text(aPrayer.startTime)
                        }.padding()
                    }
                }
                Text("Time Remaining: \(remaining)").padding().onReceive(timer) { time in
                    setTimeRemaining()
                }
            }else{
                VStack{
                    ProgressView().progressViewStyle(.circular)
                    Text("Loading Prayers")
                }
            }
            VStack{
                Text("Current Prayer: \(currentPrayer)")
                Text("Next Prayer: \(nextPrayer)")
            }.onReceive(timer) { time in
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
                getBearing()
                setTimeRemaining()
                loading = false
            })
        }
    }
    func getBearing(){
        let formatingDate = getFormattedDate(date: Date(), format: "HH:mm")
        let prs = dayInstance.getPrayerTimes()
        for i in 0...4{
            if(prs[i].startTime>formatingDate){
                currentPrayer = prs[i-1].getPrayerName()
                nextPrayer = prs[i].getPrayerName()
                nextTime = prs[i].startTime
                
                return
            }
        }
        
        print(formatingDate)
    }
    func getFormattedDate(date: Date, format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: date)
    }
    
    //function to update every minute
    func updateRemainingTime(){
        //        Timer.scheduledTimer(timeInterval: 60, target: Any, selector: setTimeRemaining, userInfo: Any?, repeats: true)
    }
    func setTimeRemaining(){
        remaining = getTimeDiffrence(start: getFormattedDate(date: Date(), format: "HH:mm"), end: nextTime)
    }
    //Function to get the time diffrence
    func getTimeDiffrence(start: String, end: String) -> String{
        print("start",start)
        print("end",end)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let startDate = dateFormatter.date(from: start)
        let endDate = dateFormatter.date(from: end)
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: startDate!, to: endDate!)
        if(components.hour! > 0){
            return "\(components.hour!) H: \(components.minute!) M"
        }else{
            return "\(components.minute!) minutes"
        }
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
