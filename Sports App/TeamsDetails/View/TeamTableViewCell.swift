//
//  TeamTableViewCell.swift
//  Sports App
//
//  Created by EsraaAbdelfatah on 5/5/23.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    @IBOutlet weak var playerNamber: UILabel!
    @IBOutlet weak var playerAge: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 30
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
