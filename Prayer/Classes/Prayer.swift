//
//  Prayer.swift
//  Prayer
//
//  Created by Karim Hassan on 06/12/2021.
//

import Foundation


class Prayer{
    private var _prayerName:prayerType!
    private var _startTime:String!
    private var _timePrayed:String!
    init(pName:prayerType,pStart:String){
        self._prayerName = pName
        self._startTime = pStart
    }
    var startTime:String{
        set{_startTime=newValue}
        get{return _startTime}
    }
    var timePrayed:String{
        set {_timePrayed=newValue}
        get{return _timePrayed}
    }
    var prayerName: prayerType{
        set {_prayerName=newValue}
        get{return _prayerName}
    }
    
}
