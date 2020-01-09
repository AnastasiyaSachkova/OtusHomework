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
    //private let findData = FindFakeDataProvider()
    var reloadSections: ((_ section: Int) -> Void)?
    typealias VoidCompletion = () -> Void
    private var findCompletion: VoidCompletion?
    private var testResult: [String : Double]?
    private var testTime: Double?
    
    private var findFakeDataProvider: FindFakeDataProvider = {
        if let service: FindFakeDataProvider = ServiceLocator.shared.getService() {
            return service
            }
//        else {
//            fatalError()
//        }
//
        return FindFakeDataProvider()
    }()
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

extension FeedViewModel  {
    @objc func startTest(){
        let sheduler = Sheduler()
        let count = 10000
        let queueSuffixArray = JobQueue(jobs: [{
            _ = SuffixArrayManipulator().setupWithObjectCount(count/10)
            }])
        sheduler.addJobQueue(queue: queueSuffixArray, nameQueue: "SuffixArray")



        let queueSwiftArray = JobQueue(jobs: [{
            _ = SwiftArrayManipulator().setupWithObjectCount(count)
            }])
        sheduler.addJobQueue(queue: queueSwiftArray, nameQueue: "Array")


//        let queueDictionary = JobQueue(jobs: [{
//            _ = SwiftDictionaryManipulator().setupWithEntryCount(count)
//            }])
//        sheduler.addJobQueue(queue: queueDictionary, nameQueue: "Dictionary")
//
//
//        let queueSet = JobQueue(jobs: [{
//            _ = SwiftSetManipulator().setupWithObjectCount(count)
//            }])
//        sheduler.addJobQueue(queue: queueSet, nameQueue: "Set")

        sheduler.start(){
            self.testResult = sheduler.getResult()
            self.testTime = sheduler.timeOfWork
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension FeedViewModel: UISearchBarDelegate, UISearchResultsUpdating {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        guard let text = searchBar.text else { return }
        findFakeDataProvider.updateSuffixArray()
        fakeData = findFakeDataProvider.findDataByName(text)
        //findData.updateSuffixArray()
        //fakeData = findData.findDataByName(text)
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        fakeData = findFakeDataProvider.findDataByName(text)
        //fakeData = findData.findDataByName(text)
    }

}

