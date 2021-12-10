//
//  ApiBase.swift
//  Prayer
//
//  Created by Karim Hassan on 06/12/2021.
//

import Foundation


class PrayerAPI{
    
    
    // function to get the prayer times
    func getPrayerTimes(completion: @escaping (PrayerAPIResponse) -> Void) async{
        let urlString = "https://api.aladhan.com/v1/calendarByCity?city=London&country=dubai-ae&method=2&month=12&year=2021"
        do{
            guard let urll = URL(string: urlString) else { return  }
            let (data,_) = try await URLSession.shared.data(from: urll)
            do{
                let decoder = JSONDecoder()
                let prayerTimes = try decoder.decode(PrayerAPIResponse.self, from: data)
                print(prayerTimes.status)
                completion(prayerTimes)
            }catch{
                print(error)
            }

        }catch{
            print("error")
        }
        //        let session = URLSession.shared
        //        let task = session.dataTask(with: url!) { (data, response, error) in
        //            if error != nil{
        //                print(error!)
        //            }else{
        //                do{
        //                    let decoder = JSONDecoder()
        //                    let prayerTimes = try decoder.decode(PrayerAPIResponse.self, from: data!)
        //                    completion(prayerTimes)
        //                }catch{
        //                    print(error)
        //                }
        //            }
        //        }
        //        task.resume()
    }
}



