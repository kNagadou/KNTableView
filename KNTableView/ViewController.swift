//
//  ViewController.swift
//  KNTableView
//
//  Created by nagado-kazumasa on 2018/04/02.
//  Copyright © 2018年 nagado-kazumasa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var tableView: UITableView!
    private var mySearchController: UISearchController!
    private var topLayoutMarginConstraint: NSLayoutConstraint!
    
    private var detailVC: DetailViewController!
    
    private let detailVCAdditionalSafeAreaInsetsTop: CGFloat = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailVC = DetailViewController()
        
        self.tableView = UITableView(frame: .zero)
        self.view.addSubview(self.tableView)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.topLayoutMarginConstraint = NSLayoutConstraint(item: self.tableView,
                                                            attribute: .top,
                                                            relatedBy: .equal,
                                                            toItem: self.view,
                                                            attribute: .top,
                                                            multiplier: 1.0,
                                                            constant: 0.0)
        NSLayoutConstraint.activate([
            self.topLayoutMarginConstraint,
//            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
            ])
        
        if #available(iOS 11, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        }
        
        self.mySearchController = UISearchController(searchResultsController: nil)
        self.tableView.tableHeaderView = self.mySearchController.searchBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    @available(iOS 11.0, *)
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        // ChildViewController に additionalSafeAreaInsets を適用する
        let detailVCAdditionalSafeAreaInsets = UIEdgeInsetsMake(self.detailVCAdditionalSafeAreaInsetsTop,
                                                                0,
                                                                0,
                                                                0)
        self.detailVC.additionalSafeAreaInsets = detailVCAdditionalSafeAreaInsets
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if #available(iOS 11.0, *) {
            // ChildViewController に additionalSafeAreaInsets を適用する
            let detailVCAdditionalSafeAreaInsets = UIEdgeInsetsMake(16.0,
                                                                    0,
                                                                    0,
                                                                    0)
            self.detailVC.additionalSafeAreaInsets = detailVCAdditionalSafeAreaInsets
            // ScrollView の contentInset を調整する
            self.tableView.contentInset = UIEdgeInsetsMake(self.view.safeAreaInsets.top,
                                                           0,
                                                           self.view.safeAreaInsets.bottom,
                                                           0)
            self.tableView.scrollIndicatorInsets = self.tableView.contentInset
        } else {
//            self.topLayoutMarginConstraint.constant = 64
//            self.tableView.contentInset = UIEdgeInsets.zero
            
            self.topLayoutMarginConstraint.constant = 0
            self.tableView.contentInset = UIEdgeInsetsMake(self.topLayoutGuide.length,
                                         0,
                                         self.bottomLayoutGuide.length,
                                         0)

            self.tableView.scrollIndicatorInsets = self.tableView.contentInset
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "Light weight, baby!"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(self.detailVC, animated: true)
    }
    
}

