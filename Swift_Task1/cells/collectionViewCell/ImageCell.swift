//
//  ImageCell.swift
//  Swift_Task1
//
//  Created by narendra.vadde on 28/05/21.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    var imageStr: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateUI() {
        image.image = UIImage(named: imageStr ?? "narendra")
    }
}
