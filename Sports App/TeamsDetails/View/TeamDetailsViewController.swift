//
//  TeamDetailsViewController.swift
//  Sports App
//
//  Created by EsraaAbdelfatah on 5/5/23.
//

import UIKit
import SDWebImage
class TeamDetailsViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
 
    
    
    @IBOutlet weak var teamImge: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamTable: UITableView!
    var teamIndex = 0
    var sportType = ""
    var team_key:Int?
    var team_key_tennis:Int?
    var team :TeamDetails?
    var tennisPlayer: TennisPlayer?
    var viewModel:TeamDetailsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TeamDetailsViewModel()
        switch sportType{
            
        case "football":
            let API_URL = "https://apiv2.allsportsapi.com/\(sportType)/?&met=Teams&teamId=\(team_key ?? 0)&APIkey=9b7dc3a4611af9e06c93694221bbc8e320cdb7946e023a95e25e0352b3b54c85"
            
            viewModel?.fetchTeamDetails(apiLink:API_URL )
            
            viewModel?.fetchTeamDetailsToViewController = {() in
                DispatchQueue.main.async {
                  
                    self.team = self.viewModel?.fetchTeamDetails
                    self.teamImge.sd_setImage(with: URL(string:self.team?.result.first?.team_logo ?? ""), placeholderImage: UIImage(named: "foot"))
                    self.teamName.text = self.team?.result.first?.team_name
                    self.teamTable.reloadData()
                    print("football team in deatails")
                   
                }
            }
            
            /*
            NetworkServices.fetchTeamDetails(apiLink:API_URL ){ [weak self](result) in
                DispatchQueue.main.async {
                    self?.team = result
                    self?.teamImge.sd_setImage(with: URL(string:self?.team?.result.first?.team_logo ?? ""), placeholderImage: UIImage(named: "foot"))
                    self?.teamName.text = self?.team?.result.first?.team_name
                    self?.teamTable.reloadData()
                    print("football team in deatails")

                }
            }
            
            */
        case "tennis":
            
            let API_URL = "https://apiv2.allsportsapi.com/\(sportType)/?met=Players&playerId=\(team_key_tennis ?? 0)&APIkey=9b7dc3a4611af9e06c93694221bbc8e320cdb7946e023a95e25e0352b3b54c85"
            
            
            viewModel?.fetchTennisPlayersDetails(apiLink:API_URL )
            
            viewModel?.fetchTennisPlayersDetailsToViewController = {() in
                DispatchQueue.main.async {
                  
                    
                    
                    self.tennisPlayer = self.viewModel?.fetchTennisPlayersDetails
                    self.teamImge.image = UIImage(named: "tennis")
                    self.teamName.text = self.tennisPlayer?.result?[0].player_name
                    self.teamTable.reloadData()
                   
                    print("tennis team in deatails \(self.tennisPlayer?.result?[0].player_name ?? "" )")
                    
               
                }
            }
            
            /*
            NetworkServices.fetchTennisPlayersDetails(apiLink:API_URL ){ [weak self](result) in
                DispatchQueue.main.async {
                    self?.tennisPlayer = result
                    self?.teamImge.image = UIImage(named: "tennis")
                    self?.teamName.text = self?.tennisPlayer?.result?[0].player_name
                    self?.teamTable.reloadData()
                   
                    print("tennis team in deatails \(self?.tennisPlayer?.result?[0].player_name ?? "" )")

                }
            }
             */
        default :
            break
        }
            
     
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sportType == "tennis"{
            return  1
        }
       
        return team?.result[0].players.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamDetailsCell", for: indexPath) as! TeamTableViewCell
        switch sportType{
        case "tennis":
           
            cell.playerName.text = tennisPlayer?.result?[0].player_country
            cell.playerAge.text = tennisPlayer?.result?[0].player_bday
            cell.playerNamber.text = ""
            
        case "football":
            cell.playerAge.text = team?.result[0].players[indexPath.row].player_age
            cell.playerName.text = team?.result[0].players[indexPath.row].player_name
            cell.playerNamber.text = team?.result[0].players[indexPath.row].player_number
            cell.playerImage.sd_setImage(with:URL(string:team?.result[0].players[indexPath.row].player_image ?? ""), placeholderImage: UIImage(named: "foot")!)
        default:
            break
        }
        return cell
    }

    @IBAction func favButton(_ sender: Any) {
        let name = teamName.text
        switch sportType
        {
        case "football":
            FavouriteItems.favouriteItems.InsertItem(favouriteName: name ?? "", favouriteId: team_key ?? 0, sportType: sportType )
        case "tennis":
            FavouriteItems.favouriteItems.InsertItem(favouriteName: name ?? "", favouriteId: team_key_tennis ?? 0, sportType: sportType )
        default:
            break
        }
        
       
    }
    

}
