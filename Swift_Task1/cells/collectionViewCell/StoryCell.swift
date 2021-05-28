//
//  StoryCell.swift
//  Swift_Task1
//
//  Created by narendra.vadde on 28/05/21.
//

import UIKit

class StoryCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    var imageStr: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = contentView.frame.height/2
        image.layer.cornerRadius = image.frame.height/2
    }
    
    func updateUI() {
        image.image = UIImage(named: imageStr ?? "narendra")
    }
    
}
