//
//  FavoriteViewController.swift
//  Sports App
//
//  Created by EsraaAbdelfatah on 5/6/23.
//

import UIKit
import CoreData
class FavoriteViewController: UIViewController, UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var favoritetable: UITableView!
    var favoriteList :[NSManagedObject]?
    
    override func viewWillAppear(_ animated: Bool) {

        favoriteList = FavouriteItems.favouriteItems.fetchFavouriteItems()
        favoritetable.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"favoriteCell" , for: indexPath) as? FavoriteTableViewCell
        let favoriteItem = favoriteList?[indexPath.row]
        let favoriteName = favoriteItem?.value(forKey: "favoriteName") as! String
        cell?.favoriteLabel.text = favoriteName
        print(favoriteName)
        
        return cell!
        
        
    }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let favoriteItem = favoriteList?[indexPath.row]
        let favoriteId = favoriteItem?.value(forKey: "favoriteId") as! Int
        let favoriteSport = favoriteItem?.value(forKey: "sportType") as! String
        let teamDeatails =  self.storyboard?.instantiateViewController(withIdentifier: "TeamDetails") as! TeamDetailsViewController

      switch favoriteSport {
      case "football":
          teamDeatails.team_key = favoriteId
          teamDeatails.sportType = favoriteSport
        
      case "tennis":
          teamDeatails.sportType = favoriteSport
          teamDeatails.team_key_tennis = favoriteId
        
      default:
          break
          
      }
      self.navigationController?.pushViewController(teamDeatails, animated:true)
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let favotiteItem = favoriteList?[indexPath.row]
       
        let alert = UIAlertController(title: "Delete", message: "Delete team from favorite list", preferredStyle: .actionSheet)
        
      
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive) {
                UIAlertAction in
            if editingStyle == UITableViewCell.EditingStyle.delete {
                FavouriteItems.favouriteItems.deleteItem(favouriteItem: favotiteItem!)
                self.favoriteList?.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
        
     
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
  
        self.present(alert, animated: true)

    }

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

 

}
