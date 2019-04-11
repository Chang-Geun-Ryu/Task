//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by CHANGGUEN YU on 11/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var paging: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.delegate = self
        
//        paging.bringSubviewToFront(paging)
    }

    @IBAction func valueChanged(_ sender: UIPageControl) {
        print(sender.currentPage)
    }
    
}

extension ViewController: UIScrollViewDelegate{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
       // print(scrollView.contentOffset)
//        print(velocity)
//        paging.currentPage
    }
    
    func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
//        print(scrollView.)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 414
//        scrollView.
        print(scrollView.contentOffset)
        print(Int(scrollView.contentOffset.x) / Int(self.view.frame.width))
        self.paging.currentPage = Int(scrollView.contentOffset.x) / Int(self.view.frame.width)
    }
}
