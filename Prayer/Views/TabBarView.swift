//
//  TabBarView.swift
//  Prayer
//
//  Created by Karim Hassan on 17/12/2021.
//

import SwiftUI

struct TabBarViews:Identifiable{
var id:Int
var name:String
var iconName:String
var selected:Bool
    init(ID:Int,Name:String,IconName:String,Selected:Bool){
        self.id = ID
        self.name = Name
        self.iconName = IconName
        self.selected = Selected
    }
}

struct TabBarView: View {
    @State var SelectedIndex:Int = 0
    @State var views:[TabBarViews] = [TabBarViews(ID:0,Name:"Home",IconName:"house",Selected:true),TabBarViews(ID:1,Name:"Settings",IconName:"gear",Selected:false)]
    let col = SwiftUI.Color(SwiftUI.Color.RGBColorSpace.sRGB, red: 0.99, green: 0.13, blue: 0.11, opacity:  0.3)
    var body: some View {
        VStack{
            Group{
            switch(SelectedIndex){
            case 0: Nav()
            case 1: SettingsView()
            default:
                Text("error")
            }}.frame(minWidth:600,minHeight: 500)
            HStack{
                ForEach(views){ aView in
                    ZStack{
                        Rectangle().frame(minWidth:310,maxHeight: 50).foregroundColor((aView.id == SelectedIndex) ? .red : .red.opacity(0.3))
                        HStack{
                            Image(systemName: aView.iconName)
                            Text(aView.name)
                        }
                    }.onTapGesture {
                        SelectedIndex = aView.id
                    }
                }
            }.background(.red.opacity(0.3))
        }.frame(minWidth:600,minHeight: 500)
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
