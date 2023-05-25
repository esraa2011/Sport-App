//
//  TeamDetailsViewmodel.swift
//  Sports App
//
//  Created by EsraaAbdelfatah on 5/8/23.
//

import Foundation
class TeamDetailsViewModel{
    
   
    
    var fetchTeamDetailsToViewController : (()->())={}
    
    var fetchTennisPlayersDetailsToViewController : (()->())={}
    
    var fetchTeamDetails:TeamDetails!{
        didSet{
            fetchTeamDetailsToViewController()
        }
    }
    var fetchTennisPlayersDetails:TennisPlayer!{
        didSet{
            fetchTennisPlayersDetailsToViewController()
        }
    }
    
    
    func fetchTeamDetails(apiLink :String){
        NetworkServices.fetchTeamDetails(apiLink: apiLink) { res in
            guard let result = res else {return}
            self.fetchTeamDetails = result
            
            
        }
    }
    func fetchTennisPlayersDetails(apiLink :String){
        NetworkServices.fetchTennisPlayersDetails(apiLink: apiLink) { res in
            guard let result = res else {return}
            self.fetchTennisPlayersDetails = result
            
            
        }
    }
}
