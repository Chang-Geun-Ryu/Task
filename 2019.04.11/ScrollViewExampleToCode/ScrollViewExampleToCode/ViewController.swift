//
//  ViewController.swift
//  ScrollViewExampleToCode
//
//  Created by CHANGGUEN YU on 11/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var scrollView: UIScrollView?
    var paging: UIPageControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scrollView = UIScrollView()
        scrollView?.delegate = self
        scrollView?.isPagingEnabled = true
        view.addSubview(scrollView!)
        
        scrollView?.translatesAutoresizingMaskIntoConstraints = false
        scrollView?.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView?.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView?.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        let red: UIView = UIView()
        red.backgroundColor = .red
        scrollView?.addSubview(red)
        
        let blue: UIView = UIView()
        blue.backgroundColor = .blue
        scrollView?.addSubview(blue)
        
        let yellow: UIView = UIView()
        yellow.backgroundColor = .yellow
        scrollView?.addSubview(yellow)
        
        let green: UIView = UIView()
        green.backgroundColor = .green
        scrollView?.addSubview(green)
        
        red.translatesAutoresizingMaskIntoConstraints = false
        red.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor).isActive = true
        red.trailingAnchor.constraint(equalTo: blue.leadingAnchor).isActive = true
        red.topAnchor.constraint(equalTo: scrollView!.topAnchor).isActive = true
        red.bottomAnchor.constraint(equalTo: scrollView!.bottomAnchor).isActive = true
        red.heightAnchor.constraint(equalTo: scrollView!.heightAnchor).isActive = true
        red.widthAnchor.constraint(equalTo: scrollView!.widthAnchor).isActive = true
        
        blue.translatesAutoresizingMaskIntoConstraints = false
        blue.leadingAnchor.constraint(equalTo: red.trailingAnchor).isActive = true
        blue.trailingAnchor.constraint(equalTo: yellow.leadingAnchor).isActive = true
        blue.topAnchor.constraint(equalTo: scrollView!.topAnchor).isActive = true
        blue.bottomAnchor.constraint(equalTo: scrollView!.bottomAnchor).isActive = true
        blue.heightAnchor.constraint(equalTo: scrollView!.heightAnchor).isActive = true
        blue.widthAnchor.constraint(equalTo: scrollView!.widthAnchor).isActive = true
        
        yellow.translatesAutoresizingMaskIntoConstraints = false
        yellow.leadingAnchor.constraint(equalTo: blue.trailingAnchor).isActive = true
        yellow.trailingAnchor.constraint(equalTo: green.leadingAnchor).isActive = true
        yellow.topAnchor.constraint(equalTo: scrollView!.topAnchor).isActive = true
        yellow.bottomAnchor.constraint(equalTo: scrollView!.bottomAnchor).isActive = true
        yellow.heightAnchor.constraint(equalTo: scrollView!.heightAnchor).isActive = true
        yellow.widthAnchor.constraint(equalTo: scrollView!.widthAnchor).isActive = true
        
        green.translatesAutoresizingMaskIntoConstraints = false
        green.leadingAnchor.constraint(equalTo: yellow.trailingAnchor).isActive = true
        green.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor).isActive = true
        green.topAnchor.constraint(equalTo: scrollView!.topAnchor).isActive = true
        green.bottomAnchor.constraint(equalTo: scrollView!.bottomAnchor).isActive = true
        green.heightAnchor.constraint(equalTo: scrollView!.heightAnchor).isActive = true
        green.widthAnchor.constraint(equalTo: scrollView!.widthAnchor).isActive = true
        
        paging = UIPageControl()
        paging?.numberOfPages = 4
        paging?.currentPage = 0
        paging?.pageIndicatorTintColor = .black
        paging?.currentPageIndicatorTintColor = .white
        view.addSubview(paging!)
        
        paging?.translatesAutoresizingMaskIntoConstraints = false
        paging?.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        paging?.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        paging?.widthAnchor.constraint(equalToConstant: 100).isActive = true
        paging?.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }


}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.paging?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
