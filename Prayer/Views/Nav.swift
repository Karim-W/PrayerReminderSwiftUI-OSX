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
            HStack(spacing:100){
                Image(systemName: "arrow.left")
                Text(viewDate)
                Image(systemName: "arrow.right")
            }
            DayViewer()
        }.padding().frame(minWidth: 400,minHeight: 500,alignment: .top)
    }
}

struct Nav_Previews: PreviewProvider {
    static var previews: some View {
        Nav()
    }
}
