//
//  Nav.swift
//  Prayer
//
//  Created by Karim Hassan on 15/12/2021.
//

import SwiftUI

struct Nav: View {
    @State var viewDate:String = "Today"
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Image(systemName: "gear").font(.subheadline)
            }
            HStack(spacing:100){
                Image(systemName: "arrow.left").font(.largeTitle)
                Text(viewDate).font(.largeTitle)
                Image(systemName: "arrow.right").font(.largeTitle)
            }
            DayViewer()
        }.padding().frame(minWidth: 500,minHeight: 500,alignment: .center)
    }
}

struct Nav_Previews: PreviewProvider {
    static var previews: some View {
        Nav()
    }
}
