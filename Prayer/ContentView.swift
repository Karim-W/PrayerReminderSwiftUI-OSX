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
                        print(PrayerAPIResponse)
                    })
                }
            }
            
        }.padding().frame(minWidth: 400)
        
    }
    
}

func idkman() async{
    let urlString = "https://api.aladhan.com/v1/calendarByCity?city=London&country=United%20Kingdom&method=2&month=04&year=2017"
    do{
        guard let urll = URL(string: urlString) else { return  }
        let (data,_) = try await URLSession.shared.data(from: urll)
        print(String(data: data, encoding: .utf8)!)
    }catch{
        print("error")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
