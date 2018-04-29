//
//  SecondTeamVC.swift
//  FinalProject
//
//  Created by Jess Newman on 4/27/18.
//  Copyright © 2018 Newman. All rights reserved.
//

import UIKit
import TwitterKit

class SecondTeamVC: TWTRTimelineViewController {
    
    var teamName = "WashingtonCapitals"

    override func viewDidLoad() {
        super.viewDidLoad()
        let dataSource = TWTRUserTimelineDataSource(screenName: "jessnewman919", apiClient: TWTRAPIClient())
        let client = TWTRAPIClient(userID: "jessnewman919")
        self.dataSource = TWTRListTimelineDataSource(listSlug: teamName, listOwnerScreenName: "jessnewman919", apiClient: client)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(rightSwipe)
        
        
    }
    
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "ToFirstTeam", sender: self)
    }

}
