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
    private var algoData = AlgoProvider().all
    private let findData = FindFakeDataProvider()
    var reloadSections: ((_ section: Int) -> Void)?
    typealias VoidCompletion = () -> Void
    private var findCompletion: VoidCompletion?
    
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
        var vc: UIViewController?
        if let cell = tableView.cellForRow(at: indexPath) as? FeedTableViewCell, let name = cell.title.text {
            switch name {
            case "Array": vc = Initial.arrayViewController
            case "Set": vc = Initial.setViewController
            case "Dictionary": vc = Initial.dictionaryViewController
            case "SuffixArray": vc = Initial.suffixSequenceViewController
            default: vc = Initial.sessionSummaryVC

            }
        }
        
        if let vc = vc {
            Router.shared.routToDataStructures(vc: vc)
        }
    }
}

extension FeedViewModel: UISearchBarDelegate, UISearchResultsUpdating {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        guard let text = searchBar.text else { return }
        findData.updateSuffixArray()
        fakeData = findData.findDataByName(text)
        
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        fakeData = findData.findDataByName(text)
      
    }

}

