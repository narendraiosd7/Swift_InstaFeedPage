//
//  PostCell.swift
//  Swift_Task1
//
//  Created by narendra.vadde on 28/05/21.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var profileImageStr: String?
    var postData = [String]()
    var currentPage = 0
    var profileNameStr: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func updateUI() {
        profileImage.image = UIImage(named: profileImageStr ?? "")
        profileName.text = profileNameStr
        collectionView.reloadData()
    }
}

extension PostCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageController.numberOfPages = postData.count
        pageController.isHidden = !(postData.count > 1)
        return postData.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.imageStr = postData[indexPath.row]
        cell.updateUI()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 350)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
