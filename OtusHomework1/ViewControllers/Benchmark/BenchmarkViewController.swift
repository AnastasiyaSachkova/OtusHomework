//
//  BenchmarkViewController.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 24/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import UIKit

final class BenchmarkViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var changeLayoutBtn: UIButton!

    private var isGrid = true
    fileprivate let viewModel = BenchmarkViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        for timer in viewModel.timerModels {
            guard let cell = collectionView.cellForItem(at: timer.key) as? BenchmarkCollectionViewCell else{ return }
            cell.removeTimer()
        }
        collectionView.reloadData()
    }
    
    @IBAction func changeLayout(_ sender: Any) {
        isGrid.toggle()
        if isGrid {
            viewModel.gridLayout.delegate = viewModel
            collectionView.setCollectionViewLayout(viewModel.gridLayout, animated: true)
        } else {
            collectionView.setCollectionViewLayout(viewModel.stagLayout, animated: true)
        }
    }
    
    private func setupCollectionView() {
        viewModel.reloadSections = { [weak self] (section: Int) in
            self?.collectionView?.reloadSections([section])
        }
        
        collectionView?.dataSource = viewModel
        collectionView?.delegate = viewModel
        collectionView?.register(BenchmarkCollectionViewCell.nib, forCellWithReuseIdentifier: BenchmarkCollectionViewCell.identifier)
        viewModel.layout.minimumLineSpacing = 5
        viewModel.layout.minimumInteritemSpacing = 5
    }
}
