//
//  ApiBase.swift
//  Prayer
//
//  Created by Karim Hassan on 06/12/2021.
//

import Foundation


class PrayerAPI{
    
    let baseUrl:String
    init(){
        self.baseUrl = "https://api.aladhan.com/v1/"
    }
    
    // function to get the prayer times
    func getPrayerTimes(completion: @escaping (Timings) -> Void) async{
        let urlString = self.baseUrl+"timingsByCity?city=Dubai&country=United%20Arab%20Emirates&method=8"
        do{
            guard let urll = URL(string: urlString) else { return  }
            let (data,_) = try await URLSession.shared.data(from: urll)
            do{
                let decoder = JSONDecoder()
                let prayerTimes = try decoder.decode(PrayerAPIResponse.self, from: data)
                print(prayerTimes.data.timings)
                completion(prayerTimes.data.timings)
            }catch{
                print(error)
            }

        }catch{
            print("error")
        }
    }
    
    func getPrayerWithForumlatedPayload(payload:String, completion: @escaping (Timings) ->Void) async{
        print("loaded \(payload)")
        let urlString = self.baseUrl+"timings/"+payload
        do{
            guard let getUrl = URL(string: urlString) else {return}
            let (data,_) = try await URLSession.shared.data(from: getUrl)
            do{
                let decoder = JSONDecoder()
                let prayerTimes = try decoder.decode(PrayerAPIResponse.self,from: data)
                completion(prayerTimes.data.timings)
            }catch{
                print(error)
            }
        }catch{
            print(error)
        }
    }
}



