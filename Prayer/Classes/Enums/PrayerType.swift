//
//  PrayerType.swift
//  Prayer
//
//  Created by Karim Hassan on 06/12/2021.
//

import Foundation
enum prayerType{
    case Fajr,Duhur,Asr,Maghrib,Isha
}
extension prayerType{
    init?(prayerIndex:Int){
        switch(prayerIndex){
        case 0: self = .Fajr
        case 1: self = .Duhur
        case 2: self = .Asr
        case 3: self = .Maghrib
        default:
            self = .Isha
        }
    }
}
