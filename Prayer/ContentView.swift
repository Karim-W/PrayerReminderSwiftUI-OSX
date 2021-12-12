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
    @State var progressValue: Float = 0.05
    @State var TotalMins: Int = 0
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
            ZStack{
                Circle().stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(Color.red)
                Circle()
                    .trim(from: 0.0, to: CGFloat(progressValue))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.red).rotationEffect(.degrees(90.0))
                VStack{
                    Text("Current Prayer: \(currentPrayer)")
                    Text("Next Prayer: \(nextPrayer)")
                    Text("Time Remaining:")
                    Text(remaining)
                }.onReceive(timer) { time in
                    getBearing()
                    setTimeRemaining()
                }
            }.padding()
            if(!loading){
                HStack{
                    ForEach(dayInstance.getPrayerTimes()) { aPrayer in
                        VStack{
                            Group {
                                Text(aPrayer.getPrayerName()).padding(.horizontal).padding(.top)
                                Text(aPrayer.startTime).padding(.bottom)
                            }
                            
                        }.background(Color.init(Color.RGBColorSpace.sRGB, red: 0.99, green: 0.13, blue: 0.11, opacity:  0.3)).cornerRadius(CGFloat(10)).padding(.vertical)
                    }
                }.padding()
            }else{
                VStack{
                    ProgressView().progressViewStyle(.circular)
                    Text("Loading Prayers")
                }
            }
        }.padding().frame(minWidth: 400,minHeight: 400).onAppear {
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
                if(i==0){
                    currentPrayer = prs[4].getPrayerName()
                }else{
                    currentPrayer = prs[i-1].getPrayerName()
                }
                nextPrayer = prs[i].getPrayerName()
                nextTime = prs[i].startTime
                if(i==0){
                    TotalMins = getTimeDiffrenceinMins(start: prs[4].startTime, end: prs[i].startTime)
                    TotalMins += 12*60
                    print(TotalMins)
                }else{
                    TotalMins = getTimeDiffrenceinMins(start: prs[i-1].startTime, end: prs[i].startTime)
                }
                return
            }
        }
    }
    func getFormattedDate(date: Date, format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: date)
    }
    func setTimeRemaining(){
        let d = getFormattedDate(date: Date(), format: "HH:mm")
        remaining = getTimeDiffrence(start:d , end: nextTime)
        if(TotalMins != 0){
            let pre = getTimeDiffrenceinMins(start: d, end: nextTime)
            progressValue = Float(TotalMins-pre)/Float(TotalMins)
        }
        
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
    func getTimeDiffrenceinMins(start: String, end: String) -> Int{
        print("start",start)
        print("end",end)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let startDate = dateFormatter.date(from: start)
        let endDate = dateFormatter.date(from: end)
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: startDate!, to: endDate!)
        if(components.hour! > 0){
            return (components.hour!*60)+components.minute!
        }else{
            return components.minute!
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
