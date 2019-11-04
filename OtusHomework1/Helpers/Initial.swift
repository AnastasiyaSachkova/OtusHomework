//
//  Initial.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 24/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

class Initial {

    //MARK: - Storyboards
    static var feedStoryboard: UIStoryboard {
        return UIStoryboard.init(name: "Feed", bundle: Bundle.main)
    }
    static var profileStoryboard: UIStoryboard {
        return UIStoryboard.init(name: "Profile", bundle: Bundle.main)
    }
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard.init(name: "Main", bundle: Bundle.main)
    }
    //MARK: - ViewControllers
    static var sessionSummaryVC: SessionSummaryViewController {
        return feedStoryboard.instantiateViewController(withIdentifier: "\(SessionSummaryViewController.self)") as! SessionSummaryViewController
    }
    
    static var profileVC: ProfileViewController {
        return profileStoryboard.instantiateViewController(withIdentifier: "\(ProfileViewController.self)") as! ProfileViewController
    }
    
    static var tabBarVC: TabBarViewController {
        return mainStoryboard.instantiateViewController(withIdentifier: "\(TabBarViewController.self)") as! TabBarViewController
    }
}
