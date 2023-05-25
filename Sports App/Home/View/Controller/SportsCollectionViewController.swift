//
//  SportsCollectionViewController.swift
//  Sports App
//
//  Created by EsraaAbdelfatah on 5/1/23.
//

import UIKit
import Reachability
private let reuseIdentifier = "Cell"

class SportsCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout{
    
    var sportsArr=[Sports]()
    var flag : Int = 0
    let reachability = try! Reachability()
    override func viewDidLoad() {
        super.viewDidLoad()

    
        sportsArr.append(
          Sports(name: "Football",
                              image:UIImage(named: "foot")!))
        
          sportsArr.append(Sports(name: "Basketball",
                                  image: UIImage(named: "basketBall")!))
        
        sportsArr.append(Sports(name: "Cricket",
                                image:
                                UIImage(named: "Cricket")!))
        
        sportsArr.append(Sports(name: "Tennis",
                                image:
                                UIImage(named: "tennis")!))
    }



    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return sportsArr.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! SportsCollectionViewCell
        cell.layer.cornerRadius = 30
        cell.sportImage.layer.cornerRadius = 50
        let sport = sportsArr[indexPath.row]
        
        cell.setCell(name: sport.name, photo: sport.image)
        
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        flag = indexPath.row
        
        if (reachability.connection != .unavailable){
            
            let SportsTableViewController =  self.storyboard?.instantiateViewController(withIdentifier: "SportsTableViewController") as! SportsTableViewController
            SportsTableViewController.comfrom=flag
            self.navigationController?.pushViewController(SportsTableViewController, animated: true)
            
        }else {
            
            let alert = UIAlertController(title: "No Internet Connection", message: "Please check your connection and try again", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            
            present(alert, animated: true)
            
        }
    }
    
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        CGSize(width: self.view.frame.width * 0.493, height: self.view.frame.width * 0.49)
        
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 120, left: 1, bottom: 20, right: 1)
    }

    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }

    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability

        switch reachability.connection {
        case .wifi:
            print("Wifi Connection")
        case .cellular:
            print("Cellular Connection ")
        case .unavailable:
            print("No Connection")
        case .none:
            print("No Connection")
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
    }

}
