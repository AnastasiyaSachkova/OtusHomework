//
//  FeedViewModel.swift
//  OtusHomework1
//
//  Created by 7Winds on 24.10.2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

class FeedViewModel: NSObject {
    
private var fakeData: [FakeData] = FakeDataProvider().loadFakeData()
var reloadSections: ((_ section: Int) -> Void)?
    
}

extension FeedViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fakeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell
            else {
                return UITableViewCell()
        }
        cell.set(data: fakeData[indexPath.row], color: UIColor.random)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = Initial.sessionSummaryVC
//        vc.title = fakeData[indexPath.row].name
//        navigationController?.pushViewController(vc, animated: true)
    }
}

