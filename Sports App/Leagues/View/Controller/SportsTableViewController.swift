//
//  SportsTableViewController.swift
//  Sports App
//
//  Created by EsraaAbdelfatah on 5/1/23.
//

import UIKit
import SDWebImage
class SportsTableViewController: UITableViewController {
    @IBOutlet var uiTableView: UITableView!
    
    var activityIndicator = UIActivityIndicatorView(style: .large)
    var comfrom:Int=0
    var leaguesArr:Leagues?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        switch comfrom {
            
        case 0 :
            self.title = "Football leagues"
            NetworkServices.fetchLeagues(apiLink:NetworkServices.sportsApi.Football.rawValue ){ [weak self](result) in
                DispatchQueue.main.async {
        
                    self?.leaguesArr = result
            
                   self?.uiTableView.reloadData()
                    self?.activityIndicator.stopAnimating()
                }
                
            }
        case 1:
            self.title = "Basketball leagues"
            NetworkServices.fetchLeagues(apiLink:NetworkServices.sportsApi.Basketball.rawValue ){ [weak self](result) in
                DispatchQueue.main.async {
        
                    self?.leaguesArr = result
                   self?.uiTableView.reloadData()
                    print(self?.leaguesArr?.result?.count ?? 0)
                    self?.activityIndicator.stopAnimating()
                }
                
            }
        case 2:
            self.title = "Cricket leagues"
            NetworkServices.fetchLeagues(apiLink:NetworkServices.sportsApi.Cricket.rawValue ){ [weak self](result) in
                DispatchQueue.main.async {
        
                    self?.leaguesArr = result
                   self?.uiTableView.reloadData()
                    self?.activityIndicator.stopAnimating()
                }
                
            }
        case 3:
            self.title = "Tennis leagues"
            NetworkServices.fetchLeagues(apiLink:NetworkServices.sportsApi.Tennis.rawValue ){ [weak self](result) in
                DispatchQueue.main.async {
        
                    self?.leaguesArr = result
                   self?.uiTableView.reloadData()
                    self?.activityIndicator.stopAnimating()
                }
                
            }
        default:
            break
        }
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return leaguesArr?.result?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sportsCell", for: indexPath) as! LeaguesTableViewCell
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.masksToBounds = true
       
       
        cell.leaguesName.text = leaguesArr?.result?[indexPath.row].league_name
        switch comfrom {

        case 0 :
            cell.leagueImge.sd_setImage(with: URL(string: leaguesArr?.result?[indexPath.row].league_logo ?? ""), placeholderImage: UIImage(named: "foot"))
        case 1:
            cell.leagueImge.sd_setImage(with: URL(string: leaguesArr?.result?[indexPath.row].league_logo ?? ""), placeholderImage: UIImage(named: "basketBall"))
        case 2:
            cell.leagueImge.sd_setImage(with: URL(string: leaguesArr?.result?[indexPath.row].league_logo ?? ""), placeholderImage: UIImage(named: "Cricket"))
        case 3:
            cell.leagueImge.sd_setImage(with: URL(string: leaguesArr?.result?[indexPath.row].league_logo ?? ""), placeholderImage: UIImage(named: "tennis"))
        default:
            cell.leagueImge.sd_setImage(with: URL(string: leaguesArr?.result?[indexPath.row].league_logo ?? ""), placeholderImage: UIImage(named: "tennis"))
            break
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let leaguesDetails = self.storyboard?.instantiateViewController(withIdentifier: "LeaguesDetails") as! LeaguesDetailsViewController
        
        switch comfrom
        {
            
        case 0 :
            leaguesDetails.index = 0
            leaguesDetails.legKey = leaguesArr?.result?[indexPath.row].league_key ?? 0
        case 1:
            leaguesDetails.index = 1
            leaguesDetails.legKey = leaguesArr?.result?[indexPath.row].league_key ?? 0
        case 2:
            leaguesDetails.index = 2
            leaguesDetails.legKey = leaguesArr?.result?[indexPath.row].league_key ?? 0
        case 3:
            leaguesDetails.index = 3
           
        default:
            break
        }
        self.navigationController?.pushViewController(leaguesDetails, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableView.bounds.height / 6.3
    }

}
