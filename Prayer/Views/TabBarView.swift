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
    @State var views:[TabBarViews] = [TabBarViews(ID:0,Name:"Home",IconName:"house",Selected:true),TabBarViews(ID:1,Name:"Settings",IconName:"gear",Selected:false)]
    var body: some View {
        VStack{
            Nav()
            HStack{
                
                ForEach(views){ aView in
                    ZStack{
                        Rectangle().frame(minWidth:300,maxHeight: 50)
                        HStack{
                            Text(aView.name)
                        }
                    }
                }
            }
        }.frame(minWidth:600,minHeight: 800)
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
