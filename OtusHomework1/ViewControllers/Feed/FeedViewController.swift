//
//  FeedViewController.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 24/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: PhoneTextField!
    @IBOutlet weak var searchBar: UISearchBar!
    
    fileprivate let viewModel = FeedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        searchBar.delegate = viewModel
        setupTableView()
    }
    
    private func setupTableView() {
        viewModel.reloadSections = { [weak self] (section: Int) in
            self?.tableView?.beginUpdates()
            self?.tableView?.reloadSections([section], with: .fade)
            self?.tableView?.endUpdates()
        }
        
        tableView?.separatorStyle = .none
        tableView?.dataSource = viewModel
        tableView?.delegate = viewModel
        tableView?.register(FeedTableViewCell.nib, forCellReuseIdentifier: FeedTableViewCell.identifier)
    }
}


