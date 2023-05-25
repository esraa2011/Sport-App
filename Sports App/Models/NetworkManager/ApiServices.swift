//
//  ApiServices.swift
//  Sports App
//
//  Created by EsraaAbdelfatah on 5/3/23.
//

import Foundation

protocol NetworkServicesProtocol {
    static func fetchLeagues(apiLink : String,compilitionHandler : @escaping (Leagues?)-> Void)
}
class NetworkServices : NetworkServicesProtocol{
    static func fetchLeagues(apiLink : String,compilitionHandler : @escaping (Leagues?)-> Void){
        let url = URL(string: "\(apiLink)")
        guard let newUrl = url else {
            return
        }
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data,response , error in
            do{
                let result = try JSONDecoder().decode(Leagues.self, from: data!)
                compilitionHandler(result)
            }catch let error{
                print(error.localizedDescription)
                compilitionHandler(nil)
            }
            
        }
        task.resume()
        
    }
    enum sportsApi : String {
        
        case Football = "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=9b7dc3a4611af9e06c93694221bbc8e320cdb7946e023a95e25e0352b3b54c85"
        case Basketball = "https://apiv2.allsportsapi.com/basketball/?met=Leagues&APIkey=9b7dc3a4611af9e06c93694221bbc8e320cdb7946e023a95e25e0352b3b54c85"
        case Cricket = "https://apiv2.allsportsapi.com/cricket/?met=Leagues&APIkey=9b7dc3a4611af9e06c93694221bbc8e320cdb7946e023a95e25e0352b3b54c85"
        case Tennis = "https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=9b7dc3a4611af9e06c93694221bbc8e320cdb7946e023a95e25e0352b3b54c85"
        
    }
    
}
