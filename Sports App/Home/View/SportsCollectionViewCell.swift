//
//  SportsCollectionViewCell.swift
//  Sports App
//
//  Created by EsraaAbdelfatah on 5/1/23.
//

import UIKit

class SportsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sportName: UILabel!
    @IBOutlet weak var sportImage: UIImageView!
    func setCell(name : String , photo : UIImage){
        
        sportImage.image = photo
        sportName.text = name
    }
}
