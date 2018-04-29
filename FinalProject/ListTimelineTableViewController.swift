//
//  ListTimelineTableViewController.swift
//  FinalProject
//
//  Created by Jess Newman on 4/26/18.
//  Copyright © 2018 Newman. All rights reserved.
//

import UIKit
import TwitterKit

class ListTimelineTableViewController: TWTRTimelineViewController {
    
    
    var teamName = "PittsburghPenguins"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passData()
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(leftSwipe)

        
    }
    
    func passData () {
        let dataSource = TWTRUserTimelineDataSource(screenName: "jessnewman919", apiClient: TWTRAPIClient())
        let client = TWTRAPIClient(userID: "jessnewman919")
        self.dataSource = TWTRListTimelineDataSource(listSlug: teamName, listOwnerScreenName: "jessnewman919", apiClient: client)
        
    }
    
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
            performSegue(withIdentifier: "ToSecondTeam", sender: self)
    }
}
