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


    //function to get current date in string format
func getDate() -> String{
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: date)
}

}
