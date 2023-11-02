//
//  customClass.swift
//  AMFirstPage
//
//  Created by Lijin Benny on 26/10/23.
//

import Foundation
import UIKit
class countryCustomCell : UITableViewCell {
    
    @IBOutlet weak var customImage: UIImageView!
    @IBOutlet weak var customName: UILabel!
    @IBOutlet weak var checkListImage: UIImageView!
    
    var arrayobj: CountryViewController?
    
    override func awakeFromNib() {
           super.awakeFromNib()
           checkListImage.isHidden = true
       }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 22
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        let viewFrame = contentView.frame
        let cellFrame = viewFrame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
        contentView.frame = cellFrame
    }
    
    func fillCustomCell(imageIcon: String, imageTitle: String , checklist: String) {
        self.customImage.image = UIImage(named:imageIcon)
        self.customName.text = imageTitle
        self.checkListImage.image = UIImage(named:checklist)
    }
    
    func showSelectionIndicator() {
            checkListImage.isHidden = false
        }
    
    func hideSelectionIndicator() {
            checkListImage.isHidden = true
        }
}
