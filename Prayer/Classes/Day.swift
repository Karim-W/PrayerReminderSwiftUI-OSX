import Foundation


class Day{
    private var date:String?
    private var prayers:[Prayer]?
    init(date:String,listOfPrayers:[String]){
        self.date = date
        var prayersArr : [Prayer] = []
        for (index,item) in listOfPrayers.enumerated() {
            prayersArr.append(Prayer(pName: prayerType(prayerIndex: index) ?? prayerType.Isha, pStart: item))
        }
        self.prayers = prayersArr
    }
    init(){
        self.date = getDate()
    }
    func setPrayersOfTheDay(prayerArr:[Prayer]){
        self.prayers = prayerArr
    }
    
    func getPrayerTimes()->[Prayer]{
        return prayers!
    }
    
    func logPrayed(prayerName:prayerType){
        let index = self.prayers?.firstIndex(where: { p in
            p.prayerName == prayerName
        })
        
        if(self.prayers![index!].timePrayed == "N/A"){
            self.prayers![index!].timePrayed = String(Date().timeIntervalSince1970)
            self.prayers![index!].Color = .blue
        }
    }

    //function to get current date in string format
func getDate() -> String{
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: date)
}

}
