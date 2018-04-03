//
//  DetailViewController.swift
//  KNTableView
//
//  Created by nagado-kazumasa on 2018/04/03.
//  Copyright © 2018年 nagado-kazumasa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    private var label: UILabel!
    private var scrollView: UIScrollView!
    
    private var additionalScrollViewContentInsetTop: CGFloat = 0.0
    
    init(additionalScrollViewContentInsetTop: CGFloat) {
        self.additionalScrollViewContentInsetTop = additionalScrollViewContentInsetTop
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView = UIScrollView(frame: .zero)
        self.view.addSubview(self.scrollView)
        
        self.scrollView.backgroundColor = UIColor.white
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
        
        
        self.label = UILabel(frame: .zero)
        self.scrollView.addSubview(self.label)
        
        self.label.text = "Yeah! Buddy!"
        self.label.textAlignment = .center

        self.label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.label,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: self.scrollView,
                               attribute: .centerX,
                               multiplier: 1.0,
                               constant: 0.0),
            self.label.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.label.heightAnchor.constraint(equalToConstant: 40.0),
            self.label.widthAnchor.constraint(equalToConstant: 160.0)
            ])
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if #available(iOS 11.0, *) {
          // do nothing
        } else {
            let contentInset = UIEdgeInsetsMake(self.topLayoutGuide.length + self.additionalScrollViewContentInsetTop,
                                                0,
                                                self.bottomLayoutGuide.length,
                                                0)
            self.scrollView.contentInset = contentInset
            self.scrollView.scrollIndicatorInsets = self.scrollView.contentInset
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
