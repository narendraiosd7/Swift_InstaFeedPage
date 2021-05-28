//
//  ViewController.swift
//  Swift_Task1
//
//  Created by narendra.vadde on 28/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionVew: UICollectionView!
    
    var stories = [String]()
    var postData = [User]()
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        collectionVew.dataSource = self
        collectionVew.delegate = self
        getStories()
    }
    
    func getStories() {
        let data = viewModel.getData()
        if let stories = data.stories {
            self.stories = stories
        }
        if let userData = data.users {
            self.postData = userData
        }
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegateFlowLayout {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.profileImageStr = postData[indexPath.row].profilePicture
        cell.profileNameStr = postData[indexPath.row].profileName
        if let imageData = postData[indexPath.row].post {
            cell.postData = imageData
        }
        cell.updateUI()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
        cell.imageStr = stories[indexPath.row]
        cell.updateUI()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 40)
    }
}



