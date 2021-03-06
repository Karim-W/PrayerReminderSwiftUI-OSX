//
//  DayViewer.swift
//  Prayer
//
//  Created by Karim Hassan on 15/12/2021.
//

import SwiftUI

struct DayViewer: View {
    @State var loading = true
    @State var dayInstance = Day()
    @State var nextPrayer:String = ""
    @State var currentPrayer:String = ""
    @State var TimeUntil:String = ""
    @State var nextTime:String = ""
    @State var remaining:String = ""
    @State var progressValue: Float = 0.05
    @State var TotalMins: Int = 0
    @State var APIPayload:String
    @State var addedLoader:Bool
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
                    .foregroundColor(Color.red).rotationEffect(.degrees(90.0)).shadow(color: .red, radius: CGFloat(2))
                VStack{
                    Text("Current Prayer: \(currentPrayer)")
                    Text("Next Prayer: \(nextPrayer)")
                    Text("Time Remaining:")
                    Text(remaining)
                }.onReceive(timer) { time in
                    initialLoad()
                    //                    getBearing()
                    //                    setTimeRemaining()
                }
            }.padding()
            if(!loading && addedLoader){
                HStack{
                    ForEach(dayInstance.getPrayerTimes()) { aPrayer in
                        VStack{
                            Group {
                                Text(aPrayer.getPrayerName()).padding(.horizontal).padding(.top)
                                Text(aPrayer.startTime).padding(.bottom)
                            }
                        }.background(aPrayer.Color).cornerRadius(CGFloat(10)).padding(.vertical).onTapGesture {
                            dayInstance.logPrayed(prayerName: aPrayer.prayerName)
                            refresh()
                        }
                    }
                }.padding()
            }else{
                VStack{
                    ProgressView().progressViewStyle(.circular)
                    Text("Loading Prayers")
                }
            }
        }.padding().frame(minWidth: 300,minHeight: 400).onAppear {
            initialLoad()
        }
    }
    func refresh(){
        loading.toggle()
        loading.toggle()
    }
    func initialLoad(){//Shout out iyas
        Task.init(priority: .background) {
            print("here is the api string\(APIPayload)")
            await PrayerAPI().getPrayerWithForumlatedPayload(payload: APIPayload,completion: { PrayerAPIResponse in
                var prayers:[Prayer] = []
                prayers.append(Prayer(pName: prayerType.Fajr, pStart: PrayerAPIResponse.fajr))
                prayers.append(Prayer(pName: prayerType.Duhur, pStart: PrayerAPIResponse.dhuhr))
                prayers.append(Prayer(pName: prayerType.Asr, pStart: PrayerAPIResponse.asr))
                prayers.append(Prayer(pName: prayerType.Maghrib, pStart: PrayerAPIResponse.maghrib))
                prayers.append(Prayer(pName: prayerType.Isha, pStart: PrayerAPIResponse.isha))
                dayInstance.setPrayersOfTheDay(prayerArr: prayers)
                getBearing()
                //                setTimeRemaining()
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
                    print("here1")
                    currentPrayer = prs[4].getPrayerName()
                    nextPrayer = prs[i].getPrayerName()
                    nextTime = prs[i].startTime
                }
                else{
                    print("here3")
                    currentPrayer = prs[i-1].getPrayerName()
                    nextPrayer = prs[i].getPrayerName()
                    nextTime = prs[i].startTime
                }
                
                if(i==0){
                    TotalMins = getTimeDiffrenceinMins(start: prs[4].startTime, end: prs[i].startTime)
                    TotalMins += 12*60
                }else{
                    TotalMins = getTimeDiffrenceinMins(start: prs[i-1].startTime, end: prs[i].startTime)
                }
                setTimeRemaining()
                return
            }
        }
        currentPrayer = prs[4].getPrayerName()
        nextPrayer = prs[0].getPrayerName()
        nextTime = prs[0].startTime
        setTimeRemaining()
        TotalMins = (12*60)+getTimeDiffrenceinMins(start: prs[0].startTime, end: prs[4].startTime)
        
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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let startDate = dateFormatter.date(from: start)
        let endDate = dateFormatter.date(from: end)
        let calendar = Calendar.current
        var components = calendar.dateComponents([.hour, .minute], from: startDate!, to: endDate!)
        let Diff = (endDate?.timeIntervalSince(startDate!))! as Double
        if(Diff < 0) {
            if (components.minute! < 0){
                components.hour! += 23
                components.minute! += 60
            }else{
                components.hour! += 24
            }
        }
        if(components.hour! > 0){
            return "\(components.hour!) H: \(components.minute!) M"
        }else{
            return "\(components.minute!) minutes"
        }
    }
    func getTimeDiffrenceinMins(start: String, end: String) -> Int{
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

struct DayViewer_Previews: PreviewProvider {
    static var previews: some View {
        DayViewer(APIPayload: "17-12-2021?latitude=25.21823856330777&longitude=55.413192480005186&method=8",addedLoader: true)
    }
}
