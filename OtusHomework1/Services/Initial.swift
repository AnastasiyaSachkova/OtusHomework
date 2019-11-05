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
        return UIStoryboard(name: "Feed", bundle: Bundle.main)
    }
    
    static var profileStoryboard: UIStoryboard {
        return UIStoryboard(name: "Profile", bundle: Bundle.main)
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static var dataStructuresStoryboard: UIStoryboard {
        return UIStoryboard(name: "DataStructures", bundle: nil)
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
    
    static var arrayViewController: ArrayViewController {
        return dataStructuresStoryboard.instantiateViewController(withIdentifier: "\(ArrayViewController.self)") as! ArrayViewController
    }
    
    static var setViewController: SetViewController {
        return dataStructuresStoryboard.instantiateViewController(withIdentifier: "\(SetViewController.self)") as! SetViewController
    }
    
    static var dictionaryViewController: DictionaryViewController {
        return dataStructuresStoryboard.instantiateViewController(withIdentifier: "\(DictionaryViewController.self)") as! DictionaryViewController
    }
    
    static var suffixSequenceViewController: SuffixSequenceViewController {
        return dataStructuresStoryboard.instantiateViewController(withIdentifier: "\(SuffixSequenceViewController.self)") as! SuffixSequenceViewController
    }
    
}
