//
//  HomeViewModel.swift
//  Swift_Task1
//
//  Created by narendra.vadde on 28/05/21.
//

import Foundation
import UIKit

class HomeViewModel {
    
    func getData() -> InstaData {
        guard let sourceURL = Bundle.main.url(forResource: "Feed", withExtension: "json") else {
            fatalError("Could not find Feed.json")
        }
        
        guard let feedData = try? Data(contentsOf: sourceURL) else {
            fatalError("Could not covert data")
        }
        
        guard let data = try? JSONDecoder().decode(InstaData.self, from: feedData) else {
            fatalError("There was a problem with decode the data...!")
        }
        
        return data
    }
    
}
