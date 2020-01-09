//
//  BachmarkViewModel.swift
//  OtusHomework1
//
//  Created by 7Winds on 24.10.2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import Foundation
import UIKit

class BenchmarkViewModel: NSObject {
    
    private var fakeDataProvider: FakeDataProvider = {
        if let service: FakeDataProvider = ServiceLocator.shared.getService() {
            return service
        } else {
            fatalError()
        }
    }()
    
  //  private var fakeData: [FakeData] = FakeDataProvider().loadFakeData()
    
    var reloadSections: ((_ section: Int) -> Void)?
    var timerModels = [IndexPath:TimerModel]()
    let layout = UICollectionViewFlowLayout()
    let gridLayout = CustomCollectionViewLayout()
    let stagLayout = StagLayout(
        widthHeightRatios: [(1.0, 1.0), (0.5, 0.5), (0.5, 1.5), (0.5, 1.0)],
        itemSpacing: 4
    )
}

extension BenchmarkViewModel: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fakeDataProvider.loadFakeData().count//fakeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BenchmarkCollectionViewCell.identifier, for: indexPath) as? BenchmarkCollectionViewCell
            else {
                return UICollectionViewCell()
        }
       // cell.set(data: fakeData[indexPath.row])
        cell.set(data: fakeDataProvider.loadFakeData()[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? BenchmarkCollectionViewCell else{ return }
        cell.setupTimer()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? BenchmarkCollectionViewCell else{ return }
        if let timerModel = timerModels[indexPath] {
            timerModel.delegate = cell
            cell.timer = timerModel
        }
        else{
            let timerModel = TimerModel()
            timerModel.delegate = cell
            timerModels[indexPath] = timerModel
            cell.timer = timerModel

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? BenchmarkCollectionViewCell else{ return }
        if let timerModel = timerModels[indexPath] {
            timerModel.delegate = cell
            cell.timer = timerModel
        }
//        else{
//            let timerModel = TimerModel()
//            timerModel.delegate = cell
//            timerModels[indexPath] = timerModel
//            cell.timer = timerModel
//
//        }
    }
}

extension BenchmarkViewModel: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width/4 - layout.minimumInteritemSpacing * 4
        return CGSize(width: width, height: width)
    }
}

extension BenchmarkViewModel: CustomCollectionViewDelegate {
    func numberOfItemsInCollectionView() -> Int {
        return fakeDataProvider.loadFakeData().count//fakeData.count
    }
}
