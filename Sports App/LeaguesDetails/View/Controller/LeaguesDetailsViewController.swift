//
//  LeaguesDetailsViewController.swift
//  Sports App
//
//  Created by EsraaAbdelfatah on 5/4/23.
//

import UIKit

class LeaguesDetailsViewController: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    
    var index : Int = 0
    var legKey : Int = 0
    var fixture:Fixtures?
    var result:LatestRes?
    var teams :TeamDetails?
    var activityIndicator = UIActivityIndicatorView(style: .large)
    @IBOutlet weak var upComingCollection: UICollectionView!
    
    @IBOutlet weak var resultCollection: UICollectionView!
    
    @IBOutlet weak var teamsCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tabBarController?.tabBar.isHidden = true
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        let todayDate = Date()
        let calenderr = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let dateWeekAhead = calenderr.date(byAdding: .day, value: 7, to: todayDate)
        
        let today = dateFormatter.string(from: todayDate)
        let weekDate = dateFormatter.string(from: dateWeekAhead!)
        
        switch index {
            
        case 0 :
            let footBallApi = "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=9b7dc3a4611af9e06c93694221bbc8e320cdb7946e023a95e25e0352b3b54c85&from=\(today)&to=\(weekDate)&leagueId=\(legKey)"
            NetworkServices.fetchLeaguesDetails(apiLink:footBallApi ){ [weak self](result) in
                DispatchQueue.main.async {
        
                    self?.fixture = result
            
                   self?.upComingCollection.reloadData()
                    self?.resultCollection.reloadData()
                    self?.teamsCollection.reloadData()
                    self?.activityIndicator.stopAnimating()
                    print("football")
                }
            }
            let footballResultApi = "https://apiv2.allsportsapi.com/football/?met=Livescore&APIkey=9b7dc3a4611af9e06c93694221bbc8e320cdb7946e023a95e25e0352b3b54c85"
   
        
            NetworkServices.fetchResultDetails(apiLink:footballResultApi ){ [weak self](result) in
                DispatchQueue.main.async {
        
                    self?.result = result
                    self?.resultCollection.reloadData()
                    self?.activityIndicator.stopAnimating()
                    print("football result")
                    print(result?.result?.count ?? 0)
                }
            }
          let footUrl = "https://apiv2.allsportsapi.com/football/?met=Teams&leagueId=\(legKey)&APIkey=9b7dc3a4611af9e06c93694221bbc8e320cdb7946e023a95e25e0352b3b54c8"
            NetworkServices.fetchTeamDetails(apiLink:footUrl ){ [weak self](result) in
                DispatchQueue.main.async {

                    self?.teams = result
            
                    self?.teamsCollection.reloadData()
                    

                }
            }
        
        case 1:
            let BasketBallApi = "https://apiv2.allsportsapi.com/basketball/?met=Fixtures&APIkey=9b7dc3a4611af9e06c93694221bbc8e320cdb7946e023a95e25e0352b3b54c85&from=\(today)&to=\(weekDate)&leagueId=\(legKey)"
            NetworkServices.fetchLeaguesDetails(apiLink:BasketBallApi ){ [weak self](result) in
                DispatchQueue.main.async {
        
                    self?.fixture = result
            
                   self?.upComingCollection.reloadData()
                    self?.resultCollection.reloadData()
                    self?.teamsCollection.reloadData()
                    self?.activityIndicator.stopAnimating()
                    print("basketBall")
                    
                }
            }
            let basketBallResultApi = "https://apiv2.allsportsapi.com/basketball/?met=Livescore&APIkey=9b7dc3a4611af9e06c93694221bbc8e320cdb7946e023a95e25e0352b3b54c85"


            NetworkServices.fetchResultDetails(apiLink:basketBallResultApi ){ [weak self](result) in
                DispatchQueue.main.async {

                    self?.result = result
                    self?.resultCollection.reloadData()
                    self?.activityIndicator.stopAnimating()
                    print("basketBal result")
                    print(result?.result?.count ?? 0)
                }
            }
          
        case 2:
            let CricketApi = "https://apiv2.allsportsapi.com/cricket/?met=Fixtures&APIkey=9b7dc3a4611af9e06c93694221bbc8e320cdb7946e023a95e25e0352b3b54c85&from=\(today)&to=\(weekDate)"
            NetworkServices.fetchLeaguesDetails(apiLink:CricketApi ){ [weak self](result) in
                DispatchQueue.main.async {
        
                    self?.fixture = result
            
                   self?.upComingCollection.reloadData()
                    self?.resultCollection.reloadData()
                    self?.teamsCollection.reloadData()
                    self?.activityIndicator.stopAnimating()
                    
                }
            }
            let CricketResultApi = "https://apiv2.allsportsapi.com/cricket/?met=Livescore&APIkey=9b7dc3a4611af9e06c93694221bbc8e320cdb7946e023a95e25e0352b3b54c85"


            NetworkServices.fetchResultDetails(apiLink:CricketResultApi ){ [weak self](result) in
                DispatchQueue.main.async {

                    self?.result = result
                    self?.resultCollection.reloadData()
                    self?.activityIndicator.stopAnimating()
                    print("Cricet result")
                    print(result?.result?.count ?? 0)
                }
            }
        case 3:
            let Tennis = "https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=9b7dc3a4611af9e06c93694221bbc8e320cdb7946e023a95e25e0352b3b54c85&from=\(today)&to=\(weekDate)"
            NetworkServices.fetchLeaguesDetails(apiLink:Tennis ){ [weak self](result) in
                DispatchQueue.main.async {
        
                    self?.fixture = result
            
                   self?.upComingCollection.reloadData()
                    self?.resultCollection.reloadData()
                    self?.teamsCollection.reloadData()
                    self?.activityIndicator.stopAnimating()
                    
                }
            }
            let TennisResultApi = "https://apiv2.allsportsapi.com/tennis/?met=Livescore&APIkey=9b7dc3a4611af9e06c93694221bbc8e320cdb7946e023a95e25e0352b3b54c85"


            NetworkServices.fetchResultDetails(apiLink:TennisResultApi ){ [weak self](result) in
                DispatchQueue.main.async {

                    self?.result = result
                    self?.resultCollection.reloadData()
                    self?.activityIndicator.stopAnimating()
                    print("basketBal result")
                    print(result?.result?.count ?? 0)
                }
            }
        
        default:
            
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView == resultCollection){
           
            return result?.result?.count ?? 0
           
        }
        if(collectionView == teamsCollection){
            return fixture?.result?.count ?? 0
        }
        
        return fixture?.result?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == teamsCollection){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as! TeamsCollectionViewCell
            cell.layer.cornerRadius = 30
            switch index{

            case 0:
                cell.teamsImge.sd_setImage(with:URL(string:fixture?.result?[indexPath.row].home_team_logo ?? "")
                                           , placeholderImage: UIImage(named: "foot"))
                cell.teamsImge.layer.cornerRadius = 30
            case 1:
                cell.teamsImge.sd_setImage(with:URL(string:fixture?.result?[indexPath.row].event_home_team_logo  ?? "")
                                           , placeholderImage: UIImage(named: "basketBall"))
                cell.teamsImge.layer.cornerRadius = 30
            case 2:
                cell.teamsImge.sd_setImage(with:URL(string:fixture?.result?[indexPath.row].event_home_team_logo  ?? "")
                                           , placeholderImage: UIImage(named: "Cricket"))
                cell.teamsImge.layer.cornerRadius = 30
            case 3:
                
                cell.teamsImge.sd_setImage(with:URL(string:fixture?.result?[indexPath.row].event_first_player_logo  ?? "")
                                           , placeholderImage: UIImage(named: "tennis"))
                cell.teamsImge.layer.cornerRadius = 30
            default :
               
                break
            }
            return cell
        }
        
        
        
        if (collectionView == resultCollection){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as! resultCollectionViewCell
            let team = result?.result?[indexPath.row ]
            cell.layer.borderWidth = 0.3
            switch index{
            case 0:
                
                cell.resultData(nameOne: (team?.event_home_team)!, nameTwo: (team?.event_away_team)!, imgeOne: "", imgeTwo: "", eventTime: (team?.event_final_result)!)
                cell.firstImge.layer.cornerRadius = 30
                cell.firstImge.layer.borderColor = UIColor.gray.cgColor
                let urlHome = URL(string: (team?.home_team_logo) ?? "")
                let urlAway = URL(string: (team?.away_team_logo) ?? "")
                cell.firstImge.sd_setImage(with:urlHome
                , placeholderImage: UIImage(named: "foot"))
                cell.secondImage.sd_setImage(with:urlAway
                , placeholderImage: UIImage(named: "foot"))
            case 1:
             
                cell.resultData(nameOne: (team?.event_home_team)!, nameTwo: (team?.event_away_team)!, imgeOne: "", imgeTwo: "", eventTime: (team?.event_final_result)!)

                let urlHome = URL(string: (team?.home_team_logo) ?? "")
                let urlAway = URL(string: (team?.away_team_logo) ?? "")
                cell.firstImge.sd_setImage(with:urlHome
                , placeholderImage: UIImage(named: "basketBall"))
                cell.secondImage.sd_setImage(with:urlAway
                , placeholderImage: UIImage(named: "basketBall"))
            case 2:
                //Crictet
                cell.resultData(nameOne: (team?.event_home_team)!, nameTwo: (team?.event_away_team)!, imgeOne: "", imgeTwo: "", eventTime: (team?.event_final_result) ?? "0 - 0")

                let urlHome = URL(string: (team?.home_team_logo) ?? "")
                let urlAway = URL(string: (team?.away_team_logo) ?? "")
                cell.firstImge.sd_setImage(with:urlHome
                , placeholderImage: UIImage(named: "Cricket"))
                cell.secondImage.sd_setImage(with:urlAway
                , placeholderImage: UIImage(named: "Cricket"))
                
            case 3:
                //tennis
                cell.resultData(nameOne: (team?.event_first_player)!, nameTwo: (team?.event_second_player)!, imgeOne: "", imgeTwo: "", eventTime: (team?.event_final_result) ?? "0 - 0")

                let urlHome = URL(string: (team?.event_first_player_logo) ?? "")
                let urlAway = URL(string: (team?.event_second_player_logo) ?? "")
                cell.firstImge.sd_setImage(with:urlHome
                , placeholderImage: UIImage(named: "tennis"))
                cell.secondImage.sd_setImage(with:urlAway
                , placeholderImage: UIImage(named: "tennis"))
                
            
            default :
               
                break
            }
            
            return cell
        }
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComingCell", for: indexPath) as! UpComingCollectionViewCell
        let team = fixture?.result?[indexPath.row]
    
        cell.layer.borderWidth = 0.25
        switch index {
        case 0 :
            
            cell.fillData(nameOne: (team?.event_away_team)!
                          , nameTwo:(team?.event_home_team)! , eventDate: (team?.event_date)!, imgeOne: (team?.away_team_logo)!, imgeTwo: (team?.home_team_logo)!, eventTime:(team?.event_time)!)
        case 1:
          
            cell.fillData(nameOne: (team?.event_home_team)!
                          , nameTwo:(team?.event_away_team)! , eventDate: (team?.event_date)!, imgeOne: (""), imgeTwo: (""), eventTime:(team?.event_time)!)
            let urlHome = URL(string: (team?.home_team_logo) ?? "")
            let urlAway = URL(string: (team?.away_team_logo) ?? "")
            cell.firstImage.sd_setImage(with:urlHome
            , placeholderImage: UIImage(named: "basketBall"))
            cell.secondimage.sd_setImage(with:urlAway
            , placeholderImage: UIImage(named: "basketBall"))
            
        case 2:
          
            let urlHome = URL(string: (team?.home_team_logo) ?? "")
            let urlAway = URL(string: (team?.away_team_logo) ?? "")
            cell.fillData(nameOne: (team?.event_home_team)!
                          , nameTwo:(team?.event_away_team)! , eventDate: (team?.event_date_start)!, imgeOne: "", imgeTwo: "", eventTime:(team?.event_time)!)
            cell.firstImage.sd_setImage(with:urlHome
            , placeholderImage: UIImage(named: "Cricket"))
            cell.secondimage.sd_setImage(with:urlAway
            , placeholderImage: UIImage(named: "Cricket"))
            
        case 3:
        
            cell.fillData(nameOne: (team?.event_first_player)!
                          , nameTwo:(team?.event_second_player)! , eventDate: (team?.event_date)! , imgeOne: "", imgeTwo: "", eventTime:(team?.event_time)!)
            let urlHome = URL(string: (team?.event_first_player_logo) ?? "tennis")
            cell.firstImage.sd_setImage(with:urlHome
            , placeholderImage: UIImage(named: "tennis"))
            let urlAway = URL(string: (team?.event_second_player_logo) ?? "tennis")
            cell.secondimage.sd_setImage(with:urlAway
            , placeholderImage: UIImage(named: "tennis"))
            
        default :
           
            break
        }
        return cell
          }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView ==  teamsCollection{
            return CGSize(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height)
        }
      
        return CGSize(width: UIScreen.main.bounds.width - 25, height: UIScreen.main.bounds.height)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if collectionView == upComingCollection{
//            return UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 5)
//        }
//
//        return UIEdgeInsets(top: 3, left: 5, bottom: 1, right: 1)
//    }
////
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(collectionView == teamsCollection){
            let storyBoard = self.storyboard?.instantiateViewController(withIdentifier: "TeamDetails") as! TeamDetailsViewController
            
            storyBoard.team_key_tennis = fixture?.result?[indexPath.row].first_player_key
            

            storyBoard.team_key = fixture?.result?[indexPath.row].home_team_key
            
           
            switch index {
            
            case 0 :
     
                storyBoard.sportType = "football"
                storyBoard.teamIndex = 0
                self.navigationController?.pushViewController(storyBoard, animated: true)
                
            case 1 :
                storyBoard.sportType = "basketball"
                storyBoard.teamIndex = 1
                showAlert()
                
            case 2 :
                storyBoard.sportType = "cricket"
                storyBoard.teamIndex = 2
                showAlert()
            case 3 :
                storyBoard.sportType = "tennis"
                storyBoard.teamIndex = 3
                self.navigationController?.pushViewController(storyBoard, animated: true)
            default:
                break
            }
            
    }
    
    }
    func showAlert(){
       
        let alert = UIAlertController(title: "⚠️", message: "missing data event", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "go back", style: UIAlertAction.Style.cancel , handler: { action in
            print("Cancel clicked")
            self.navigationController?.popViewController(animated: true)
        }))
        
        self.present(alert, animated: true) {
            print("alert done")
        }
    }

}
