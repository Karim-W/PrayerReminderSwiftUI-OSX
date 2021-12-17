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
    var body: some View {
        VStack{
            if(loaded){
            HStack{
                Spacer()
            }
            HStack(spacing:90){
                Spacer()
                Group {
                    Image(systemName: "arrow.left").font(.largeTitle)
                    Text(viewDate).font(.largeTitle)
                    Image(systemName: "arrow.right").font(.largeTitle)
                }
                Image(systemName: "gear").font(.title)
                Text(ApiPayload(loca: loc.getLongLatApiString(), dat: "Today").getPayload())
            }.padding(.horizontal)
                DayViewer()
            }else{
                ProgressView()
            }
        }.padding().frame(minWidth: 500,minHeight: 500,alignment: .center).onAppear {
            thingie = ApiPayload(loca: loc.getLongLatApiString(), dat: "Today")
            loaded = true
        }
    }
}

struct Nav_Previews: PreviewProvider {
    static var previews: some View {
        Nav()
    }
}
