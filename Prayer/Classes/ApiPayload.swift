//
//  ApiPayload.swift
//  Prayer
//
//  Created by Karim Hassan on 17/12/2021.
//

import Foundation

class ApiPayload{
    private var locationString:String
    private var dateString:String
    private var methodString:String
    
    init(loca:String ,dat:String,met:String = "8"){
        if (dat == "Today"){
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            self.dateString = formatter.string(from: date)
        }else{
            self.dateString = dat
        }
        
        self.locationString = loca
        self.methodString = "&method=\(met)"
    }



    func newDay(newDateSting:String){
        self.dateString = newDateSting
    }
    func newLocation(newLocationString:String){
        self.locationString = newLocationString
    }
    func newMethod(newMethodString:String){
        self.methodString = "&method=\(newMethodString)"
    }
    func getPayload() -> String{
        print(self.dateString+"?"+self.locationString+self.methodString)
        return self.dateString+"?"+self.locationString+self.methodString
        
    }
    
}
