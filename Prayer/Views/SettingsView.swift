//
//  SettingsView.swift
//  Prayer
//
//  Created by Karim Hassan on 18/12/2021.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack{
            Text("settings").font(.largeTitle).fontWeight(.bold)
        }.padding().frame(alignment: .center)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
