//
//  Nav.swift
//  Prayer
//
//  Created by Karim Hassan on 15/12/2021.
//

import SwiftUI
import CoreLocation
struct Nav: View {
    @State var viewDate:String = "Today"
    @ObservedObject private var loc = LocationManager()
    @State var thingie:ApiPayload?
    @State var loaded:Bool = false
    @State var navedDate:Date = Date()
    var body: some View {
        VStack{

                Group{
                    HStack{
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Group {
                            Image(systemName: "arrow.left").font(.largeTitle).onTapGesture {
                                moveOneDay(nextDay: false)
                            }
                            Text(viewDate).font(.largeTitle)
                            Image(systemName: "arrow.right").font(.largeTitle).onTapGesture {
                                moveOneDay(nextDay: true)
                            }
                        }
                        Spacer()
                        Image(systemName: "gear").font(.title)
                    }
                    if(loaded){
                    DayViewer(APIPayload: ApiPayload(loca: loc.getLongLatApiString(), dat: viewDate).getPayload(),addedLoader: loaded)
                    }else{
                        ProgressView()
                    }
                }
            
            
        }.padding().frame(minWidth: 600,minHeight: 500,alignment: .center).onAppear {
            thingie = ApiPayload(loca: loc.getLongLatApiString(), dat: "Today")
            loaded = true
        }
    }
    func moveOneDay(nextDay:Bool){
        //increment date by one
        loaded = false
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        var newDay:String
        if(nextDay){
            let newDate = Calendar.current.date(byAdding: .day, value: 1, to: navedDate)
            navedDate = newDate!
            newDay = formatter.string(from: newDate!)
        }else{
            let newDate = Calendar.current.date(byAdding: .day, value: -1, to: navedDate)
            navedDate = newDate!
            newDay = formatter.string(from: newDate!)
        }
        let today = formatter.string(from: Date())
        if(newDay==today){
            viewDate = "Today"
        }else{
            viewDate = newDay
        }
        async{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){loaded.toggle()}
        }

        
       
}
}


struct Nav_Previews: PreviewProvider {
    static var previews: some View {
        Nav()
    }
}
