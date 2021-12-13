//
//  Prayer.swift
//  Prayer
//
//  Created by Karim Hassan on 06/12/2021.
//

import Foundation
import SwiftUI


class Prayer:Identifiable{
    private var _prayerName:prayerType!
    private var _startTime:String!
    private var _timePrayed:String!
    private var name:String!
    public var Color:Color!
    init(pName:prayerType,pStart:String){
        self._prayerName = pName
        self._startTime = pStart
        self.name = setPrayerName(type:pName)
        let col = SwiftUI.Color(SwiftUI.Color.RGBColorSpace.sRGB, red: 0.99, green: 0.13, blue: 0.11, opacity:  0.3)
        self.Color = col
    }
    
    func setPrayerName(type:prayerType)-> String{
        switch type {
        case .Fajr:
            return "Fajr"
        case .Duhur:
            return "Duhur"
        case .Asr:
            return "Asr"
        case .Maghrib:
            return "Maghrib"
        case .Isha:
            return "Isha"
        }
    }
    func getPrayerName()->String{
        return self.name
    }
    
    var startTime:String{
        set{_startTime=newValue}
        get{return _startTime}
    }
    var timePrayed:String{
        set {_timePrayed=newValue}
        get{return _timePrayed ?? "N/A"}
    }
    var prayerName: prayerType{
        set {
            _prayerName=newValue
            self.Color = .blue
            print("hu")
        }
        get{return _prayerName}
    }
    
}
